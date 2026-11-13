#!/usr/bin/env bash
set -euo pipefail

curl -fsSL https://get.docker.com | sh
sudo apt-get install -y docker-compose-plugin