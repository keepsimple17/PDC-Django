#!/usr/bin/env bash

cd /home/ubuntu/PDC/
# source /home/ubuntu/PDC_Deploy/venv/bin/activate
# echo yes | gunicorn --bind unix:/home/ubuntu/PDC_Deploy/PDC_Deploy.sock core.wsgi:application
echo yes | sudo systemctl restart gunicorn
