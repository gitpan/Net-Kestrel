use strict;
use Net::Kestrel;

my $host = $ENV{TEST_NET_KESTREL_HOST};
my $port = $ENV{TEST_NET_KESTREL_PORT} || 2222;

$host = "10.0.1.36";

my $kes = Net::Kestrel->new(host => $host);

my $queue = 'test-net-kestrel';

$| = 1;
while(1) {
    my $val = $kes->get($queue);
    print "Got: $val\n";
    if(!defined($val)) {
        exit;
    }
    $kes->confirm($queue, 1);
}

## Flush the queue so our test starts from a known point
# my $ass = $kes->get($queue);
# print "$ass\n";
# if(defined($ass)) {
#     $kes->confirm($queue, 1);
# }
