set -x
set -e

touch file.txt

(echo 'say shell("file file.txt");'; echo 'say "file.txt".IO.f;' ) | raku;
