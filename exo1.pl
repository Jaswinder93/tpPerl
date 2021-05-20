#!usr/bin/perl

# %ENV les variables d'environnements, sort qui trie par ordre alphabétique
foreach $key (sort keys %ENV) {
  print "$key = $ENV{$key}\n";
}

