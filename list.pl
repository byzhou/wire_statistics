#!/usr/bin/perl

use File::Basename ;
use Math::BigFloat ;
use warnings ;


$rptsuf     = "\.rpt" ;
$rptname    = "postroute_wire" ;
$fileName   = $rptname . $rptsuf ;

#write to file
open my $writeFile1 , "+>" , "M1.txt" or die "$output is not available!\n" ; 
open my $writeFile2 , "+>" , "M2.txt" or die "$output is not available!\n" ; 
open my $writeFile3 , "+>" , "M3.txt" or die "$output is not available!\n" ; 
open my $writeFile4 , "+>" , "M4.txt" or die "$output is not available!\n" ; 
open my $writeFile5 , "+>" , "M5.txt" or die "$output is not available!\n" ; 
open my $writeFile6 , "+>" , "M6.txt" or die "$output is not available!\n" ; 
open my $writeFile7 , "+>" , "M7.txt" or die "$output is not available!\n" ; 
open my $writeFile8 , "+>" , "M8.txt" or die "$output is not available!\n" ; 
open my $writeFile9 , "+>" , "M9.txt" or die "$output is not available!\n" ; 
open my $writeFile10 , "+>" , "M10.txt" or die "$output is not available!\n" ; 

#read from file
open $readFile , "<" , $fileName or die "$output is not available!\n" ; 
print $fileName . " has been successfully opened!\n" ;

#read from file
while ( <$readFile> ){
    if (/M*/) {
        my @info = split ( "\ " , $' ) ;
        #print "$info[0]\n" ;
        #print "$info[0]" . "\t" . "$info[1]" . "\n" ;
        if ( $info[0] eq "M1" ) {
            if ( $info[1] ne "0.000" ) {
                print $writeFile1 $info[1] ;
                print $writeFile1 "\n" ;
            }
        } elsif ( $info[0] eq "M2" ) {
            if ( $info[1] ne "0.000" ) {
                print $writeFile2 $info[1] ;
                print $writeFile2 "\n" ;
            }
        } elsif ( $info[0] eq "M3" ) {
            if ( $info[1] ne "0.000" ) {
                print $writeFile3 $info[1] ;
                print $writeFile3 "\n" ;
            }
        } elsif ( $info[0] eq "M4" ) {
            if ( $info[1] ne "0.000" ) {
                print $writeFile4 $info[1] ;
                print $writeFile4 "\n" ;
            }
        } elsif ( $info[0] eq "M5" ) {
            if ( $info[1] ne "0.000" ) {
                print $writeFile5 $info[1] ;
                print $writeFile5 "\n" ;
            }
        } elsif ( $info[0] eq "M6" ) {
            if ( $info[1] ne "0.000" ) {
                print $writeFile6 $info[1] ;
                print $writeFile6 "\n" ;
            }
        } elsif ( $info[0] eq "M7" ) {
            if ( $info[1] ne "0.000" ) {
                print $writeFile7 $info[1] ;
                print $writeFile7 "\n" ;
            }
        } elsif ( $info[0] eq "M8" ) {
            if ( $info[1] ne "0.000" ) {
                print $writeFile8 $info[1] ;
                print $writeFile8 "\n" ;
            }
        } elsif ( $info[0] eq "M9" ) {
            if ( $info[1] ne "0.000" ) {
                print $writeFile9 $info[1] ;
                print $writeFile9 "\n" ;
            }
        } elsif ( $info[0] eq "M10" ) {
            if ( $info[1] ne "0.000" ) {
                print $writeFile10 $info[1] ;
                print $writeFile10 "\n" ;
            }
        }
    }#end of if
}

    close ( $writeFile1 ) ;
    close ( $writeFile2 ) ;
    close ( $writeFile3 ) ;
    close ( $writeFile4 ) ;
    close ( $writeFile5 ) ;
    close ( $writeFile6 ) ;
    close ( $writeFile7 ) ;
    close ( $writeFile8 ) ;
    close ( $writeFile9 ) ;
    close ( $writeFile10 ) ;

    close ( $readFile ) ;

