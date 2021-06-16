
#!raku

say "==================================================";
say "[https://github.com/rakudo/rakudo/issues/2920]";
say "==================================================
";

=begin tomty
%(
  tag => $["regression"]
);
=end tomty

task-run "2920";

