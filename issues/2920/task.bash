set -x
set -e
raku --version

raku -e "say '>>>'; { (2, 4 ... 1_000_000).gist; say (now - ENTER now).Int }; say '<<<'"


