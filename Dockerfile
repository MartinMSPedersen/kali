FROM kalilinux/kali-linux-docker
LABEL MAINTAINER="traxplayer@gmail.com"
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y metasploit-framework tmux \
                       kali-tools-passwords \
                       kali-tools-reverse-engineering \
                       kali-tools-exploitation \
                       kali-tools-forensics \
                       kali-tools-post-exploitation \
                       kali-tools-information-gathering
RUN apt -y autoremove
ENTRYPOINT ["/bin/bash"]
