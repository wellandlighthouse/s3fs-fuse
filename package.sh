#!/bin/bash
# Preps and compiles the S3FS Package
# Written by louie@wellandlighthouse.com
# S3FS-Fuse released under GNU at https://github.com/s3fs-fuse/s3fs-fuse
VER="1.79"

# Installing dependencies
apt-get update
apt-get upgrade -y
apt-get install build-essential automake libfuse-dev libxml2-dev pkg-config debhelper devscripts libcurl4-openssl-dev mime-support libtool libssl-dev -y

# Move / update files for source tarball
mkdir s3fs-fuse_$VER
cd s3fs-fuse_$VER
cp ../doc/ . -R
cp ../src/ . -R
cp ../test/ . -R
cp ../NEWS .
cp ../README .
cp ../AUTHORS .
cp ../ChangeLog .
cp ../COPYING .
cp ../autogen.sh .
cp ../configure.ac .
cp ../Makefile.am .
tar -czf ../s3fs-fuse_$VER.orig.tar.gz ../s3fs-fuse_$VER/

# Set up to build Package
cp ../debian/ . -R
debuild -us -uc

# Clean up after yourself
cd ..
rm -rf s3fs-fuse_$VER/