# datapero-osrm

2 exemples qui montrent les possibilités d'OSRM - développés spécialement pour le MeetUp @DataperoAngers "Data Sur La Ville" 

**Note :** Les 2 exemples fonctionnement uniquement sur l'agglomération d'Angers.

Pré-requis :
* Docker et docker-compose

## Itinéraire piétons "Jamais trop loin d'un bar"

```
docker-compose up osrm-bars
```

1. Patientez quelques minutes pendant le téléchargement et la construction du graphe OSRM...
2. Accédez à l'application en utilisant l'URL `http://localhost:9966`

## Itinéraire piétons "Prénoms à la mode"

A partir du jeu de données Open Data "Prénoms des enfants nés à Angers" https://data.angers.fr/explore/dataset/prenoms-des-enfants-nes-a-angers/table/?refine.annee=2018&sort=-nombre_occurences

```
docker-compose up osrm-firstname
```

1. Patientez quelques minutes pendant le téléchargement et la construction du graphe OSRM...
2. Accédez à l'application en utilisant l'URL `http://localhost:9966`
