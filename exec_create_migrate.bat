@echo off
docker compose run web rake db:create && docker compose run web rails db:migrate