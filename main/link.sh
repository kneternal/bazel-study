#!/bin/bash



clang_args="$@"

echo "---" $clang_args "---"

clang++ $1 $2 $3 $4 $5 -o $6
