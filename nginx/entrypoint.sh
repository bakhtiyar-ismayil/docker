#!/bin/bash
set -e

# Start Zabbix agent service
service zabbix-agent start

# Execute CMD
exec "$@"

