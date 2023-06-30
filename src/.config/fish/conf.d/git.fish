#!/usr/bin/env fish

function ga
    command git add $argv
end

function gaa
    command git add -A $argv
end

function gc
    command git commit $argv
end

function gca
    command git commit -a $argv
end

function gcam
    command git commit -a -m $argv
end

function gcm
    command git commit -m $argv
end

function gp
    command git push $argv
end

function gpo
    command git push --set-upstream origin (git branch --show-current)
end

function gs
    command git status $argv
end
