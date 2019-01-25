#!/bin/bash

DATADIR="/var/lib/postgresql/11/main"
CONF="/etc/postgresql/11/main/postgresql.conf"
POSTGRES="/usr/lib/postgresql/11/bin/postgres"
INITDB="/usr/lib/postgresql/11/bin/initdb"

trap "echo \"Sending SIGTERM to postgres\"; killall -s SIGTERM postgres" SIGTERM

su postgres sh -c "$POSTGRES -D $DATADIR -c config_file=$CONF" &

osrm-routed --algorithm mld /data/osm.osrm