#!usr/bin/perl -w

#exo 4 : Trinome : Amiot Tanguy / Chaouche Zineb / Singh Jaswinder
sub freqApparition{
	my($fichier)= @_; # $$ : process number
	open(FH, '<', $fichier) or die $!;
	%listUnique=();
	while(<FH>){
   		chomp;
   		@mots = split(/ /, $_);
   		chomp(@mots);
		#pour chaque mots trouver incrémente sa fréquence d'appartion dans la liste
   		foreach $unmot (@mots){
        		if (exists($listUnique{$unmot})){
        	    		$listUnique{$unmot}++;
        		}
			else{
            			$listUnique{$unmot}=1;
       			}
 		}
	}
	print "le fichier contient : \n";
	foreach $key (sort keys %listUnique){
     		if($listUnique{$key} ne " "){
        		print "$key = $listUnique{$key} \n";
     		}
	}
	close(FH);	
}

#prend en parametre le fichier txt duquel il doit lire le contenu
freqApparition("fichier.txt");
