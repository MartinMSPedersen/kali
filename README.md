An updated Kali-Linux Docker image with a lot of extra stuff.

```bash
docker pull martinmspedersen/kali
docker container run --rm --hostname kali --name kali-$$ \
-v "/data/ctf":/data -w /data -it martinmspedersen/kali:latest'
```
