#!/bin/bash

cd ~/dotfiles

UPSTREAM=${1:-'@{u}'}
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse "$UPSTREAM")
BASE=$(git merge-base @ "$UPSTREAM")

if [ $LOCAL = $REMOTE ]; then
    exit
elif [ $LOCAL = $BASE ]; then
  echo "There are changes in dotfiles to be updated."
  git --no-pager diff origin/master
  read -p "Do you want to pull the latest changes? (y/n) " choice
  case "$choice" in 
    y|Y ) git pull;;
    n|N ) echo "Skipping pull.";;
    * ) echo "Invalid input.";;
  esac
elif [ $REMOTE = $BASE ]; then
  echo "There are changes to be pushed."
  git --no-pager diff --stat origin/master
  read -p "Do you want to push the latest changes? (y/n) " choice
  case "$choice" in 
    y|Y ) git push;;
    n|N ) echo "Skipping push.";;
    * ) echo "Invalid input.";;
  esac
else
    echo "Diverged"
fi

