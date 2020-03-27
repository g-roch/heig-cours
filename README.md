# HEIG-VD

Ce dépôt est là pour rassembler tous les documents et informations que je reçois durant mes études à l'HEIG-VD.

Pour demandé un accès à un sous-dépôt privé, ouvré une Issue sur ce dépôt.

Pour clone ce dépôt avec les sous-dépôt : 

```bash
git clone --recursive git@github.com:g-roch/heig.git
```

ou

```bash
git clone git@github.com:g-roch/heig.git
git submodule init
git submodule update
```

## Hooks

Un hook est disponible pour mettre à jours automatiquement le fichier `TODO.md` à partir des fichiers `cours/*/README.md` avant chaque commit (et l'ajouter automatiquement au commit).

Pour l'installer, executer la commande suivante (pour autant que vous ne soyer pas dans un sous-module) :

```bas
ln -s .hooks-pre-commit .git/hooks/pre-commit
```

## Cours

- [ANA](cours/ana/README.md)
- [GEN](cours/gen/README.md)
- [PCO](cours/pco/README.md)
- [PRO](cours/pro/README.md)
- [RES](cours/res/README.md)
- [SLO](cours/slo/README.md)
- [SOS](cours/sos/README.md)
- [SRX](cours/srx/README.md)

## Outils

- [Bot telegram pour vérifier les notes sur GAPS (en python)](tools/bot/)