#!/usr/bin/perl

use File::Basename ;
use Math::BigFloat ;
use warnings ;


$rptsuf     = "\.rpt" ;
$rptname    = "postroute_wire" ;
$fileName   = $rptname . $rptsuf ;

$output     = "statistics.txt" ;

#write to file
open $writeFile , "+>" , $output or die "$output is not available!\n" ; 
print $output . " has been successfully opened!\n" ;

#read from file
open $readFile , "<" , $fileName or die "$output is not available!\n" ; 
print $fileName . " has been successfully opened!\n" ;

#record the number of wires in @wireNum
#record the length of wires in one layer in @wireLen

for ( my $i = 1 ; $i <= 10 ; $i ++ ) {
    $wireNum[$i]        = 0 ;
    $wireLen[$i]        = 0 ;
    $standarddev[$i]    = 0 ;
}

#read from file
while ( <$readFile> ){
    if (/M*/) {
        my @info = split ( "\ " , $' ) ;
        #print "$info[0]\n" ;
        #print "$info[0]" . "\t" . "$info[1]" . "\n" ;
        if ( $info[0] eq "M1" ) {
            if ( $info[1] ne "0.000" ) {
                #count the number of the wires
                $wireNum[1] = $wireNum[1] + 1 ;
                #add to the total length of the wires
                $wireLen[1] += $info[1] ;
            }
        } elsif ( $info[0] eq "M2" ) {
            if ( $info[1] ne "0.000" ) {
                $wireNum[2] = $wireNum[1] + 1 ;
                $wireLen[2] += $info[1] ;
            }
        } elsif ( $info[0] eq "M3" ) {
            if ( $info[1] ne "0.000" ) {
                $wireNum[3] = $wireNum[1] + 1 ;
                $wireLen[3] += $info[1] ;
            }
        } elsif ( $info[0] eq "M4" ) {
            if ( $info[1] ne "0.000" ) {
                $wireNum[4] = $wireNum[1] + 1 ;
                $wireLen[4] += $info[1] ;
            }
        } elsif ( $info[0] eq "M5" ) {
            if ( $info[1] ne "0.000" ) {
                $wireNum[5] = $wireNum[1] + 1 ;
                $wireLen[5] += $info[1] ;
            }
        } elsif ( $info[0] eq "M6" ) {
            if ( $info[1] ne "0.000" ) {
                $wireNum[6] = $wireNum[1] + 1 ;
                $wireLen[6] += $info[1] ;
            }
        } elsif ( $info[0] eq "M7" ) {
            if ( $info[1] ne "0.000" ) {
                $wireNum[7] = $wireNum[1] + 1 ;
                $wireLen[7] += $info[1] ;
            }
        } elsif ( $info[0] eq "M8" ) {
            if ( $info[1] ne "0.000" ) {
                $wireNum[8] = $wireNum[1] + 1 ;
                $wireLen[8] += $info[1] ;
            }
        } elsif ( $info[0] eq "M9" ) {
            if ( $info[1] ne "0.000" ) {
                $wireNum[9] = $wireNum[1] + 1 ;
                $wireLen[9] += $info[1] ;
            }
        } elsif ( $info[0] eq "M10" ) {
            if ( $info[1] ne "0.000" ) {
                $wireNum[10] = $wireNum[1] + 1 ;
                $wireLen[10] += $info[1] ;
            }
        }
    }#end of if
}

print $writeFile "Layer" . "\t" . "wireNum" . "\t" . "wireLen" . "\n" ;
for ( $i = 1 ; $i <= 10 ; $i ++ ) {
    print $writeFile "M" . $i . "\t" . 
            $wireNum[$i] . "\t" . $wireLen[$i] . "\n" ;
    $averageLen[$i] = $wireLen[$i] / $wireNum[$i] ;
}

close ( $readFile ) ;
close ( $writeFile ) ;

#write to file
open $writeFile , ">>" , $output or die "$output is not available!\n" ; 
print $output . " has been successfully opened!\n" ;

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
                $standarddev[1] += ( ( $info[1] -
                                    $averageLen[1] ) ** 2 ) ;
                #print $standarddev[1] . "\n" ;
            }
        } elsif ( $info[0] eq "M2" ) {
            if ( $info[1] ne "0.000" ) {
                $standarddev[2] += ( ( $info[1] - 
                                    $averageLen[2] ) ** 2 );
            }
        } elsif ( $info[0] eq "M3" ) {
            if ( $info[1] ne "0.000" ) {
                $standarddev[3] += ( ( $info[1] - 
                                    $averageLen[3] ) ** 2 );
            }
        } elsif ( $info[0] eq "M4" ) {
            if ( $info[1] ne "0.000" ) {
                $standarddev[4] += ( ( $info[1] - 
                                    $averageLen[4] ) ** 2 );
            }
        } elsif ( $info[0] eq "M5" ) {
            if ( $info[1] ne "0.000" ) {
                $standarddev[5] += ( ( $info[1] - 
                                    $averageLen[5] ) ** 2 );
            }
        } elsif ( $info[0] eq "M6" ) {
            if ( $info[1] ne "0.000" ) {
                $standarddev[6] += ( ( $info[1] - 
                                    $averageLen[6] ) ** 2 );
            }
        } elsif ( $info[0] eq "M7" ) {
            if ( $info[1] ne "0.000" ) {
                $standarddev[7] += ( ( $info[1] - 
                                    $averageLen[7] ) ** 2 );
            }
        } elsif ( $info[0] eq "M8" ) {
            if ( $info[1] ne "0.000" ) {
                $standarddev[8] += ( ( $info[1] - 
                                    $averageLen[8] ) ** 2 );
            }
        } elsif ( $info[0] eq "M9" ) {
            if ( $info[1] ne "0.000" ) {
                $standarddev[9] += ( ( $info[1] - 
                                    $averageLen[9] ) ** 2 );
                }
        } elsif ( $info[0] eq "M10" ) {
            if ( $info[1] ne "0.000" ) {
                $standarddev[10] += ( ( $info[1] - 
                                    $averageLen[10] ) ** 2 );
            }
        }
    }#end of if
}

print $writeFile "\n" ;
print $writeFile "Mean and Deviations\n" ;
for ( $i = 1 ; $i <= 10 ; $i ++ ) {
    $delta[$i] = sqrt ( $standarddev[$i] / $wireNum[$i] ) ;
    print $writeFile "M$i\t" . $averageLen[$i] . "\t" . $delta[$i] . "\n" ;
}

close ( $readFile ) ;
close ( $writeFile ) ;
