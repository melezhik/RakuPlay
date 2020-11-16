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

  my $effective-dir = "{%*ENV<HOME>}/projects/RakuPlay/.cache/{$user}";

  mkdir $effective-dir;

  spurt "$effective-dir/code.raku", $code;
  spurt "$effective-dir/Rakufile", $modules;

  spurt "$effective-dir/config.pl6", "%(
    user => '$user',
    rakudo_version => '$rakudo_version'
   )";


  mkdir "{%*ENV<HOME>}/projects/RakuPlay/sparky/$os/.triggers/";

  my $rnd = ('a' .. 'z').pick(20).join('');

  my $id = "{$rnd}{$*PID}";

  spurt "{%*ENV<HOME>}/projects/RakuPlay/sparky/$os/.triggers/$id", "%(
    cwd =>  '$effective-dir',
    sparrowdo => %( conf => 'config.pl6' ),
    description => '$description',
  )";

  say "queue build: {%*ENV<HOME>}/projects/RakuPlay/sparky/$os/.triggers/$id: ",
      "{%*ENV<HOME>}/projects/RakuPlay/sparky/$os/.triggers/$id".IO.slurp;

  return $id


}

sub get-webui-conf is export {

  my $conf-file = %*ENV<HOME> ~ '/rakuplay-web.yaml';

  my %conf = $conf-file.IO ~~ :f ?? load-yaml($conf-file.IO.slurp) !! Hash.new;

  #warn "RakuPlay web conf loaded: ", $conf-file;

  %conf;

}

