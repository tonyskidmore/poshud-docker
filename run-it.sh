#!/bin/bash
docker run \
-it \
-p 80:8585 \
--name ud \
--mount type=bind,source=/var/alohadata,target=/app/data \
universaldashboard:latest
/bin/sh
