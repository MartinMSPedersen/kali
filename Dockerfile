FROM kalilinux/kali-linux-docker
LABEL MAINTAINER="traxplayer@gmail.com"
RUN apt-get update && apt-get upgrade -y && apt-get install -y metasploit-framework
ENTRYPOINT ["/bin/bash"]
