#!/bin/bash

LOCKFILE="/tmp/screencast.lock"
PIDFILE="/tmp/screencast.pid"

OUTDIR="$HOME/Videos/Screencasts"
INDICATOR="$HOME/.dotfiles/scripts/record_indicator.py"

mkdir -p "$OUTDIR"

# Try to acquire the recording lock.
exec 9>"$LOCKFILE"

if ! flock -n 9; then
    # Already recording.
    if [[ -f "$PIDFILE" ]]; then
        RECORDER_PID=$(cat "$PIDFILE")

        kill -INT "$RECORDER_PID" 2>/dev/null

        pkill -f "$INDICATOR" 2>/dev/null

        rm -f "$PIDFILE"
    fi

    exit 0
fi

FILE="$OUTDIR/screencast_$(date '+%Y-%m-%d_%H-%M-%S').mp4"

if [[ "$1" == "--region" ]]; then
    GEOMETRY=$(slurp) || exit 0
    wf-recorder -g "$GEOMETRY" -f "$FILE" &
else
    wf-recorder -f "$FILE" &
fi

RECORDER_PID=$!

echo "$RECORDER_PID" > "$PIDFILE"

python "$INDICATOR" &

exit 0
