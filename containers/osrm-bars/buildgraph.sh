#!/bin/sh

osrm-extract -p /opt/foot_bars.lua /data/osm.pbf
osrm-partition /data/osm.osrm
osrm-customize /data/osm.osrm