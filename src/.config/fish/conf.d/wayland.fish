#!/usr/bin/env fish

set -gx QT_QPA_PLATFORM wayland-egl
set -gx CLUTTER_BACKEND wayland
set -gx SDL_VIDEODRIVER wayland
set -gx MOZ_ENABLE_WAYLAND 1
set -gx _JAVA_AWT_WM_NONREPARENTING 1
set -gx WLR_NO_HARDWARE_CURSORS 1
