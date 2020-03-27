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

Un hook est disponible pour vérifier que le fichier `TODO.md` est à jours à partir des fichiers `cours/*/README.md` avant chaque commit.

Pour l'installer, executer la commande suivante (pour autant que vous ne soyer pas dans un sous-module) :

```bash
ln -rs .hooks-pre-commit .git/hooks/pre-commit
```

Pour mettre à jour `TODO.md`

```bash
./update.sh
```

## Cours

- [ANA](cours/ana/)
- [GEN](cours/gen/)
- [PCO](cours/pco/)
- [PRO](cours/pro/)
- [RES](cours/res/)
- [SLO](cours/slo/)
- [SOS](cours/sos/)
- [SRX](cours/srx/)

## Outils

- [Bot telegram pour vérifier les notes sur GAPS (en python)](tools/bot/)
