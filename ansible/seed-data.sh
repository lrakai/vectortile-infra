#!/usr/bin/env bash

DB=http://db:9200
INDEX=geo
TYPE=activity

# Create geo index
curl -X PUT $DB/$INDEX -d '
{
    "mappings": {
        "'"$TYPE"'": {
            "properties": {
                "level": {
                    "type": "string",
                    "index": "not_analyzed" 
                },
                "location": {
                    "type": "geo_point"
                }
            }
        }
    }
}'

curl -X PUT $DB/$INDEX/$TYPE/1 -d '
{
  "level": "severe",
  "location": [ -86.78163, 36.16277 ] 
}'

curl -X PUT $DB/$INDEX/$TYPE/2 -d '
{
  "level": "severe",
  "location": [ -86.781683, 36.16281 ] 
}'

curl -X PUT $DB/$INDEX/$TYPE/2 -d '
{
  "level": "severe",
  "location": [ -86.78170, 36.16271 ] 
}'