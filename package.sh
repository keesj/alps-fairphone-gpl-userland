#!/bin/sh
DATE=$(date +"%Y-%m-%d")
git archive master --prefix=alps-fairphone-gpl-userland-$DATE/ | bzip2 > alps-fairphone-gpl-userland-$DATE.tar.bz2
