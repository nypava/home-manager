#!/usr/bin/env bash 
tmux list-sessions -F '#{session_id} #{session_name}' | sort | awk '{print $2}' | tr '\n' ' ' | sed "s/$(tmux display -p '#S')/[$(tmux display -p '#S')\]/g"
