#!/usr/bin/env bash

set -e

FILE="$1"
SOURCE="$2"
TARGET="$3"

sed -i "s/${SOURCE}/${TARGET}/g" "${FILE}"
