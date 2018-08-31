#!/pkg/gnu/bin//perl
#
#$Id: mine-logs.pl 80826 2008-03-04 14:51:23Z wotte $
#
#  mine-logs.pl:
#       script to transform access logs into WebStone workload
#
#       created 18 December 1995 mblakele@engr.sgi.com
#
# functional map:
#       usage: mine-logs.pl access.log
#
#       1. For each line in the input
#             a. parse the URL and the time, the outcome code, and the size
#             b. if the code is 200, and it's a GET, 
#               do we already know about this URL?
#                 i. yes - increment its counter
#                ii. no - create a slot for it, record size, 
#                    and set counter=1
#

$debug = 0;
$line_number = 0;

while (<>) {
    chomp;

    $line_number++;
    ($line_number % 1000) || printf STDERR ".";
    # parse line
    ( $client, $junk1, $junk2, $date, $timezone, 
      $command, $url, $version, $result_code, $size ) =
	split;
    # strip some junk
    $command =~ s/\"//;
    $date =~ s/\[//;

    ($debug) && printf STDERR "$client, $date, $command, $url, $result_code, $size\n";

    # is it a GET? Did it succeed? (i.e., is the result code 200?)
    if (($command eq 'GET') && ($result_code == 200)) {
	# is this URL already in the key set?
	if (exists $counter{$url}) {
	    # URL is in key set
	    ($debug) && printf STDERR "URL $url already in key set: incrementing\n";
	    $counter{$url}++;
	    if ($size == $size{$url}) {
		($debug) && printf STDERR "size mismatch on $url: $size != $size{$url}\n";
		if ($size <=> $size{$url}) { $size{$url} = $size; }
	    }
	}
	else {
	    # URL isn't in key set
	    ($debug) && printf STDERR "URL $url isn't in key set: adding size $size\n";
	    $counter{$url} = 1;
	    $size{$url} = $size;
	}
	# end if key set
    } # end if GET
}
# end of input file
printf STDERR "\n";

# now we print out a workload file

# first, the headline
$date = `date`;
chomp($date);
printf "# WebStone workload file\n# \tgenerated by $0 $date\n#\n";

# next, sort the keys
@sorted_keys = sort by_counter keys(%counter);

# iterate through sorted keys
foreach $key (@sorted_keys) {
    # print url, weighting, and (commented) the size in bytes
    ($debug) && printf STDERR "printing data for $key\n";
    printf "$key\t$counter{$key}\t#$size{$key}\n";
}
# end foreach

# end main

sub 
by_counter {
    $counter{$b} <=> $counter{$a};
}
# end by_counter

# end mine-logs.pl
