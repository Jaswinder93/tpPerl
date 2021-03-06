#!usr/bin/perl -w

#exo 2 Trinome : Amiot Tanguy | Chaouche Zineb | Singh Jaswinder

$path = "/etc/passwd";
open(Fic,'<',$path) or die $!;
$pathgroup="/etc/group";
%tableauFinal=();
open(Fic2,'<',$pathgroup);

#création d'une liste associative ayant login comme clé et une liste de valeurs par clé
while(<Fic>){
        chomp;
        my($login,$x,$uid,$gid,$text,$home,$exe) =  split(":",$_);
	@liste=($login,$gid,$home,$exe);     
	$tableauFinal{$login}="@liste";
}

#accès au fichier group pour récuperer le nm du groupe associé a son gid
#création d'une liste associative associant le gid au groupe
%listGroup=();
while(<Fic2>){
        chomp;
        my($group,$x,$gid)=split(":",$_);
	$listGroup{$gid}=$group;	
}

#Ajout du group dans la liste associé à son gid
#Affichage trié par la clé login 
foreach $e (sort keys %tableauFinal){
	if(defined($tableauFinal{$e})){
		@newListe =split(" ", $tableauFinal{$e});
		foreach $key (%listGroup){
			if($key eq $newListe[1]){
				push(@newListe,$listGroup{$key});				
			}		
		}	
		print("Login : $newListe[0] | Group : $newListe[4] | Home = $newListe[2] | Programme = $newListe[3]\n");
	}
}


close(Fic);
close(Fic2);


