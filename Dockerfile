FROM kalilinux/kali-rolling
LABEL MAINTAINER="traxplayer@gmail.com"
ARG DEBIAN_FRONTEND=noninteractive

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update && apt-get upgrade --yes --force-yes
RUN apt-get install --yes apt-utils
RUN apt-get install --yes \
                       dirb \
                       mc \
                       gobuster \
                       mlocate \
                       python3-pip \
                       python-tk \
                       libimage-exiftool-perl \
                       vim vim-common vim-doc vim-scripts vim-doc \
                       whois \
                       wfuzz \
                       qpdf \
                       tmux \
                       sublist3r \
                       libgmp3-dev libmpc-dev \
                       bind9-dnsutils \
                       lynx
RUN apt-get install --yes metasploit-framework
RUN apt-get install --yes kali-tools-passwords
RUN apt-get install --yes kali-tools-reverse-engineering
RUN apt-get install --yes kali-tools-exploitation
RUN apt-get install --yes kali-tools-post-exploitation
RUN apt-get install --yes kali-tools-forensics
RUN apt-get install --yes kali-tools-information-gathering
                       
#                       sagemath sagemath-common sagemath-database-conway-polynomials sagemath-database-elliptic-curves \
#                       sagemath-database-graphs sagemath-database-mutually-combinatorial-designs sagemath-database-polytopes
RUN pip3 install pwn pycrypto selenium fabric
RUN nmap --script-updatedb
RUN ln -s /usr/share/wordlists/rockyou.txt.gz /rockyou.txt.gz
RUN wget https://github.com/n00py/WPForce/archive/master.zip && unzip master.zip && rm master.zip
RUN apt-get install --yes iputils-ping telnet bloodhound sleuthkit

RUN searchsploit -u || true # 2GB

RUN apt-get install --yes steghide zbar-tools dos2unix testdisk
RUN wget -O /usr/local/bin/LinEnum.sh https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh

RUN pip3 install sympy
RUN wget -O xor.zip https://github.com/MartinMSPedersen/xor/archive/refs/heads/master.zip && unzip xor.zip && rm xor.zip && cd xor-master && make && mv xor /usr/local/bin && cd .. && rm -r xor-master

#RUN wget https://github.com/Ganapati/RsaCtfTool/archive/refs/heads/master.zip &&  \
#    unzip master.zip && rm master.zip && cd RsaCtfTool && \
#               pip3 install -r "requirements.txt" && mv RsaCtfTool /usr/local

RUN apt install wordlists --reinstall # why is this missing
#RUN apt-get install --yes forensics-all forensics-extra # 3GB

RUN apt-get -y autoremove && updatedb
# https://github.com/internetwache/GitTools/archive/refs/heads/master.zip
ADD https://raw.githubusercontent.com/MartinMSPedersen/kali/master/generate_password /usr/local/bin/
RUN chmod +x /usr/local/bin/generate_password

ENTRYPOINT ["/bin/bash"]
