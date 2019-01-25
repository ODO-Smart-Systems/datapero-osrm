#!/bin/sh

su postgres sh -c "createdb -U postgres -E UTF8 -O postgres gis"
su postgres sh -c "psql -U postgres -d gis -c 'CREATE EXTENSION postgis;'"
su postgres sh -c "psql -U postgres -d gis -c 'CREATE EXTENSION postgis_topology;'"
# -m option stands for -mapping-file and helps defining the way osm fields
#     will be turned into a POSTGIS database. It seems that both imposm commands
#     below must wear that option, otherwise default mappingfile is applied
imposm --read -m /opt/custommapping.py /data/osm.pbf
imposm --write -m /opt/custommapping.py --connection postgis://datapero:DataPer0@localhost:5434/gis