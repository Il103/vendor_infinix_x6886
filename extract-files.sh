#!/bin/bash
#
# extract-files.sh - Extract proprietary blobs from device or dump
#

set -e

export VENDOR=infinix
export DEVICE=X6886
export DEVICE_BASE_DIR=../../../vendor/$VENDOR/$DEVICE
export BLOB_DIR=$DEVICE_BASE_DIR/proprietary

# Remove old blobs
rm -rf $BLOB_DIR/*

# Extract from dump
if [ -d "/tmp/stock-dump" ]; then
    echo "Extracting from stock ROM dump..."
    cp -rf /tmp/stock-dump/vendor/* $BLOB_DIR/vendor/
    echo "Done! Extracted all blobs from dump."
else
    echo "ERROR: Stock ROM dump not found at /tmp/stock-dump"
    echo "Clone it first:"
    echo "  git clone -b dump-infinix-infinix-x6886-165004 https://gitlab.com/Il103/stock-rom-dumps.git"
    exit 1
fi

# Generate makefiles
cd $DEVICE_BASE_DIR/../../..
. build/envsetup.sh
python3 device/$VENDOR/$DEVICE/setup-makefiles.py

echo "Blob extraction complete!"
