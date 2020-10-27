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
                       python3-pip \
   		       python-tk
RUN apt -y autoremove  && updatedb
RUN pip3 install pwn crypto selenium fabric
RUN apt-get install --yes libimage-exiftool-perl dirb mc vim-common vim-doc vim-scripts
#RUN apt-get install openvas && openvas-setup
RUN apt-get install hashcash
RUN nmap --script-updatedb
RUN apt-get install --yes hashcash sublist3r vim vim-scripts universal-ctags vim-doc
RUN /usr/bin/gunzip /usr/share/wordlists/rockyou.txt.gz && ln -s /usr/share/wordlists/rockyou.txt /rockyou.txt
RUN apt-get upgrade --yes --force-yes
RUN apt-get install --yes whois wfuzz qpdf

# Linux Privilege Escalation Awesome Script
RUN wget -O /usr/local/bin/linpeas.sh https://raw.githubusercontent.com/carlospolop/privilege-escalation-awesome-scripts-suite/master/linPEAS/linpeas.sh && \
    chmod +x /usr/local/bin/linpeas.sh
    
RUN apt -y autoremove && updatedb

RUN ln -s /usr/share/wordlists/rockyou.txt.gz /

ENTRYPOINT ["/bin/bash"]
