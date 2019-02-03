# Docker image with kali-linux-top10 and a collection of useful tools
###
# Create Docker image named "kali-custom" via: 
# 	$ docker build -t kali-custom .
# Run with:
#	$ docker run -ti --rm --mount src=kali-root,dst=/root --mount src=kali-postgres,dst=/var/lib/postgresql kali-custom
###
FROM kalilinux/kali-linux-docker

ENV DEBIAN_FRONTEND noninteractive
# do APT update
RUN apt-get -y update && apt-get -y dist-upgrade && apt-get -y autoremove && apt-get clean
# install Kali Linux "Top 10" metapackage and a few extra tools
RUN apt-get -y install kali-linux-top10 exploitdb man-db dirb nikto wpscan uniscan

# initialize Metasploit databse
RUN msfdb init

VOLUME /root /var/lib/postgresql
# default LPORT for reverse shell
EXPOSE 4444

WORKDIR /root
ENTRYPOINT ["/bin/bash"]
