#!/bin/sh

exec /opt/ventsrv/ventrilo_srv -f/opt/ventsrv/ventrilo_srv >>/var/log/ventrilo.log 2>&1
