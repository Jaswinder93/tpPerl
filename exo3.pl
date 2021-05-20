#!usr/bin/perl -w 

sub ecritureContenuDossier{
	my ($dossier,$fichierDat)=@_;
	$contenuDossier="";		
	opendir(my $dh, $dossier) || die "Can't opendir $dossier: $!";
	while (readdir $dh) {
    		$contenuDossier.="$_\n";
	}
	chomp($contenuDossier);
	closedir $dh;
	open (FICHIER, ">fichier.dat") || die ("Vous ne pouvez pas créer le fichier \"fichier.dat\"");
	print FICHIER $contenuDossier;
	close (FICHIER);
}
ecritureContenuDossier("/home/jas","fichier.dat");
