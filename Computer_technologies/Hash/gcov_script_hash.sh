#!/bin/bash
for i in {1..5}
do
	./a.out
	gcov hash.c
done
