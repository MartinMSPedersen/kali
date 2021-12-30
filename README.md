An updated Kali-Linux [Docker Image](https://docker.com) with a lot of extra stuff.  
More information about the image can be found here: https://hub.docker.com/r/martinmspedersen/kali

```bash
docker pull martinmspedersen/kali
docker container run --rm --network host --hostname kali --name kali-$$ -v "$PWD":/data -w /data -it martinmspedersen/kali:latest'
```
