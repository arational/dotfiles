#!/bin/sh
open-pass-tomb
notify-send 'Mailbox Synchronization manually triggered ...'
systemctl --user start mbsync.service
