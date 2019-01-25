FROM osrm/osrm-backend

RUN apt-get update && apt-get install -y wget osmctools postgresql postgis lua-sql-postgres && apt-get clean

# Get Regional PBF
RUN mkdir /data
RUN wget -O  /data/osm-reg.pbf http://download.geofabrik.de/europe/france/pays-de-la-loire-latest.osm.pbf

# Clip area to Angers
RUN osmconvert  /data/osm-reg.pbf -b=-0.6,47.3,-0.3,47.5  -o=/data/osm.pbf

# Handle access right to database
RUN echo "host    all             all             0.0.0.0/0               md5" >> /etc/postgresql/11/main/pg_hba.conf
RUN service postgresql start && /bin/su postgres -c "createuser -d -s -r -l datapero" && /bin/su postgres -c "psql postgres -c \"ALTER USER datapero WITH ENCRYPTED PASSWORD 'DataPer0'\"" && service postgresql stop

RUN echo "listen_addresses = '*'" >> /etc/postgresql/11/main/postgresql.conf
RUN echo "port = 5434" >> /etc/postgresql/11/main/postgresql.conf

# Load data into postgis db
RUN apt-get update && apt-get -y install build-essential python-dev protobuf-compiler libprotobuf-dev libtokyocabinet-dev python-psycopg2 libgeos-dev
RUN apt-get -y install python-pip
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org imposm
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org https://github.com/olt/shapely_speedups/tarball/master

# Load osm data in PostGis database
ADD custommapping.py /opt/custommapping.py
ADD loadpostgis.sh /opt/loadpostgis.sh
RUN chmod +x /opt/loadpostgis.sh
RUN service postgresql start && /opt/loadpostgis.sh && service postgresql stop

# Add route profile
ADD bars.lua /opt/bars.lua

# Build OSRM Graph
ADD buildgraph.sh /opt/buildgraph.sh
RUN chmod +x /opt/buildgraph.sh
RUN service postgresql start && /opt/buildgraph.sh && service postgresql stop

EXPOSE 5000 5434

ADD start.sh /start.sh
RUN chmod 0755 /start.sh

CMD ["/start.sh"]
