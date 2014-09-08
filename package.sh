#!/bin/sh
DATE=$(date +"%Y-%d-%m")
git archive master --prefix=alps-fairphone-gpl-userland-$DATE/ | bzip2 > alps-fairphone-gpl-userland-$DATE.tar.bz2
