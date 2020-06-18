#Build
```powershell
docker build -t bdenisenko/docker-in-docker-socks .
```

#Run
```powershell
docker run -it -v /var/run/docker.sock:/var/run/docker.sock  bdenisenko/docker-in-docker-socks
```