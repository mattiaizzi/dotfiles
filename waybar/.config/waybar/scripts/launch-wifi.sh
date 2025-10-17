#!/bin/bash
# ln -s /full/path/to/myscript.sh /usr/bin/myscript
exec setsid uwsm app -- kitty --class=NmTUI -e nmtui "$@"
