#!bash

set -x
set -e

rm -rf .tomty/*.pl6

for i in $(ls -1 | grep -v tasks); do
  run_task "tomty-gen" i $i
done

