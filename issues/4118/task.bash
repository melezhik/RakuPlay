set -x
set -e

raku --version

raku -e "say qq{===};
  say [⊖] (1,2,3), (1,2,3), (1,2,3);
  say [⊖] (0,1,2), (0,1,2), (0,1,2);
  say qq{===}
" 2>&1;

