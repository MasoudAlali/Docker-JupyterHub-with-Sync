FROM jupyterhub/jupyterhub

RUN apt-get update && apt-get install -y vim git htop sudo python-tk python2.7-dev
RUN wget https://bootstrap.pypa.io/get-pip.py && sudo python get-pip.py && sudo python2.7 get-pip.py
RUN git clone git://github.com/mininet/mininet && /srv/jupyterhub/mininet/util/install.sh -a
RUN pip install jupyter jupyter_latex_envs oauthenticator networkx ryu matplotlib && pip2.7 install networkx ryu matplotlib
RUN jupyter nbextension install --py latex_envs && jupyter nbextension enable --py latex_envs
EXPOSE 8000
EXPOSE 6633
EXPOSE 6653
EXPOSE 6640
RUN groupadd admin
RUN export OAUTH_CALLBACK_URL='http://cnlab.masoudalali.ir:8000/hub/oauth_callback'
RUN export OAUTH_CLIENT_ID='779531513548-hmqou1g9vefj66t40bfd6pnctgmod2jk.apps.googleusercontent.com'
RUN export OAUTH_CLIENT_SECRET='-OeTydVoWMzD4WSteBPMN4qg'
ADD ./jupyterhub_config.py /srv/jupyterhub/
ADD ./google.py /opt/conda/lib/python3.6/site-packages/oauthenticator/
ADD ./sudoers /etc/sudoers
ADD ./runner.sh /srv/jupyterhub
RUN apt-get install -y --no-install-recommends curl iproute2 iputils-ping net-tools tcpdump x11-xserver-utils xterm
CMD sh /srv/jupyterhub/runner.sh
