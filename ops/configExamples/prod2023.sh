
ROOT=/data
#CERTS=$ROOT/certs

export ADMIN_EMAIL=hexmap@ucsc.edu

# Whether the server runs with nohup, or runs directly on your terminal.
#"FORE" or "BACK"
export BACK_OR_FOREGROUND=BACK

# https certificate authority chain
#export CA=$CERTS/chain.crt

# https public certificate
#export CERT=$CERTS/server.crt

# Points to the map data that will be served.
export DATA_ROOT=$ROOT/data

# Logging debug level when 1, when 0 production logging level
export DEBUG=0

# Add DRL to the path.
export DRLPATH=$HEXCALC/calc/DRL_bin

# Controls amount of chatter on server output.
export FLASK_DEBUG=0

# Username under which the data server will run, for checking existence of
# server processes.
export HEX_UID=hexmap

# User group to own server processes on protected ports.
export HEX_GID=hexdocker

# Port on which the server will listen.
export PORT=4000

# This path needs to be above or equal to your 'compute' dir in the
# file hierarchy.
export PYENV=$HEXCALC/../env

# Path to the test data root. 
export TEST_DATA_ROOT=$HEXCALC/tests/in/dataRoot

# View servers allowed to edit maps. 128.114.198.35 = hexmap.gi.ucsc.edu
export VIEW_SERVER_ADDRS=128.114.198.35

# Bookmarks are created by this view server.
export VIEWER_URL=https://tumormap.ucsc.edu

# IP socket and user view of server URL. When running in Docker, use WWW_SOCKET 0.0.0.0
export WWW_SOCKET=0.0.0.0:$PORT
export DATA_SERVER=https://hexcalc.ucsc.edu

# Path to store sqlite database needed for JobQueue
# defaults to appCtx.hubPath + '/../computeDb' when not provided
# Seems to not work right now; enable with caution
#export DATABASE_PATH=$HEXCALC/../computeDb

# If the python environment is present then open it up.
if [ -e $PYENV/bin/activate ]; then
    source $PYENV/bin/activate
fi
