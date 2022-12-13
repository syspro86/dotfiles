#!/bin/bash
set -eu
[ ! -e $HOME/.ssh/id_rsa.pub ] && ssh-keygen

GITHUB_PUBKEY=`cat $HOME/.ssh/id_rsa.pub`

read -p 'GitHub Personal Access Token: ' GITHUB_PAT
echo

curl -XPOST \
  -H "Content-Type: application/json" \
  -H "Authorization: token $GITHUB_PAT" \
  -d "{\"title\": \"$USER@$(hostname)\", \"key\": \"$GITHUB_PUBKEY\"}" \
  "https://api.github.com/user/keys"
