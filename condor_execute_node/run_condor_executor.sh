#!/bin/bash
docker build -t condor_executor .
docker run --net condor_pool_net  -itd --name condor_executor -v /sys/fs/cgroup:/sys/fs/cgroup --privileged condor_executor
docker exec -it condor_executor systemctl start condor
docker exec -it condor_executor bash
