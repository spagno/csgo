#!/bin/bash

if [ $# -lt 3 ]
then
  echo "Usage: $0 <port> <steamaccount> <desc>"
  exit 1
fi

PORT=$1
STEAMACCOUNT=$2
((TV_PORT = $PORT + 5))
DESC=$3

TEMPLATE_DEPLOY=./deploy_csgo.yaml.tmpl
TEMPLATE_PVC=./pvc_csgo.yaml.tmpl

if [ ! -d templates ]
then
  mkdir templates
fi

cat $TEMPLATE_DEPLOY | sed -e "s/PORT_VAR/$PORT/g" -e "s/TV_VAR/$TV_PORT/g" -e "s/STEAMACCOUNT/$STEAMACCOUNT/g" > templates/deploy_csgo_${PORT}_${DESC}.yaml
cat $TEMPLATE_PVC | sed -e "s/PORT_VAR/$PORT/g" -e "s/TV_VAR/$TV_PORT/g" -e "s/STEAMACCOUNT/$STEAMACCOUNT/g" > templates/pvc_csgo_${PORT}_${DESC}.yaml
