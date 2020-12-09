set -x
set -e

raku -e 'dd Int => *.Int; dd (Int) => *.Int;'
