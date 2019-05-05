#!/bin/bash
docker build -t condor_ce .
docker run --net host \
    -itd \
    --name condor_ce02 \
    -v /sys/fs/cgroup:/sys/fs/cgroup \
    -v $(pwd)/sh:/etc/simple_grid \
    --privileged \
    condor_ce
#docker exec -it condor_ce /etc/simple_grid/condig/init.sh
docker exec -it condor_ce02 bash