#!/bin/bash
docker run \
-d \
-p 80:8585 \
--name ud \
--rm \
universaldashboard:latest