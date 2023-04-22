#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec raild db:migrate # migrateはridgepoleを使っているため（標準のmigrateを使うならbundle exec rails db:migrateで良いかと思います）