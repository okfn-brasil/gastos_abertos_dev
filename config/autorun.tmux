#!/usr/bin/tmux source-file

new-session -d
split-window -d -t 0 -v
split-window -d -t 0 -h
split-window -d -t 0 -v
split-window -d -t 2 -v

send-keys -t 0 'workon api' enter C-l
send-keys -t 0 'python manage.py run --host=0.0.0.0' enter

send-keys -t 1 'workon website' enter C-l

send-keys -t 2 'workon website' enter C-l
send-keys -t 2 'fab run_local run_server' enter

send-keys -t 3 'workon api' enter C-l

## Just a convenience shell
send-keys -t 4 '' enter C-l
select-pane -t 4

attach
