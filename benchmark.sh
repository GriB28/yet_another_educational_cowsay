#!/bin/bash

tests=20
threads=6

echo "proceeding tests now..."
echo
for (( i=1; i <= $threads; i++ ))
do
    total=0
    echo "> testing at $i thread(s)"

    for (( j=1; j <= $tests; j++ ))
    do
        make clean > /dev/null
        delta=$(/usr/bin/time -f "%e" sh -c "make -j$i > /dev/null" 2>&1)
        total=$(echo "$total + $delta" | bc -l)
    done

    average=$(echo "$total / $tests" | bc -l)
    echo "> average: $(printf "%.3f" $average) s"
    echo
done
