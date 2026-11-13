# WGDashboard Docker

## Overview

This repository provides a simple deployment for WGDashboard using Docker. It maps the required services and ports, configures persistent volumes for WireGuard and Amnezia data, and includes helper scripts to install Docker Compose and create local or remote backups.

This setup is designed to keep your WireGuard configuration and dashboard data outside the container lifecycle, so they remain available across restarts and upgrades.