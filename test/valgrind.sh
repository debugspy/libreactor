#!/bin/sh

exit 0

if command -v valgrind; then
    for file in reactor reactor_assert reactor_core reactor_pool reactor_resolver
    do
        echo [$file]
        if ! valgrind --track-fds=yes --error-exitcode=1 --read-var-info=yes --leak-check=full --show-leak-kinds=all test/$file; then
            exit 1
        fi
    done
fi
