FROM cern/cc7-base
RUN yum install -y wget
RUN wget https://research.cs.wisc.edu/htcondor/yum/RPM-GPG-KEY-HTCondor
RUN rpm --import RPM-GPG-KEY-HTCondor
WORKDIR /etc/yum.repos.d/
RUN wget https://research.cs.wisc.edu/htcondor/yum/repo.d/htcondor-stable-rhel7.repo
COPY sh/config/batch7-stable.repo /etc/yum.repos.d/batch7-stable.repo
RUN yum -y install htcondor-ce-condor, globus-rsl, empty-ca-certs

RUN yum install -y iproute openssh openssh-server openssh-clients openssl-libs
RUN yum install -y net-tools
RUN useradd -m slot1 && useradd -m slot2
RUN mkdir -p /etc/grid-security/
VOLUME ["/etc/simple_grid"]

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
