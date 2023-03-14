FROM kalilinux/kali-rolling
LABEL MAINTAINER="traxplayer@gmail.com"
ARG DEBIAN_FRONTEND=noninteractive

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get upgrade --yes --force-yes
RUN apt-get install --yes apt-utils
RUN apt-get install --yes dirb mc gobuster mlocate \
                       python3-pip python-tk libimage-exiftool-perl \
                       vim vim-common vim-doc vim-scripts vim-doc \
                       whois \
                       wabt \
                       wfuzz \
                       qpdf \
                       tmux \
                       sublist3r \
                       libgmp3-dev libmpc-dev \
                       bind9-dnsutils \
                       lynx \
                       iputils-ping \
                       telnet \
                       bloodhound \
                       sleuthkit \
                       testdisk \
                       dos2unix \
                       zbar-tools \
                       steghide \
                       whois wabt wfuzz qpdf tmux \
                       sublist3r libgmp3-dev libmpc-dev \
                       bind9-dnsutils lynx iputils-ping \
                       telnet bloodhound sleuthkit \
                       testdisk dos2unix zbar-tools steghide \
                       ftp mariadb-client ncftp john john-data \
  	  	       redis-tools rlwrap awscli \
		       metasploit-framework \
		       kali-tools-passwords kali-tools-reverse-engineering \
		       kali-tools-exploitation kali-tools-post-exploitation \
                       kali-tools-forensics kali-tools-information-gathering \
		       wordlists \
 	               python-cryptography

RUN pip3 install pwn selenium fabric sympy primePy netifaces
RUN nmap --script-updatedb

RUN gunzip /usr/share/wordlists/rockyou.txt.gz

RUN wget https://github.com/n00py/WPForce/archive/master.zip && unzip master.zip && rm master.zip

RUN searchsploit -u || true # 2GB

RUN wget -O /usr/local/bin/LinEnum.sh https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh

RUN wget -O xor.zip https://github.com/MartinMSPedersen/xor/archive/refs/heads/master.zip && unzip xor.zip && rm xor.zip && cd xor-master && make && mv xor /usr/local/bin && cd .. && rm -r xor-master

ADD https://raw.githubusercontent.com/MartinMSPedersen/kali/master/generate_password /usr/local/bin/
RUN chmod +x /usr/local/bin/generate_password /usr/local/bin/websocat

ADD https://github.com/vi/websocat/releases/download/v1.10.0/websocat.x86_64-unknown-linux-musl /usr/local/bin/websocat

WORKDIR /src
RUN git clone https://github.com/lgandx/Responder 
RUN apt-get -y autoremove && updatedb


ENTRYPOINT ["/bin/bash"]
