# Mark Beviz 2015
use Net::Ping;

{
	print "Please, enter the file name! (It must be in the script's path): ";

	chomp($filename = <>);
	open ($fc, '<', $filename)
	or print "\nCould not open file! " and PressKeyToExt();
	@lines;
	while(<$fc>)
	{
	    chomp;
	    push @lines, $_;
	}
	close $fh;
}


{
	print "\nPlease give the keyword you want to search: ";
	chomp ($keyword = <>);
	@result = grep { /$keyword/ } @lines
		or print "\nCould not find any matches! " and PressKeyToExt();
}


{
	$p = Net::Ping->new("icmp", 2);
	print "\n";
	foreach $ip (@result)
	{
		if($p->ping($ip)) { print "[+]    " }
		else { print "[-]    " }
		print "$ip is ";
		print "NOT " unless $p->ping($ip);
		print "reachable.\n\n";
	}
	print "Scan Complete! ";
	PressKeyToExt();


 GetKeyword();
 PingThem();

sub PressKeyToExt()
{
	print "Press Return to exit..";
	<STDIN>;
	exit;
}