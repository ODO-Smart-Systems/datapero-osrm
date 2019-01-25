#!/bin/sh

osrm-extract -p /opt/bars.lua /data/osm.pbf
osrm-partition /data/osm.osrm
osrm-customize /data/osm.osrm