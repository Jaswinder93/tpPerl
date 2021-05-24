#!usr/bin/perl -w 

# exo 3 Trinome : Amiot Tanguy | Chaouche Zineb | Singh Jaswinder

sub ecritureContenuDossier{
	my ($dossier,$fichierDat)=@_;
	$contenuDossier="";		
	opendir(my $dh, $dossier) || die "Can't opendir $dossier: $!";
	while (readdir $dh) {
    		$contenuDossier.="$_\n";
	}
	chomp($contenuDossier);
	closedir $dh;
	open (FICHIER, ">$fichierDat") || die ("Vous ne pouvez pas créer le fichier \"fichier.dat\"");
	print FICHIER $contenuDossier;
	close (FICHIER);
	print "le fichier $fichierDat a été crée";
}

#fonction prenant en paramètre le repertoire du dossier 
# ainsi que le nom du fichier(existant ou nouveau nom) dans le quel on veut écrire le contenu de ce dossier
ecritureContenuDossier("/home/jas/tpNote","fichier.dat");

