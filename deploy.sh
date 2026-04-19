#!/usr/bin/env bash
set -euo pipefail
cd /srv/"$1"
git pull
.venv/bin/pip install -r requirements.txt
sudo systemctl restart "$1"
