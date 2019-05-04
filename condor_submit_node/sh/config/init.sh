#!/bin/bash
systemctl start fetch-crl-cron
mv /etc/simple_grid/config/user* /home/condor_user/.globus
chown -R condor_user /home/condor_user/.globus