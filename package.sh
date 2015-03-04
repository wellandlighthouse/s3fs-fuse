#!/bin/bash
# Preps and compiles the S3FS Package
# Written by louie@wellandlighthouse.com
# S3FS-Fuse released under GNU at https://github.com/s3fs-fuse/s3fs-fuse
VER="1.78"

# Move / update files for source tarball
mkdir s3fs-fuse_$VER
cd s3fs-fuse_$VER
cp ../doc/ . -R
cp ../src/ . -R
cp ../test/ . -R
cp ../autogen.sh .
cp ../configure.ac .
cp ../Makefile.am .
tar -czf ../s3fs_fuse-$VER.orig.tar.gz ../s3fs_fuse-$VER/

# Set up to build Package
cp ../debian/ . -R
debuild -us -uc

# Clean up after yourself
cd ..
rm -rf s3fs_fuse-$VER/