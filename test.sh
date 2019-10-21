if [ "$1" == "reload" ]; then
    racket src/test.rkt src/sql
fi

./run.sh src/sql/test.db
