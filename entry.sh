#!/bin/sh
set -e

export GATSBY_DIR="/site"
# export PATH="$PATH:/usr/local/bin/gatsby"

# Initialize Gatsby or run NPM install if needed
if [ ! -f "$GATSBY_DIR/package.json" ]
then
  echo "Initializing Gatsby..."
  gatsby new $GATSBY_DIR gatsby-starter-default
else
  if [ ! -e "$GATSBY_DIR/node_modules/" ]
  then
    echo "Node modules is empty. Running npm install..."
    npm install git
    # Peer dependencies
    npm install \
      eslint-plugin-jsx-a11y@6.x \
      eslint-plugin-react@7.x \
      eslint@^6.0.0 \
      express@^4.16.2 \
      typescript \
      ink@^2.0.0 \
  fi
fi

# Decide what to do
if  [ "$1" == "develop" ]
then
  rm -rf $GATSBY_DIR/public
  gatsby develop --host 0.0.0.0 --port 8000

elif  [ "$1" == "build" ]
then
  rm -rf $GATSBY_DIR/public
  gatsby build
elif  [ "$1" == "stage" ]
then
  rm -rf $GATSBY_DIR/public
  gatsby build
  gatsby serve --host 0.0.0.0 --port 8000

else
  exec $@
fi
fi
