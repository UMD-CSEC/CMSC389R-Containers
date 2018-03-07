#!/bin/bash
docker run --read-only --privileged=false --cap-drop all --cap-add SYS_CHROOT --cap-add SETUID --cap-add CHOWN -i --rm vuln_scan:latest /bin/bash
