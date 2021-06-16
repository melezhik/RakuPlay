#!bash

set -x
set -e

rm -rf .tomty/*.pl6

for i in $(ls -1 | grep -v tasks); do

  cat << EOF > .tomty/$i.pl6
#!raku

say "==================================================";
say "[https://github.com/rakudo/rakudo/issues/$i]";
say "==================================================\n\n";

task-run "$i";

EOF

done

