FROM kalilinux/kali-rolling
LABEL MAINTAINER="traxplayer@gmail.com"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade --yes --force-yes
RUN apt-get install --yes apt-utils
RUN apt-get install --yes metasploit-framework \
                       kali-tools-passwords \
                       kali-tools-reverse-engineering \
                       kali-tools-exploitation \
                       kali-tools-post-exploitation \
                       kali-tools-forensics \
                       kali-tools-information-gathering \
                       gobuster \
                       mlocate \
                       python3-pip \
                       python-tk \
                       libimage-exiftool-perl \
                       dirb \
                       mc \
                       vim vim-common vim-doc vim-scripts vim-doc \
                       whois \
                       wfuzz \
                       qpdf \
                       tmux \
                       hashcash \ 
                       sublist3r
RUN pip3 install pwn crypto selenium fabric
RUN nmap --script-updatedb
RUN ln -s /usr/share/wordlists/rockyou.txt.gz /rockyou.txt.gz
RUN wget https://github.com/n00py/WPForce/archive/master.zip && unzip master.zip && rm master.zip
RUN apt -y autoremove && updatedb

ENTRYPOINT ["/bin/bash"]
