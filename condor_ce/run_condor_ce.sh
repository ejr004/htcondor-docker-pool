#!/bin/bash
docker build -t condor_ce .
docker run --net condor_pool_net --ip 10.0.2.51 -itd --name condor_ce -v /sys/fs/cgroup:/sys/fs/cgroup --privileged condor_ce
docker exec -it condor_cm bash