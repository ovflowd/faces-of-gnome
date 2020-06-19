# install npm dependencies
npm install

# install gem dependencies
gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
bundle install

# script for structuring the website
echo 'structuring the website...'
dependencies=('@fortawesome' 'bootstrap' 'jquery' 'moment' 'popper.js' 'slick-carousel')
for dependency in "${dependencies[@]}"
do
    rsync -a node_modules/${dependency} assets
    echo "Moved ${dependency} to assets/ folder"
done

# script for compiling scss to css
npm run compile-sass
