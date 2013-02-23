#!/bin/bash

# releases a source tarball for release to users who need
# to build from source

# many packaging systems refuse to accept minified Javascript
# code as a release

set -e

PROJECT=sipml5

if [ -z "$VERSION" ];
then
  VERSION=0.0.`date +%Y%m%d.%H%M`
fi

RELEASE_NAME=${PROJECT}-${VERSION}

DIST_TGZ=${RELEASE_NAME}.tar.gz
DEB_DIST_TGZ=${PROJECT}_${VERSION}.orig.tar.gz

mkdir ${RELEASE_NAME}

cp -dpR \
  assets \
  *.htm *.html \
  COPYING \
  *.sh \
  docs \
  images \
  SIPml-api.js SIPml.js \
  sounds \
  src \
  tests \
  ${RELEASE_NAME}/

tar czf ${DIST_TGZ} ${RELEASE_NAME}
rm -rf ${RELEASE_NAME}

cp ${DIST_TGZ} ../${DEB_DIST_TGZ}

