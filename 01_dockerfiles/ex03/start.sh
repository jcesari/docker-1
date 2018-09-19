#!/bin/bash

/opt/gitlab/embedded/bin/runsvdir-start &
mkdir -p /var/run/sshd
/usr/sbin/sshd &
gitlab-ctl reconfigure
gitlab-ctl tail