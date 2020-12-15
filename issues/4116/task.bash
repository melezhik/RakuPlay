set -x

raku -e 'enum Foo <Bar Baz>; sub foo(Foo(Str) $foo) { dd $foo }; foo("Bar")'

echo
