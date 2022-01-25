#!/bin/bash
SCRIPT_DIR=$(dirname $0)
cd $SCRIPT_DIR
mkdir -p /workspace/userbins
cp workspaceinit buildtwrp /workspace/userbins/
# Install repo
curl https://storage.googleapis.com/git-repo-downloads/repo | tee /workspace/userbins/repo >/dev/null
chmod +x /workspace/userbins/*
bash /workspace/userbins/workspaceinit "$@" && exit $?