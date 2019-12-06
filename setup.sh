#!/bin/bash

git clone https://github.com/cyberark/conjur-quickstart
cd conjur-quickstart
docker-compose pull
docker-compose run --no-deps --rm conjur data-key generate > data_key
export CONJUR_DATA_KEY="$(< data_key)"
docker-compose up -d
docker-compose exec conjur conjurctl account create myConjurAccount > admin_data
docker-compose exec client conjur init -u conjur -a myConjurAccount
