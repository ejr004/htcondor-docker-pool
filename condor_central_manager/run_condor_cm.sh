#!/bin/bash
docker build -t condor_cm .
docker run --net condor_pool_net --ip 10.0.2.50 \
    -itd \
    --name condor_cm \
    -v /sys/fs/cgroup:/sys/fs/cgroup \
    --privileged \
    condor_cm
docker exec -it condor_cm systemctl start condor
docker exec -it condor_cm bash
