#!usr/bin/perl -w
use Data::Dumper qw(Dumper);
sub replace {
      my ($from,$to,$string) = @_;
      $string =~s/$from/$to/ig; 
      return $string;
}

sub clean {
  return grep { defined } @_;
}
my @liste = qx/last/;
my %nouvelleListe=();
clean(@liste);


foreach $e (@liste){
	$e = replace("-","",$e);
	if($e ne "\n"){
		my @motsSplits=split(/\s+/,$e);
		if(!($motsSplits[0]=~/(?:reboot|wtmp)$/)){
		
			if($motsSplits[7] ne "still"){
				print "@motsSplits \n";
			}
		}
	}
}
