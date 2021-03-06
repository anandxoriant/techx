#!/usr/bin/env sh

# Cleanup the dist directory
rm -rf dist/*

BASEDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
# Build TechX Calculator egg
source $BASEDIR/build.sh

EGG_FILE=$(ls dist/TechX_Calculator*.egg | cut -d "/" -f 2)
VERSION=$(echo $EGG_FILE | cut -d "-" -f 2)

echo "TECHX_CALCULATOR_EGG_FILE=$EGG_FILE" > dist/techx_calculator.deploy.properties
echo "TECHX_CALCULATOR_VERSION_NUMBER=$VERSION" >> dist/techx_calculator.deploy.properties

docker build --tag="calculator" .
