#!usr/bin/perl -w

sub freqApparition{
	my($fichier)= @_; # $$ : process number
	open(FH, '<', $fichier) or die $!;
	%listUnique=();
	while(<FH>){
   		chomp;
   		@mots = split(/ /, $_);
   		chomp(@mots);
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

freqApparition("fichier.txt");
