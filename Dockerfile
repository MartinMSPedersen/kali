FROM kalilinux/kali-rolling
LABEL MAINTAINER="traxplayer@gmail.com"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade --yes
RUN apt-get install apt-utils
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
RUN apt-get install --yes libimage-exiftool-perl dirb mc vim-common vim-doc vim-scripts
#RUN apt-get install openvas && openvas-setup
RUN apt-get install hashcash
RUN nmap --script-updatedb
RUN apt-get install --yes hashcash sublist3r vim vim-scripts ctags vim-doc
RUN /usr/bin/gunzip /usr/share/wordlists/rockyou.txt.gz && ln -s /usr/share/wordlists/rockyou.txt /rockyou.txt
RUN apt-get upgrade --yes --force-yes
RUN apt-get install whois

# Linux Privilege Escalation Awesome Script
RUN wget -O /usr/local/bin/linpeas.sh https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/linPEAS/linpeas.sh && \
    chmod +x /usr/local/bin/linpeas.sh
    
# Rustscan - a faster nmap
RUN wget -O /tmp/rustscan.deb https://github.com/RustScan/RustScan/releases/download/1.8.0/rustscan_1.8.0_amd64.deb && \ 
    dpkg -i /tmp/rustscan.deb && \
    rm /tmp/rustscan.deb

RUN apt -y autoremove

#This fails for some reason?
#RUN /usr/bin/gunzip /usr/share/wordlists/rockyou.txt.gz && ln -s /usr/share/wordlists/rockyou.txt /rockyou.txt
RUN updatedb

ENTRYPOINT ["/bin/bash"]
