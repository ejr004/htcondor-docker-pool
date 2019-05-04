#!/bin/bash
mv /etc/simple_grid/config/user* /home/condor_user/.globus
su condor_user && voms-proxy-init && voms-proxy-info
systemctl start fetch-crl-cron