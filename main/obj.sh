#!/bin/bash


clang_args="$@"

output="$1"
input="$2"

echo "---" $clang_args "---"
echo $output
echo $input
clang++ -x cuda --cuda-gpu-arch=sm_50 -L/usr/local/lib64 -lcudart -I/home/myhdd/HIP/include -I/home/kneternal/Work/bazel_example/examples/cpp-tutorial/stage4 -o $output -c $input
