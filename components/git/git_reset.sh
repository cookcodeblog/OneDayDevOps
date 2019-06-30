#!/usr/bin/env bash

set -e

git fetch origin
git reset --hard origin/master

git pull
