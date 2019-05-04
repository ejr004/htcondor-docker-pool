#!/bin/bash
systemctl start crond
systemctl start fetch-crl-cron
cp /etc/simple_grid/config/user* /home/condor_user/.globus
chown -R condor_user /home/condor_user/.globus