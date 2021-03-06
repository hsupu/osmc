# (c) 2014-2015 Sam Nazarko
# email@samnazarko.co.uk

#!/bin/bash

. ../common.sh

REV="86dda6e2eca03469e9d41fbffcfa5dc8d80f5db0"

echo -e "Building package kernel-package-osmc"
out=$(pwd)/files
make clean
echo Downloading source
pull_source "https://github.com/osmc/kernel-package-tool-osmc/archive/${REV}.tar.gz" "$(pwd)/src"
if [ $? != 0 ]; then echo -e "Error downloading" && exit 1; fi
pushd src/kernel-package-tool-osmc-${REV}
make install DESTDIR=${out}
popd
dpkg_build files/ kernel-package-osmc.deb
