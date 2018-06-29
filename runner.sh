#!/bin/bash
service openvswitch-switch start
ovs-vsctl set-manager ptcp:6640
jupyter notebook --allow-root --ip=0.0.0.0 &
python2 -m pip install ipykernel 
python2 -m ipykernel install
jupyterhub -f /srv/jupyterhub/jupyterhub_config.py --ip=0.0.0.0 
