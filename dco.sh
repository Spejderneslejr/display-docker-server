#!/bin/sh

docker compose --env-file .env.docker.local -f docker-compose.server.yml $@ 
