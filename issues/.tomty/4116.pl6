
#!raku

say "==================================================";
say "[https://github.com/rakudo/rakudo/issues/4116]";
say "==================================================
";

=begin tomty
%(
  tag => $["regression"]
);
=end tomty

task-run "4116";

