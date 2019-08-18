#!/usr/bin/env bash

set -e

ssh-agent bash
ssh-add ~/.ssh/id_rsa

ssh-add -l
