#!/bin/bash
declare -a ARRAY
exec 10<&0
exec < $1
let count=0
while read LC; do
  ARRAY[$count]=$LC
  ((count++))
  echo "Preparing locale: $LC..."
  ./bin/compile-mo-files.sh $LC
  if [ ! -d $LC ] ; then
    mkdir $LC
  fi
  cp workdir/mo/$LC/civicrm.mo $LC
done

echo "To je konec :-)"
