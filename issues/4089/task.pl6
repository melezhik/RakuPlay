say "{root_dir()}/task.pl6".slurp;

my @needles = "foo";
do given any(@needles) {
    when "foo" { say "OK"  };
    default    { say "wut" };
};
