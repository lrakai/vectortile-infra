#!/usr/bin/env bash

DB=http://db:9200
INDEX=geo
TYPE=activity

#insert documents by id
insert() {
    curl -X PUT $DB/$INDEX/$TYPE/$1 -d "$2"
}

# Create geo index
curl -X PUT $DB/$INDEX -d '
{
    "mappings": {
        "'"$TYPE"'": {
            "properties": {
                "label": {
                    "type": "string"
                },
                "geometry": {
                    "type": "geo_point"
                }
            }
        }
    }
}'

labels=("Tennessee State Capitol"
"Historical War Memorial Auditorium"
"Tennessee Performing Arts Center"
"Frothy Monkey"
"The Music City Rollin' Jamboree"  
"Johnny Cash Museum"
"Museum City Walk of Fame Park"
"Bridgestone Arena"
"Joe's Crabshack Nashville"
"Nissan Stadium")

geometries=("[ -86.784336, 36.165762 ]"
"[ -86.783735, 36.164368 ]"
"[ -86.782250, 36.164512 ]"
"[ -86.780954, 36.164125 ]"
"[ -86.777335, 36.163164 ]"
"[ -86.775828, 36.160876 ]"
"[ -86.776805, 36.159403 ]"
"[ -86.777879, 36.159339 ]"
"[ -86.774695, 36.160895 ]"
"[ -86.771372, 36.166359 ]")

for i in `seq 0 $((${#labels[@]}-1))`; do
   insert $i "{
       \"label\": \"${labels[$i]}\",
       \"geometry\": ${geometries[$i]}
   }"
done