#!/bin/bash

cd ..

docker compose -p devops-finalproject-team4 up -d

echo "Waiting for Docker containers to start..."
sleep 30
echo "Docker containers should be running now."

cd automation

python3 -m venv venv
source venv/bin/activate

pip install --upgrade pip
pip install requests

python jenkins_job_trigger.py

deactivate
