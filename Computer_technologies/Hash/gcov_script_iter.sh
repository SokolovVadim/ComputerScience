#!/bin/bash
for i in {1..500}
do
	echo "test number" $i
	./a.out
	gcov hash_iterators.c
done
