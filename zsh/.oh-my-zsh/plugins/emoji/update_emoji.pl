#!/usr/bin/perl -w
#
# update_emoji.pl
#
# This script generates the emoji.plugin.zsh emoji definitions from the Unicode
# character data for the emoji characters.
#
# The data file can be found at https://unicode.org/Public/emoji/latest/emoji-data.txt
# as referenced in Unicode TR51 (https://www.unicode.org/reports/tr51/index.html).
#
# This is known to work with the data file from version 1.0. It may not work with later
# versions if the format changes. In particular, this reads line comments to get the
# emoji character name and unicode version.
#
# Country names have punctuation and other non-letter characters removed from their name,
# to avoid possible complications with having to escape the strings when using them as
# array subscripts. The definition file seems to use some combining characters like accents
# that get stripped during this process.

use strict;
use warnings;
use 5.010;
use autodie;

use Path::Class;
use File::Copy;

# Parse definitions out of the data file and convert
sub process_emoji_data_file {
	my ( $infile, $outfilename ) = @_;
	my $file = file($infile);
	my $outfile = file($outfilename);
	my $outfilebase = $outfile->basename();
	my $tempfilename = "$outfilename.tmp";
	my $tempfile = file($tempfilename);
	my $outfh = $tempfile->openw();
	$outfh->print("
# $outfilebase - Emoji character definitions for oh-my-zsh emoji plugin
#
# This file is auto-generated by update_emoji.pl. Do not edit it manually.
#
# This contains the definition for:
#   \$emoji         - which maps character names to Unicode characters
#   \$emoji_flags   - maps country names to Unicode flag characters using region indicators

# Main emoji
typeset -gAH emoji
# National flags
typeset -gAH emoji_flags
# Combining modifiers
typeset -gAH emoji_mod

");

	my $fh = $file->openr();
	my $line_num = 0;
	while ( my $line = $fh->getline() ) {
		$line_num++;
		$_ = $line;
		# Skip all-comment lines (from the header) and blank lines
		# (But don't strip comments on normal lines; we need to parse those for
		# the emoji names.)
		next if /^\s*#/ or /^\s*$/;

		if (/^(\S.*?\S)\s*;\s*(\w+)\s*;\s*(\w+)\s*;\s*(\w+)\s*;\s*(\w.*?)\s*#\s*V(\S+)\s\(.*?\)\s*(\w.*\S)\s*$/) {
			my ($code, $style, $level, $modifier_status, $sources, $version, $keycap_name)
				= ($1, $2, $3, $4, $5, $6, $7);
			#print "code=$code style=$style level=$level modifier_status=$modifier_status sources=$sources version=$version name=$keycap_name\n";
			my @code_points = split /\s+/, $code;
			my @sources = split /\s+/, $sources;

			my $flag_country = "";
			if ( $keycap_name =~ /^flag for (\S.*?)\s*$/) {
				$flag_country = $1;
			}

			my $zsh_code = join '', map { "\\U$_" } @code_points;
			# Convert keycap names to valid associative array names that do not require any
			# quoting. Works fine for most stuff, but is clumsy for flags.
			my $omz_name = lc($keycap_name);
			$omz_name =~ s/[^A-Za-z0-9]/_/g;
			my $zsh_flag_country = $flag_country;
			$zsh_flag_country =~ s/[^\p{Letter}]/_/g;
			if ($flag_country) {
				$outfh->print("emoji_flags[$zsh_flag_country]=\$'$zsh_code'\n");
			} else {
				$outfh->print("emoji[$omz_name]=\$'$zsh_code'\n");
			}
			# Modifiers are included in both the main set and their separate map,
			# because they have a standalone representation as a color swatch.
			if ( $modifier_status eq "modifier" ) {
				$outfh->print("emoji_mod[$omz_name]=\$'$zsh_code'\n");
			}
		} else {
			die "Failed parsing line $line_num: '$_'";
		}
	}
	$fh->close();
	$outfh->print("\n");
	$outfh->close();

	move($tempfilename, $outfilename)
		or die "Failed moving temp file to $outfilename: $!";
}

my $datafile = "emoji-data.txt";
my $zsh_def_file = "emoji-char-definitions.zsh";
process_emoji_data_file($datafile, $zsh_def_file);

print "Updated definition file $zsh_def_file\n";



