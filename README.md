# Docker JupyterHub with Sync
**Dockerize Jupyter Hub** with **Sync** Feature and **Google Login**
- Dockerize and Easy to Start
```bashscript
docker build -t cnlab:v1 .
```
* and for Run docker
```bashscript
docker run --restart=always --privileged -it -p8000-8100:8000-8100 -p8800-8900:8800-8900 -v /lib/modules:/lib/modules cnlab:v1
```
