#!/bin/bash

BACKEND=$1

MY_STATUS=$(/bin/varnishadm backend.list $BACKEND 2>/dev/null | tail -n1)

echo "$MY_STATUS" | grep 'Healthy' >/dev/null
if [[ $? -eq 0 ]]
then
    echo "OK: $MY_STATUS"
    exit 0
fi

echo "ERROR: $MY_STATUS"
exit 2
