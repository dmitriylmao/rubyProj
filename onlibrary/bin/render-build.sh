set -0 errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean