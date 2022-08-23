#!/bin/bash

source ../tdd.sh
source ../tcr.sh

function test_commit_on_green {
    cd $ABOUT_FOLDER/will-commit
    ./go.sh
    TTT_REPO="$ABOUT_FOLDER/will-commit"
    tcr
    committed=$(git log | grep ttt | tail -n 1 | wc -l)

    assertequals $committed 1
}

function test_revert_on_red {
    cd $ABOUT_FOLDER/will-revert
    ./go.sh
    TTT_REPO="$ABOUT_FOLDER/will-revert"
    tcr
    cat sut.spec.js
    modification=$(cat sut.spec.js | grep "syntax error" | tail -n 1 | wc -l)

    assertequals $modification 0
}