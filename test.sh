#!/bin/bash

if [ "$1" == "reload" ]; then
    racket src/test.rkt src/sql
    ./run.sh src/sql/test.db
elif [ -z "$1" ]; then
    ./run.sh src/sql/test.db
fi

racket "$1" src/sql/test.db
