FROM cern/cc7-base

## Condor ##
RUN yum install -y wget
RUN wget https://research.cs.wisc.edu/htcondor/yum/RPM-GPG-KEY-HTCondor
RUN rpm --import RPM-GPG-KEY-HTCondor
WORKDIR /etc/yum.repos.d/
RUN wget https://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-stable-rhel7.repo
RUN yum -y install condor htcondor-ce-client
## net tools ##
RUN yum install -y net-tools iproute openssh openssh-server openssh-clients openssl-libs
## CA ##
RUN wget -O /etc/yum.repos.d/EGI-trustanchors.repo http://repository.egi.eu/sw/production/cas/1/current/repo-files/EGI-trustanchors.repo 
RUN yum install -y ca-policy-egi-core fetch-crl
## Condor User ##
RUN useradd -m condor_user
RUN mkdir -p /home/condor_user/.globus
COPY 50PC.config /etc/condor/config.d/
COPY sleep_job /home/condor_user/
RUN chown -R condor_user /home/condor_user/sleep_job
## /etc/simple_grid ##
RUN mkdir /etc/simple_grid
WORKDIR /etc/simple_grid/
## systemctl ##
ENV container docker
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
