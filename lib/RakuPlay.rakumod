use v6;

unit module RakuPlay;

use YAMLish;

sub queue-build ( %params ) is export {

  my $os = %params<os>;
  my $code = %params<code>;
  my $modules = %params<modules>;
  my $rakudo_version = %params<rakudo_version> || "default";
  my $rakudo-version-mnemonic = %params<rakudo-version-mnemonic>;

  my $user = "rakuplay-$rakudo-version-mnemonic";

  my $description =  "RakuPlay, $rakudo-version-mnemonic Rakudo version";

  my $rnd = ('a' .. 'z').pick(20).join('');

  my $id = "{$rnd}{$*PID}";

  my $effective-dir = "{%*ENV<HOME>}/projects/RakuPlay/.cache/{$id}";

  mkdir $effective-dir;

  copy "runners/default/sparrowfile", "{$effective-dir}/sparrowfile";

  spurt "$effective-dir/code.raku", $code;
  spurt "$effective-dir/Rakufile", $modules;

  spurt "$effective-dir/config.pl6", "%(
    user => '$user',
    rakudo_version => '$rakudo_version'
);\n";


  my $sparky-dir = "{%*ENV<HOME>}/projects/RakuDist/sparky/RakuPlay-{(1 .. 3).pick(1)}";

  mkdir "{$sparky-dir}/.triggers/";

  spurt "{$sparky-dir}/.triggers/$id", "%(
    cwd =>  '$effective-dir',
    sparrowdo => %( conf => 'config.pl6', docker => '{$os}-rakudist', bootstrap => False, no_index_update => False, no_sudo => True,   ),
    description => '$description',
);\n";

  say "queue build: {$sparky-dir}/.triggers/$id: ",
      "{$sparky-dir}/.triggers/$id".IO.slurp;

  return $id


}

sub get-webui-conf is export {

  my $conf-file = %*ENV<HOME> ~ '/rakuplay-web.yaml';

  my %conf = $conf-file.IO ~~ :f ?? load-yaml($conf-file.IO.slurp) !! Hash.new;

  warn "RakuPlay web conf loaded: ", $conf-file;

  %conf;

}

