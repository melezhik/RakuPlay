
#!raku

say "==================================================";
say "[https://github.com/rakudo/rakudo/issues/4363]";
say "==================================================
";

=begin tomty
%(
  tag => $["regression"]
);
=end tomty

task-run "4363";

