#!/bin/bash

#!/bin/bash

script_folder="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
cd $script_folder

. ./config

if [ ! $1 ]
then
	echo "Spécifier un conteneur"
	exit 1
fi

if [ ! `zfs list "$zfs_lxc_root/$1" | grep "NAME"` ]
then
	echo "Le conteneur $1 n'existe pas"
	exit 2
fi

echo "Suppression des snapshots du conteneur $1"

./zfs_snap_destroy.sh $zfs_lxc_root/$1

