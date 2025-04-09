#!/bin/bash

if [ ! $1 ]
then
	echo "Spécifier une partition"
	exit 1
fi

echo "Suppression des snapshots de la partition zfs $1"

for i in `zfs list -t snapshot $1 | grep -v NAME | awk '{print $1}'`;
do
	echo Suppression $i;
	zfs destroy $i;
done

