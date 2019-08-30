#!/bin/bash

PUB=${1}
PRIV=${2}
DIR=${3}
NAME=${4}

echo "${PUB}" > ${DIR}/${NAME}.pub
echo "${PRIV}" > ${DIR}/${NAME}

chmod 0400 ${DIR}/${NAME}.pub
chmod 0400 ${DIR}/${NAME}

echo "{\"result\": \"ok\"}"