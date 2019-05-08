#!/bin/bash
docker build -t condor_internal_submitter .
docker run -itd \
    --net condor_pool_net \
    --name condor_internal_submitter \
    -v /sys/fs/cgroup:/sys/fs/cgroup \
    -v $(pwd)/sh/config:/etc/simple_grid/config \
    --privileged \
    condor_internal_submitter
    #    --add-host simple-condor-ce.cern.ch:10.0.2.151 \
docker exec -it condor_internal_submitter systemctl start condor
docker exec -it condor_internal_submitter bash
