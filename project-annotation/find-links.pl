#!/bin/env perl

use strict;

my $LinkHome = '/proj/OPUS/corpus/OpenSubtitles/all';

my $trglang = shift(@ARGV);
my %sents = ();

while (<>){
    s/([^0-9\/])\t([^0-9\/])/$1 $2/g;
    my @fields = split(/\t/);
    next unless ($fields[0]=~/[0-9]/);

    my $sentid = $fields[4];
    my $file = $fields[5];
    my ($srclang) = split(/\//,$file);
    next unless ($srclang);
    if ($srclang eq '625'){
	print '';
    }
    $sents{$srclang}{$file}{$sentid}++;
}



print'<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE cesAlign PUBLIC "-//CES//DTD XML cesAlign//EN" "">
<cesAlign version="1.0">
';


foreach my $srclang (keys %sents){
    my $reverse = 0;
    print STDERR " ... look for matching documents for $srclang\n";
    my ($linkfile) = glob "$LinkHome/$srclang-$trglang.*.gz";
    if (! -e $linkfile){
	($linkfile) = glob "$LinkHome/$trglang-$srclang.*.gz";
	$reverse = 1;
    }
    if (! -e $linkfile){
	print STDERR "no linkfile found for $srclang-$trglang\n";
	next;
    }

    my $matchingFile = undef;
    open F,"gzip -cd < $linkfile |" || die "cannot open file $linkfile\n";
    while (<F>){
	if (/\<linkGrp/){
	    my ($fromDoc,$toDoc);
	    if (/fromDoc=\"([^\"]+)\"/){ $fromDoc = $1; }
	    if (/toDoc=\"([^\"]+)\"/){ $toDoc = $1; }
	    if (exists $sents{$srclang}{$toDoc} && $reverse){
		$matchingFile = $toDoc;
		print "<linkGrp targType=\"s\" fromDoc=\"$toDoc\" toDoc=\"$fromDoc\">\n";
		print STDERR " ... matching document $matchingFile\n";
	    }
	    elsif ((not $reverse) && exists $sents{$srclang}{$fromDoc}){
		$matchingFile = $fromDoc;
		print;
		print STDERR " ... matching document $matchingFile\n";
	    }
	    else{
		$matchingFile = undef;
	    }
	}
	elsif ((defined $matchingFile) && (/xtargets=\"([^\"]+)\"/)){
	    my ($src,$trg) = split(/\;/,$1);
	    if ((not $reverse) && exists $sents{$srclang}{$matchingFile}{$src}){
		print;
	    }
	    elsif (($reverse) && exists $sents{$srclang}{$matchingFile}{$trg}){
		s/xtargets=\"([^\"]+)\"/xtargets=\"$trg;$src\"/;
		print;
	    }
	}
	elsif ((defined $matchingFile) && (/<\/linkGrp>/)){
	    print;
	}
    }
    close F;
}

print "</cesAlign>\n";
