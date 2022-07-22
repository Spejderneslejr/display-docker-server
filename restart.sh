#!/bin/sh

docker compose --env-file .env.docker.local -f docker-compose.server.yml pull
docker compose --env-file .env.docker.local -f docker-compose.server.yml up --force-recreate --detach --remove-orphans
sleep 20
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console doctrine:migrations:migrate --no-interaction
# 2022-03-14: Keys are now persisteted in volume
# docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console lexik:jwt:generate-keypair

# app:template:load
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:template:load https://raw.githubusercontent.com/os2display/display-templates/develop/build/book-review-config-main.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:template:load https://raw.githubusercontent.com/os2display/display-templates/develop/build/calendar-config-main.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:template:load https://raw.githubusercontent.com/os2display/display-templates/develop/build/contacts-config-main.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:template:load https://raw.githubusercontent.com/os2display/display-templates/develop/build/iframe-config-main.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:template:load https://raw.githubusercontent.com/os2display/display-templates/develop/build/image-text-config-main.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:template:load https://raw.githubusercontent.com/os2display/display-templates/develop/build/instagram-feed-config-main.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:template:load https://raw.githubusercontent.com/os2display/display-templates/develop/build/poster-config-main.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:template:load https://raw.githubusercontent.com/os2display/display-templates/develop/build/rss-config-main.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:template:load https://raw.githubusercontent.com/os2display/display-templates/develop/build/slideshow-config-main.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:template:load https://raw.githubusercontent.com/os2display/display-templates/develop/build/table-config-main.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:template:load https://raw.githubusercontent.com/os2display/display-templates/develop/build/video-config-main.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:template:load https://raw.githubusercontent.com/os2display/display-templates/develop/build/travel-config-main.json

# app:screen-layouts:load
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:screen-layouts:load https://raw.githubusercontent.com/os2display/display-templates/develop/src/screen-layouts/full-screen.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:screen-layouts:load https://raw.githubusercontent.com/os2display/display-templates/develop/src/screen-layouts/three-boxes-horizontal.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:screen-layouts:load https://raw.githubusercontent.com/os2display/display-templates/develop/src/screen-layouts/three-boxes.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:screen-layouts:load https://raw.githubusercontent.com/os2display/display-templates/develop/src/screen-layouts/touch-template.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:screen-layouts:load https://raw.githubusercontent.com/os2display/display-templates/develop/src/screen-layouts/two-boxes.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:screen-layouts:load https://raw.githubusercontent.com/os2display/display-templates/develop/src/screen-layouts/two-boxes-vertical.json
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:screen-layouts:load https://raw.githubusercontent.com/os2display/display-templates/develop/src/screen-layouts/six-areas.json

# SL2022 mods
docker compose --env-file .env.docker.local -f docker-compose.server.yml exec --user deploy api bin/console app:screen-layouts:load https://gist.githubusercontent.com/danquah/2d8ce9cb35b584c42445cc22d055c8d2/raw/7154db18e9d731e0f25894834606e336c8905aba/four-boxes.json
