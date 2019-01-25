FROM osrm/osrm-backend

RUN apt-get update && apt-get install -y wget osmctools && apt-get clean

# Get Regional PBF
RUN mkdir /data
RUN wget -O /data/osm-reg.pbf http://download.geofabrik.de/europe/france/pays-de-la-loire-latest.osm.pbf

# Clip area to Angers
RUN osmconvert  /data/osm-reg.pbf -b=-0.6,47.3,-0.3,47.5  -o=/data/osm.pbf

# Add route profile
ADD foot_firstname.lua /opt/foot_firstname.lua

# Build OSRM Graph
ADD buildgraph.sh /opt/buildgraph.sh
RUN chmod +x /opt/buildgraph.sh
RUN /opt/buildgraph.sh

EXPOSE 5000
