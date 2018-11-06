#!/bin/bash


hipify-clang $@ -o "$@.o" -- -x cuda
