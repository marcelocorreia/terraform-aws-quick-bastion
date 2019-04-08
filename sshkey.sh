#!/usr/bin/env bash

set -e

#eval "$(jq -r '@sh "export KEY_NAME=\(.KEY_NAME) WORKDIR=\(.WORKDIR) FORCE_CREATION=\(.FORCE_CREATION)  "')"

echo ${FORCE_CREATION} > /tmp/force

cd ${WORKDIR}

function error_exit() {
  echo "$1" 1>&2
  exit 1
}

function create_keys(){
	cd ${WORKDIR}
	if [ -f "${KEY_PATH}" ] && [[ "${FORCE_CREATION}" == 0  || "${FORCE_CREATION}" == "false" ]];then
		result
	else
		rm -rf "${KEY_PATH}"
		ssh-keygen -b 2048 -t rsa -f ./keys/${KEY_NAME} -q -N "" &>/dev/null
		chmod 400 ./keys/${KEY_NAME}
	fi
	result
}

function result(){
	jq -n --arg key_path ${WORKDIR}/keys --arg key_name ${KEY_NAME} '{key_path: $key_path,key_name: $key_name}'
	exit 0
}

create_keys || error_exit

