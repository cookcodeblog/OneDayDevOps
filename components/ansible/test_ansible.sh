#!/usr/bin/env bash

# check version
ansible --version

# ping
ansible all -m ping
