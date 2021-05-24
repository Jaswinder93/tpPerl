#!usr/bin/perl -w


sub replace {
      my ($from,$to,$string) = @_;
      $string =~s/$from/$to/ig; 
      return $string;
}

my @liste = qx/last/;
my %nouvelleListe=();

my %moisNum = (
    Jan => 1,
    Feb => 2,
    Mar => 3,
    Apr => 4,
    May => 5,
    Jun => 6,
    Jul => 7,
    Aug => 8,
    Sep => 9,
    Oct => 10,
    Nov => 11, 
    Dec => 12,
);
my %mois = (
    Jan => "janvier",
    Feb => "fevrier",
    Mar => "mars",
    Apr => "avril",
    May => "mai",
    Jun => "juin",
    Jul => "juillet",
    Aug => "aout",
    Sep => "septembre",
    Oct => "octobre",
    Nov => "novembre",
    Dec => "decembre",
);

my %NumMono = (
    1 => "01",
    2 => "02",
    3 => "03",
    4 => "04",
    5 => "05",
    6 => "06",
    7 => "07",
    8 => "08",
    9 => "09",
    0 => "00",
);


sub chiffreEnString{
	my ($chiffre) = @_;
	foreach $nb (keys %NumMono){
		if($chiffre eq $nb){
		   return $NumMono{$nb};
		}	
	}
	return $chiffre;	
}

foreach $e (@liste){
	$e = replace("-","",$e);
	if($e ne "\n"){
		#extraction des informations dans un tableau
		my @motsSplits=split(/\s+/,$e);
		# On ne traite pas reboot et la connexion courante
		if(!($motsSplits[0]=~/(?:reboot|wtmp)$/)){
			if($motsSplits[7] ne "still"){
				my($login,$terminal,$ip,$dayName,$month,$numDay,$hourBegin,$hourEnd,$timeSpend)=@motsSplits;
				$monthNum= $moisNum{$month};
				$month = $mois{$month};
				$timeSpend=replace("([()])","",$timeSpend);
				my($hour,$minute) = split(":",$timeSpend);
				$timeInMin = $hour*60+$minute;
				push @ {$nouvelleListe{$login}},"$numDay,$monthNum,$month,$hour,$minute,$timeInMin";		
			}
		}
	}
}
my %finalArray=();

foreach $ele (sort keys %nouvelleListe){
		print "$ele :\n";
		foreach my $l (@{$nouvelleListe{$ele}}){
			my @tabUn = split(",",$l);
			my $indice = 0;
			$temps=0;
			$valKeyUn=int($tabUn[0])+int($tabUn[1]*30); 
			$cleUne="$ele $valKeyUn";
			
			foreach $m (@{$nouvelleListe{$ele}}){
				my @tabDeux= split(",",$m);
				$valKey=int($tabDeux[0])+int($tabDeux[1]*30);	
				$cleDeux="$ele $valKey";
				if($cleUne eq $cleDeux){
					$indice++;
					$temps+=$tabDeux[5];
				}

			}
			$heure = int($temps/60);
			$min = $temps % 60;
			$heure= chiffreEnString($heure);
 			$min = chiffreEnString($min);
			$finalArray{$cleUne}=" $tabUn[0] $tabUn[2] $heure:$min ($indice fois)";
			
		}

		foreach $val (reverse sort keys %finalArray){
			@id= split(" ",$val);
			if($id[0] eq $ele){
				print "$finalArray{$val}\n";
			}
		}
	print "\n";
}


