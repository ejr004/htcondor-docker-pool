#!/bin/bash
docker build -t condor_executor .
docker run --net host  \
    -itd \
    --name condor_executor \
    -v /sys/fs/cgroup:/sys/fs/cgroup \
    --mount type=bind,source=/cvmfs,target=/cvmfs,bind-propagation=shared \
    --privileged \
    condor_executor
docker exec -it condor_executor systemctl start condor
docker exec -it condor_executor bash
