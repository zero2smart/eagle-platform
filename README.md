# eagle-platform


.env:
REACT_APP_GOOGLE_MAP_API_KEY=AIzaSyDJCz3W4pW1-F-2PNFYjAkWHut6HX1T3NA
REACT_APP_API_DOMAIN=https://eagle-staging-api.herokuapp.com/
REACT_APP_API_VERSION=v1

Procfile.dev:
# You can run these commands in separate shells
web: bundle exec puma -C config/puma.rb
client: sh -c 'rm -rf public/packs/* || true && bundle exec rake react_on_rails:locale && bin/webpack -w'
# client: sh -c 'rm -rf public/packs/* || true && bundle exec rake react_on_rails:locale && bin/webpack-dev-server'
