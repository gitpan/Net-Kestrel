use strict;
use Net::Kestrel;

my $host = $ENV{TEST_NET_KESTREL_HOST};
my $port = $ENV{TEST_NET_KESTREL_PORT} || 2222;

my $kes = Net::Kestrel->new(host => $host);

my $queue = 'test-net-kestrel';

$kes->put($queue, "hello, java");

## Flush the queue so our test starts from a known point
# my $ass = $kes->get($queue);
# print "$ass\n";
# if(defined($ass)) {
#     $kes->confirm($queue, 1);
# }
