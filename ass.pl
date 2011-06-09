use strict;
use Net::Kestrel;

my $host = $ENV{TEST_NET_KESTREL_HOST};
my $port = $ENV{TEST_NET_KESTREL_PORT} || 2222;

$host = "10.0.1.36";

my $kes = Net::Kestrel->new(host => $host);

my $queue = 'test-net-kestrel';

$| = 1;
for(my $x = 0; $x <= 10000; $x += 1) {
    $kes->put($queue, "hello, java $x");
    print ".";
}
print "\n";

## Flush the queue so our test starts from a known point
# my $ass = $kes->get($queue);
# print "$ass\n";
# if(defined($ass)) {
#     $kes->confirm($queue, 1);
# }