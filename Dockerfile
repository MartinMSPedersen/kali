FROM kalilinux/kali-rolling
LABEL MAINTAINER="traxplayer@gmail.com"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade --yes --force-yes
RUN apt-get install --yes metasploit-framework tmux
RUN apt-get install --yes \
                       kali-tools-passwords \
                       kali-tools-reverse-engineering \
                       kali-tools-exploitation
RUN apt-get install --yes \
                       kali-tools-post-exploitation \
                       kali-tools-forensics
RUN apt-get install --yes \
                       kali-tools-information-gathering
RUN apt-get install --yes \
                       gobuster \
                       mlocate
RUN apt-get install --yes \
                       python-pip \
                       python3-pip \
   		       python-tk
RUN apt -y autoremove  && updatedb
RUN pip3 install pwn crypto selenium fabric
RUN apt-get install --yes libimage-exiftool-perl
RUN updatedb

ENTRYPOINT ["/bin/bash"]
