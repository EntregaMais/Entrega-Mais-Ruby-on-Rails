@echo off
docker compose run web bundle exec rake spec SPEC_OPTS="--format documentation"