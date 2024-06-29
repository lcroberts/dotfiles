#!/usr/bin/env bash

cd ./stow/

for dir in $(ls); do
	stow --target=$HOME --adopt $dir
done
