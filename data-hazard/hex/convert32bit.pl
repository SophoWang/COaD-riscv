
open IN_FILE, "riscv-test.hex" or die "Can not open";
open OUT_FILE, '>', ".tmp.rscv-test.hex" or die "Can not open";

my $line;
my $cnt = 0;

my $content;

while ($line = <IN_FILE>) {
    chomp($line);
    if ($line =~ /@/) {
        print OUT_FILE $line."\n";
        next;
    }

    my @ByteArray = split / /, $line;
    foreach( @ByteArray ) {
        if ($cnt == 0) {
            $content = $_;
            $cnt++;
        } elsif ($cnt == 1) {
            $content = $_.$content;
            $cnt++;
        } elsif ($cnt == 2) {
            $content = $_.$content;
            $cnt++;
        } elsif ($cnt == 3) {
            $content = $_.$content."\n";
            $cnt = 0;
            print OUT_FILE $content;
        }
    }
}

close IN_FILE;
close OUT_FILE;

rename ".tmp.rscv-test.hex", "riscv-test.hex";
