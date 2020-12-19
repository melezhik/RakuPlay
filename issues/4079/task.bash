set -e

cat $root_dir/task.bash

touch file.txt

(echo 'say shell("file file.txt");'; echo 'say "file.txt".IO.f;' ) | raku;
