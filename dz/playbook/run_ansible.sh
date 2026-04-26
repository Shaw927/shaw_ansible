#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

docker run -d --rm --name centos7 pycontribs/centos:7 sleep 600000
docker run -d --rm --name ubuntu  pycontribs/ubuntu  sleep 600000
docker run -d --rm --name fedora  pycontribs/fedora  sleep 600000

ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass

docker stop centos7 ubuntu fedora
