# datapero-osrm

2 exemples qui montrent les possibilités d'OSRM - développés pour le MeetUp "Data Sur La Ville" 

Note : Les 2 exemples fonctionnement uniquement sur l'agglomération d'Angers.

Pré-requis :
* Docker et docker-compose doivent être installés

## Itinéraire piétons "Jamais trop loin d'un bar"

   docker-compose up osrm-bars

Patientez quelques minutes pendant le téléchargement et la construction du graphe OSRM...
Accédez à l'application en utilisant l'URL `http://localhost:9966`

## Itinéraire piétons fonction du nombre d'occurence des prénoms dans le nom des voies

A partir du jeu de données Open Data "Prénoms des enfants nés à Angers" https://data.angers.fr/explore/dataset/prenoms-des-enfants-nes-a-angers/table/?refine.annee=2018&sort=-nombre_occurences

   docker-compose up osrm-firstname

Patientez quelques minutes pendant le téléchargement et la construction du graphe OSRM...
Accédez à l'application en utilisant l'URL `http://localhost:9966`