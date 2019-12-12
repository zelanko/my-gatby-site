#!/bin/sh
set -e

export CHOKIDAR_USEPOLLING=1
export PORT=8000
export HOST="0.0.0.0"
export PACKAGE_MGR="yarn"

export GATSBY_DIR="/site"
# export PATH="$PATH:/usr/local/bin/gatsby"

# Initialize Gatsby or run $PACKAGE_MGR install if needed
if [ ! -f "$GATSBY_DIR/package.json" ]
then
  echo "Initializing Gatsby..."
  gatsby new $GATSBY_DIR gatsby-starter-default
else
  if [ ! -e "$GATSBY_DIR/node_modules/" ]
  then
    echo "Node modules is empty. Running $PACKAGE_MGR install..."
    $PACKAGE_MGR install
    # Peer dependencies
  fi
fi

npx gatsby develop --host $HOST --port $PORT

# Decide what to do
# if  [ "$1" == "develop" ]
# then
#   rm -rf $GATSBY_DIR/public
#   gatsby develop --host $HOST --port $PORT
# elif  [ "$1" == "build" ]
# then
#   rm -rf $GATSBY_DIR/public
#   gatsby build
# elif  [ "$1" == "stage" ]
# then
#   rm -rf $GATSBY_DIR/public
#   gatsby build
#   gatsby serve --host $HOST --port $PORT

# else
#   exec $@
# fi
# fi
