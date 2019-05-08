#!/bin/bash
docker build -t condor_ce .
docker run --net condor_pool_net \
    --ip 10.0.2.51 \
    -p 9619:9619 \
    --hostname=$(hostname) \
    -itd --name condor_ce01 \
    -v /sys/fs/cgroup:/sys/fs/cgroup \
    -v $(pwd)/sh:/etc/simple_grid \
    --privileged \
    condor_ce
#docker exec -it condor_ce /etc/simple_grid/condig/init.sh
docker exec -it condor_ce02 bash