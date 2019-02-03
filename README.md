# kali-custom-linux-docker
Docker image based on kalilinux/kali-linux-docker and installs kali-linux-top10 and a collection of useful tools

## Create Docker image
Create Docker image named "kali-custom" via:
```
$ docker build -t kali-custom .
```
## Run with persistent postgresql
```
$ docker run -ti --rm --mount src=kali-root,dst=/root --mount src=kali-postgres,dst=/var/lib/postgresql kali-custom
```
