#!/usr/bin/env fish

# GitHub remote add
function ghra
    command git remote add origin ssh://git@github.com/$argv.git
end
