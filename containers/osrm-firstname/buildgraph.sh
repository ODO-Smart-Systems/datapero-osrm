#!/bin/sh

osrm-extract -p /opt/foot_firstname.lua /data/osm.pbf
osrm-partition /data/osm.osrm
osrm-customize /data/osm.osrm