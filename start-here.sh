#!/bin/sh

DEV_PATH="/cygdrive/c/Users/bucchric/workspace/tecnoargilla"

## SERVICES

tmux new-window -a -n services 
tmux new-session -d -s services
tmux selectp -t services
tmux split-window -v

tmux select-pane -t 0
tmux send-keys "cd $DEV_PATH/here-services-core" C-m

tmux select-pane -t 1 
tmux send-keys "cd $DEV_PATH/here-database-sqlserver" C-m

## CORE LIBRARIES

tmux new-window -a -n core
tmux selectp -t core
tmux split-window -v
tmux split-window -v
tmux split-window -v
tmux select-layout tiled 

tmux select-pane -t 0
tmux send-keys "cd $DEV_PATH/here-backend-core" C-m

tmux select-pane -t 1
tmux send-keys "cd $DEV_PATH/here-backend-core-model" C-m

tmux select-pane -t 2
tmux send-keys "cd $DEV_PATH/here-backend-core-repository-inmemory" C-m

tmux select-pane -t 3
tmux send-keys "cd $DEV_PATH/here-backend-core-repository-sqlserver" C-m

## BACKENDS

tmux new-window -a -n backend
tmux selectp -t backend
tmux split-window -v
tmux split-window -v
tmux split-window -v
tmux select-layout tiled

tmux select-pane -t 0
tmux send-keys "cd $DEV_PATH/here-backend-articles" C-m

tmux select-pane -t 1
tmux send-keys "cd $DEV_PATH/here-backend-orders" C-m

tmux select-pane -t 2
tmux send-keys "cd $DEV_PATH/here-backend-bays" C-m

tmux select-pane -t 3
tmux send-keys "cd $DEV_PATH/here-backend-parkings" C-m

## FRONTENDS

tmux new-window -a -n frontend
tmux selectp -t frontend
tmux split-window -v
tmux split-window -v
tmux split-window -v
tmux select-layout tiled

tmux select-pane -t 0
tmux send-keys "cd $DEV_PATH/here-frontend-articles" C-m

tmux select-pane -t 1
tmux send-keys "cd $DEV_PATH/here-frontend-orders" C-m

tmux select-pane -t 2
tmux send-keys "cd $DEV_PATH/here-frontend-bays" C-m

tmux select-pane -t 3
tmux send-keys "cd $DEV_PATH/here-frontend-parkings" C-m


tmux attach -t services
