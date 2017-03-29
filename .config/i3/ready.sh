#!/bin/sh

# HACK: Wait a little bit, it seems the window manager didn't startup
# completely until now
sleep 5

# Activate the window-manager systemd-target to run services which
# dependent on a window manager
systemctl --user start window-manager.target
