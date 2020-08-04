# install npm dependencies
npm install

# install gem dependencies
gem install bundler -v "$(grep -A 1 "BUNDLED WITH" Gemfile.lock | tail -n 1)"
bundle install
