#!/bin/bash

PROJECT_DIR=$PWD
GITLEAKS_VERSION="8.18.1"
GITLEAKS_DIR="$PWD/gitleaks-$GITLEAKS_VERSION"
GITLEAKS_EXEC="$GITLEAKS_DIR/gitleaks"
GILTEAKS_ENABLED=$(git config --global user.gitleaks.enable)

# echo "GITLEAKS_DIR: ${GITLEAKS_DIR}"
# echo "GITLEAKS_EXEC: ${GITLEAKS_EXEC}"
# echo "GILTEAKS_ENABLED: $GILTEAKS_ENABLED"

if [ "$GILTEAKS_ENABLED" == false ]; then
  echo "Gitleaks is disabled, skip validation"
  exit;
fi

if [ ! -d "$GITLEAKS_DIR" ]; then
  echo "Start downloading gitleaks"
  curl -sL https://github.com/gitleaks/gitleaks/archive/refs/tags/v8.18.1.tar.gz | tar xz
fi

while [ ! -d "$GITLEAKS_DIR" ]
do
  echo "Downloading gitleaks..."
  sleep 0.3;
done

if [ ! -f "$GITLEAKS_EXEC" ]; then
  echo "Start builing gitleaks"
  cd $GITLEAKS_DIR && make build && cd $PROJECT_DIR;
  git config --global user.gitleaks.enable true;
fi

while [ ! -f "$GITLEAKS_EXEC" ]
do
  echo "Building..."
  sleep 0.3;
done

echo "Execute gitleaks"
$GITLEAKS_EXEC protect -r gitleaks-report.json --staged -v
