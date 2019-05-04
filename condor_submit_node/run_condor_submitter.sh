#!/bin/bash
docker build -t condor_submitter .
docker run --net condor_pool_net -itd --name condor_submitter -v /sys/fs/cgroup:/sys/fs/cgroup -v $(pwd)/sh/config:/etc/simple_grid/config --privileged --add-host simple-condor-ce.cern.ch:10.0.2.51 condor_submitter
docker exec -it condor_submitter systemctl start condor
docker exec -it condor_submitter bash
