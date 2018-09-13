# HTCondor in a container
This repository provides containerized version of a basic HTCondor distributed site with a submit node, execute node and central manager node, running on a Docker Swarm cluster.

If you want to run a personal condor container instead (submit node, execute node and central manager node in the same container), you should check out [this repository](https://github.com/maany/personal_condor_docker) instead.

# Requirements and Resources
- You need VM's or bare metal machines that are part of a swarm cluster.
- Instructions to install docker-ce : https://docs.docker.com/install/linux/docker-ce/centos/. On a CC7 host, you can use the instructions [here](https://github.com/WLCG-Lightweight-Sites/wlcg_lightweight_site_ce_cream/blob/master/yaim/README.md) to setup docker.
- Instructions to set up a swarm cluster: https://docs.docker.com/engine/swarm/swarm-tutorial/. Make sure you allow traffic on  the firewall ports used by swarm nodes to communicate. (described towards the end in the first page of the tutorial)

# Setting up a distributer condor cluster

The first step is to clone this repository into all the nodes that are part of your swarm cluster. From now onwards, this directory will be referred to as **"repo_dir"**.

## Attachable overlay network
- On your swarm master node, run **repo_dir/network_setup.sh** to setup an overlay network to which all containers will attach to.

## Central Manager
- On the node where you want to run a container for condor central manager, run 
```repo_dir/condor_central_manager/run_condor_cm.sh```

## Submit Node
- On the node where you want to run a container for a condor submit machine, run 
```repo_dir/condor_submit_node/run_condor_submitter.sh```

## Execute Node 
- On the node where you want to run a container for a condor execute machine, run 
```repo_dir/condor_submit_node/run_condor_executor.sh```

### Checking the status on condor pool
- When you run `condor_status` inside any container, you should see 2 slots per execute node:
![sample_output](https://i.snag.gy/1hq2FA.jpg)

## Submit a sleep job
If run_condor_submitter.sh ran successfully, you should already have a shell into the submit node container. If not, fix the errors and use `docker exec -it condor_submitter bash` to get a shell session inside the container for condor submit node. Once you are inside the container, use the following commands to submit the sample sleep job which is already present in the container.
``` 
cd /sleep_job
condor_submit ./sleep.sub 
```
You will see the sleep.log and outfile.txt show up in the /sleep_job directory inside the container if all goes well.
![job_output](https://snag.gy/8HFS3j.jpg)
### Important Notes

- The knobs for central manager can be specified in the file: repo_dir/condor_central_manager/50PC.config
- The knobs for submit machine can be specified in the file: repo_dir/condor_submit_node/50PC.config
- The knobs for execute mahcine can be specified in the file: repo_dir/condor_execute_node/50PC.config
- Anytime you change a knob outside the container, you need to 
  1. `docker stop {container_name} && docker rm {container_name}`, where {container_name} can be any of condor_cm/ condor_submitter/ condor_executer. 
  1. rebuild the image and start the container, you can do so by re
- Anytime you change the config files inside the container, you need to run ```condor_reconfig ``` for the changes to be reflected.
- You can get a shell session inside any container by going to the particular VM/machine that is running the container and then using 
` docker exec -it {condor_cm/condor_submitter/condor_executor} bash # depends on which container you want to get into`

## Contributing
Please feel free to create issues to discuss any bugs or further enhancements to this project. I know there are many as I quickly hacked it together during the HTCondor Workshop 2018 with Greg.
