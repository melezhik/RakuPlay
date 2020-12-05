set -x
raku -e 'sub foo($x is rw) { }; foo(1)' 2>&1
