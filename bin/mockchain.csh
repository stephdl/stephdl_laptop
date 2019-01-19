#!/bin/csh

mv /var/lib/mock/livna-8-x86_64/result/*.src.rpm /net/home/rcc/tjb/mock-updates/8/SRPMS
mv /var/lib/mock/livna-8-x86_64/result/*.rpm /net/home/rcc/tjb/mock-updates/8/x86_64

cd /net/home/rcc/tjb/mock-updates/8/x86_64 && createrepo .

mv /var/lib/mock/livna-8-i386/result/*.src.rpm /net/home/rcc/tjb/mock-updates/8/SRPMS
mv /var/lib/mock/livna-8-i386/result/*.rpm /net/home/rcc/tjb/mock-updates/8/i386

cd /net/home/rcc/tjb/mock-updates/8/i386 && createrepo .



> [mock-updates]
> name=mock-updates
> baseurl=file:///net/home/rcc/tjb/mock-updates/8/x86_64/
