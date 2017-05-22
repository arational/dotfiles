#!/bin/sh

# HACK: Wait a little bit, it seems the window manager didn't startup
# completely until now
sleep 5

# Make modification environment variables visible for systemd user services
systemctl --user import-environment

# Activate the window-manager systemd-target to run services which
# dependent on a window manager
systemctl --user start window-manager.target

# Start the tmux client
i3-sensible-terminal -class tmux -e tmux_session &

# Toggle xcape
toggle_xcape
