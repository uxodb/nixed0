#!/usr/bin/env bash

COUNT=$(swaync-client -In)
ENABLED=
DISABLED=
if [ $COUNT != 0 ]; then DISABLED="$COUNT  "; fi
if swaync-client -D | grep -q "true" ; then echo $ENABLED; else echo $DISABLED; fi
