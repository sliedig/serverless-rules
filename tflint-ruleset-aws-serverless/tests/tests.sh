#!/bin/bash

set -e

FOLDER=$1
TESTS_FOLDER=$FOLDER/tests

# Test if the folder exists
if [ ! -d "$FOLDER" ]; then
    echo "Folder $FOLDER does not exist"
    exit 1
fi

# Build the latest version of the tflint ruleset
setup_tests() {
    echo "Build tflint plugin"
    pushd $FOLDER
    go build
    mkdir -p $TESTS_FOLDER/.tflint.d/plugins
    mv tflint-ruleset-aws-serverless $TESTS_FOLDER/.tflint.d/plugins/
    popd
}

# Run all integration tests
run_tests() {
    pushd $TESTS_FOLDER
    for test in $TESTS_FOLDER/*.tf; do
        btest=$(basename "$test")
        echo -n "Running test $test..."
        readarray -d . -t testarr <<< $btest
        if [[ ${testarr[1]} == "pass" ]]; then
            tflint --config $TESTS_FOLDER/tflint.hcl --only ${testarr[0]} $test > /dev/null && ( echo " pass" ) || ( echo " failed" && return 1 )
        else
            tflint --config $TESTS_FOLDER/tflint.hcl --only ${testarr[0]} $test > /dev/null && ( echo " failed" && return 1 ) || ( echo " pass" )
        fi
    done
    popd
}

setup_tests
run_tests