#!/bin/bash

function verify () {
    bash -c "./tests/postconditions/$1.sh" > tests.current
    diff tests.current "tests/postconditions/$1.out" -Z
    rm tests.current
    # echo "Completed Verification of Query $1" > /dev/null
}

function do_test () {
    bash -c "./test.sh" < "tests/$1.in" > tests.current
    diff tests.current "tests/$1.out"
    rm tests.current
    # echo "Completed Test of Query $1"
}

racket src/test.rkt src/sql
do_test 7
verify 7
do_test 8
do_test 3
verify 3
