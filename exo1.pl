#!usr/bin/perl

#exo 1 TP  Trinome : Amiot Tanguy | Chaouche Zineb | Singh Jaswinder
# %ENV les variables d'environnements, sort qui trie par ordre alphabétique
foreach $key (sort keys %ENV) {
  print "$key = $ENV{$key}\n";
}

