#!/usr/bin/env fish

set -g QT_QPA_PLATFORM wayland-egl
set -g CLUTTER_BACKEND wayland
set -g SDL_VIDEODRIVER wayland
set -g MOZ_ENABLE_WAYLAND 1
set -g _JAVA_AWT_WM_NONREPARENTING 1
