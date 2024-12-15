#!/bin/bash

set -x;

docker compose -f /super/compose.yml exec database mariadb -h localhost -u root -pasd345#$% -e "CREATE DATABASE keystone;";
