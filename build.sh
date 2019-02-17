#!/bin/bash
docker build . -t universaldashboard:latest
docker image prune -f
