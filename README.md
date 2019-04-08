# L'Arène

## Prérequis

Installer `docker` et `docker-compose`

## Premier démarage

On utilise `docker-compose` pour faire lancer les instances.

```
$> docker-compose up
```

La première fois, docker télécharge toutes les images et ça peut prendre du temps.

Ensuite, dans un autre terminal:

```
$> docker-compose run web rails db:create
```
pour créer la base et puis:
```
$> docker-compose run web rails db:seed
```
pour générer des données.

## Ensuite

D'une manière générale, on utilise `docker-compose run web <command>` pour lancer
une commande dans le container rails. Par exemple:
```
$> docker-compose run web rails test
```
pour lancer les tests unitaires.
