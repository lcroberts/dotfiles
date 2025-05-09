#!/usr/bin/env bash

sudo dnf install -y rust cargo rust-gdb rpm-build rpmdevtools rust2rpm

rpmdev-setuptree
cd ~/rpmbuild/SPECS/ || exit

rust2rpm "$1"
spectool -g -R rust-"$1".spec
mv ./*.diff ~/rpmbuild/SOURCES/
sudo dnf builddep rust-"$1".spec
rpmbuild -bs rust-"$1".spec

