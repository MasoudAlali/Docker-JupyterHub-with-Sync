# Docker JupyterHub with Sync
**Dockerize Jupyter Hub** with **Sync** Feature and **Google Login**
- Dockerize and Easy to Start
```bashscript
docker build -t cnlab:v1 .

docker run --restart=always --privileged -it -p8000-8100:8000-8100 -p8800-8900:8800-8900 -v /lib/modules:/lib/modules cnlab:v1
```
- Sync: There is an **Admin**, and if he upload any file in his notebook, other users will receive the files after login, for change this admin email you should change `google.py`, `jupyterhub_config.py`
- Login with Google: users can login to their account, for changing API tokens you should change `GoogleOAuthenticator` in `jupyterhub_config.py` and `Dockerfile`

Basically this project is for University of Tehran, Computer Network Labs Usages
