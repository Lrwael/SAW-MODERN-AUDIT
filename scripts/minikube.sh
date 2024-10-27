#/bin/bash

MINIKUBE_PROCESS="$(ps aux | grep minikube | grep -v grep | awk '{print $2}')"

if [ -z "$MINIKUBE_PROCESS"  ]; then
	START_MINIKUBE="$(minikube start &)"
	RET_CODE=$?

	if [ $RET_CODE -ne 0 ]; then
		echo "Failed to start minikube - $RET_CODE"
	fi
fi
