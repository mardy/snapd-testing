#!/bin/bash
set -x

echo "Getting spread"

SPREAD_URL=$1
SPREAD_DIR="$(pwd)"

if [ -f "$SPREAD_DIR/spread" ]; then
    echo "Spread already downloaded"
else
    mkdir -p "$SPREAD_DIR"
    SPREAD_NAME="$(basename $SPREAD_URL)"
    wget -q -P "$SPREAD_DIR" "$SPREAD_URL"
    if [[ "$SPREAD_NAME" =~ .*.tar.gz ]]; then
        ( cd "$SPREAD_DIR" && tar xzvf "$SPREAD_NAME" )
    elif [ "$SPREAD_NAME" != "spread" ]; then
        mv "$SPREAD_DIR/$SPREAD_NAME" "$SPREAD_DIR/spread"
    fi
    if [[ ! -x "$SPREAD_DIR/spread" ]]; then
        chmod +x "$SPREAD_DIR/spread"
    fi
    echo "Spread downloaded and ready to be used"
fi

