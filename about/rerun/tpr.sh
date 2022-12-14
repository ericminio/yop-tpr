#!/bin/bash

source ../dist/tdd.sh
source ../dist/tcr.sh
source ../dist/tpr.sh
source ../dist/maybe-helper.sh

function test_does_not_run_after_revert_and_pull {
    $ABOUT_FOLDER/tpr/will-pull-after-revert/go.sh
    TTT_REPO="$ABOUT_FOLDER/tpr/will-pull-after-revert/clone"
    tpr
    should=$(shouldRun)

    assertequals $should "no"
}

function test_does_run_after_rebase {
    $ABOUT_FOLDER/tpr/will-rebase/go.sh
    TTT_REPO="$ABOUT_FOLDER/tpr/will-rebase/clone"
    tpr
    should=$(shouldRun)

    assertequals $should "yes"
}

function test_does_not_run_after_prevented_conflict {
    $ABOUT_FOLDER/tpr/will-prevent-conflict/go.sh
    TTT_REPO="$ABOUT_FOLDER/tpr/will-prevent-conflict/clone"
    tpr
    should=$(shouldRun)

    assertequals $should "no"
}