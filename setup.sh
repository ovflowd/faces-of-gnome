#!/bin/bash

GEM_PATH=.bundle
BUNDLER_PATH=$GEM_PATH/bin
	
echo -e "\n💡 \033[1;34minstalling node dependencies \033[0m\n"

# install npm dependencies
npm ci ---cache .npm --prefer-offline --silent

echo -e "\n💡 \033[1;34minstalling bundler locally \033[0m\n"

# install gem dependencies
gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)" --install-dir=$GEM_PATH --quiet --silent

echo -e "💡 \033[1;34minstalling bundler packages locally \033[0m\n"

$BUNDLER_PATH/bundle install --path=$GEM_PATH --standalone

echo -e "💡 \033[1;34mcopying node packages locally \033[0m\n"

dependencies=('@fortawesome' 'bootstrap' 'jquery' 'moment' 'popper.js' 'slick-carousel')

for dependency in "${dependencies[@]}"
do
    rsync -a node_modules/${dependency} assets
    echo -e "✓ \033[1;32mmoved ${dependency} to assets/ folder \033[0m"
done

echo -e "\n👌 \033[1;35minstallation finished \033[0m\n"
