#!/bin/bash
echo "SSH Root Login: $(grep -q 'PermitRootLogin no' /etc/ssh/sshd_config && echo PASS || echo FAIL)"
