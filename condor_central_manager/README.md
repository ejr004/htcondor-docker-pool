# personal_condor_docker
Docker container to run HTCondor (Role : Personal i.e. submit, execute and master on same node)

## Instructions

1. Clone the repository
1. Make sure docker in installed on your machine 
1. If you are using a Linux machine, you can build the image and start the container by running the run_condor_personal.sh script included in this repository. For other platforms, find equivalent docker run commands mentioned in the run_condor_personal.sh. 
1. If you ran the run_condor_personal.sh script, you will end up with a shell session inside the new container. You can run a condor_status to check the status of the condor pool.
