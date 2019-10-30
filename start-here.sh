#!/bin/sh

DEV_PATH="/mnt/c/bitbucket-sacmi/here"
SESSION="HERE"

tmux attach -t $SESSION || echo "Peggio di windows c'è solo nuova sima " | cowsay && tmux new-session -d -s $SESSION

## SERVICES
WINDOW="services"
tmux rename-window -t $SESSION:0 $WINDOW
tmux split-window -v -t $SESSION
tmux select-layout -t $SESSION:$WINDOW tiled

tmux select-pane -t $SESSION:$WINDOW.0
tmux send-keys "cd $DEV_PATH/here-services-core" C-m

tmux select-pane -t $SESSION:$WINDOW.1
tmux send-keys "cd $DEV_PATH/here-database-sqlserver" C-m

## CORE LIBRARIES
WINDOW="core"
tmux new-window -t $SESSION -n $WINDOW
tmux split-window -v -t $SESSION
tmux split-window -v -t $SESSION
tmux split-window -v -t $SESSION
tmux select-layout -t $SESSION:$WINDOW tiled

tmux select-pane -t $SESSION:$WINDOW.0
tmux send-keys "cd $DEV_PATH/here-backend-core" C-m

tmux select-pane -t $SESSION:$WINDOW.1
tmux send-keys "cd $DEV_PATH/here-backend-core-model" C-m

tmux select-pane -t $SESSION:$WINDOW.2
tmux send-keys "cd $DEV_PATH/here-backend-core-repository-inmemory" C-m

tmux select-pane -t $SESSION:$WINDOW.3
tmux send-keys "cd $DEV_PATH/here-backend-core-repository-sqlserver" C-m

## BACKENDS
WINDOW="backend"
tmux new-window -t $SESSION -n $WINDOW
tmux split-window -v -t $SESSION
tmux split-window -v -t $SESSION
tmux split-window -v -t $SESSION
tmux split-window -v -t $SESSION
tmux select-layout -t $SESSION:$WINDOW tiled

tmux select-pane -t $SESSION:$WINDOW.0
tmux send-keys "cd $DEV_PATH/here-backend-articles" C-m

tmux select-pane -t $SESSION:$WINDOW.1
tmux send-keys "cd $DEV_PATH/here-backend-orders" C-m

tmux select-pane -t $SESSION:$WINDOW.2
tmux send-keys "cd $DEV_PATH/here-backend-bays" C-m

tmux select-pane -t $SESSION:$WINDOW.3
tmux send-keys "cd $DEV_PATH/here-backend-parkings" C-m

tmux select-pane -t $SESSION:$WINDOW.4
tmux send-keys "cd $DEV_PATH/here-backends" C-m

## FRONTENDS
WINDOW="frontend"
tmux new-window -t $SESSION -n $WINDOW
tmux split-window -v -t $SESSION
 # tmux split-window -v -t $SESSION
 # tmux split-window -v -t $SESSION
 # tmux split-window -v -t $SESSION
tmux select-layout -t $SESSION:$WINDOW tiled

# tmux select-pane -t $SESSION:$WINDOW.0
# tmux send-keys "cd $DEV_PATH/here-frontend-articles" C-m
# 
# tmux select-pane -t $SESSION:$WINDOW.1
# tmux send-keys "cd $DEV_PATH/here-frontend-orders" C-m
# 
# tmux select-pane -t $SESSION:$WINDOW.2
tmux select-pane -t $SESSION:$WINDOW.0
tmux send-keys "cd $DEV_PATH/here-frontend-bays" C-m
# 
# tmux select-pane -t $SESSION:$WINDOW.3
# tmux send-keys "cd $DEV_PATH/here-frontend-parkings" C-m

# tmux select-pane -t $SESSION:$WINDOW.4
tmux select-pane -t $SESSION:$WINDOW.1
tmux send-keys "cd $DEV_PATH/here-frontends" C-m

tmux attach -t $SESSION
