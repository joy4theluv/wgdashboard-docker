# wgdashboard-docker

## Overview

This repository provides a simple deployment for WGDashboard using Docker. It maps the required services and ports, configures persistent volumes for WireGuard and Amnezia data, and includes helper scripts to install Docker Compose and create local or remote backups.

This setup is designed to keep your WireGuard configuration and dashboard data outside the container lifecycle, so they remain available across restarts and upgrades.

## Clone a specific branch and directory

```bash
git clone -b <branch-name> --single-branch --depth 1 https://github.com/joy4theluv/wgdashboard-docker.git   
# latest commit
```

```bash
git clone -b <branch-name>ch --depth 1 \

https://github.com/joy4theluv/wgdashboard-docker.git \

/root/wgdashboard-docker # Clone to Specific directory

cd /root/wgdashboard-docker
```
```bash
git branch --show-current # verify the branch
```