#!/usr/bin/env bash

export USER=jupyter
export HOME=/home/$USER

uid=$(stat -c "%u" .)
gid=$(stat -c "%g" .)

if [ ${uid} -ne 0 ]; then
	if [ $(id -g ${USER}) -ne ${gid} ]; then
		getent group ${gid} > /dev/null @>&1 || groupmod -g ${gid} ${USER}
		chgrp -R ${gid} ${HOME}
	fi
	if [ $(id -u ${USER}) -ne ${uid} ]; then
		usermod -u ${uid} ${USER}
	fi
fi

exec setpriv --reuid=${USER} --regid=${USER} --init-groups "$@"
