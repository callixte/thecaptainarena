# L'Arène

## Prérequis

Installer `docker` et `docker-compose`

## Premier démarage

On utilise `docker-compose` pour faire lancer les instances.

```
$> docker-compose up
```

La première fois, docker télécharge toutes les images et ça peut prendre du temps.

PostgreSQL peut se plaindre de ne pas avoir accès à son répertoire. Dans ce cas,
dans un autre terminal:
```
$> sudo chmod -R a+rwx tmp
```

Ensuite, dans un autre terminal:

```
$> docker-compose run web rails db:create
```
pour créer la base et puis:
```
$> docker-compose run web rails db:seed
```
pour générer des données. On peut alors accéder à l'arène http://localhost:3000/

## Ensuite

D'une manière générale, on utilise `docker-compose run web <command>` pour lancer
une commande dans le container rails. Par exemple:
```
$> docker-compose run web rails test
```
pour lancer les tests unitaires.

## Notes

* les containers ne sont pas production-ready.

* l'asset pipeline n'est pas configuré.

* je ne suis pas très front-end, le styling est minimal.

* la selection de l'avatar pourrait être amélioré.
