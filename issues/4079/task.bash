set -x
set -e

touch file.txt

(echo 'shell("file file.txt");'; echo '"file.txt".IO.f;' ) | raku;
