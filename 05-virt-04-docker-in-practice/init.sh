#!/bin/bash

scp  run_app.sh user@<ip>:$HOME/run_app.sh

ssh user@<ip> chmod +x $HOME/run_app.sh

ssh user@<ip>  sudo bash $HOME/run_app.sh