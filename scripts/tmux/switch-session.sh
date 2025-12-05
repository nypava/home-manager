#!/usr/bin/env bash
index=$(($1 - 1))
tmux switch-client -t \$$index
