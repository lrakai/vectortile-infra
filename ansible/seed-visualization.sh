#/usr/bin/env bash

DB=http://db:9200
INDEX=.kibana

#insert documents by id
insert() {
    curl -X PUT $DB/$INDEX/$1/$2 -d "$3"
}

insert "index-pattern" "geo" '{
    "title":"geo","fields":"[{\"name\":\"label\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"indexed\":true,\"analyzed\":true,\"doc_values\":false,\"searchable\":true,\"aggregatable\":false},{\"name\":\"_source\",\"type\":\"_source\",\"count\":0,\"scripted\":false,\"indexed\":false,\"analyzed\":false,\"doc_values\":false,\"searchable\":false,\"aggregatable\":false},{\"name\":\"geometry\",\"type\":\"geo_point\",\"count\":0,\"scripted\":false,\"indexed\":true,\"analyzed\":false,\"doc_values\":true,\"searchable\":true,\"aggregatable\":true},{\"name\":\"_id\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"indexed\":false,\"analyzed\":false,\"doc_values\":false,\"searchable\":false,\"aggregatable\":false},{\"name\":\"_type\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"indexed\":false,\"analyzed\":false,\"doc_values\":false,\"searchable\":true,\"aggregatable\":true},{\"name\":\"_index\",\"type\":\"string\",\"count\":0,\"scripted\":false,\"indexed\":false,\"analyzed\":false,\"doc_values\":false,\"searchable\":false,\"aggregatable\":false},{\"name\":\"_score\",\"type\":\"number\",\"count\":0,\"scripted\":false,\"indexed\":false,\"analyzed\":false,\"doc_values\":false,\"searchable\":false,\"aggregatable\":false}]"
}'

insert "visualization" "e5925130-ec27-11e6-8183-d7497368994d" '{
    "title":"point-map","visState":"{\"title\":\"point-map\",\"type\":\"tile_map\",\"params\":{\"mapType\":\"Scaled Circle Markers\",\"isDesaturated\":true,\"addTooltip\":true,\"heatMaxZoom\":16,\"heatMinOpacity\":0.1,\"heatRadius\":25,\"heatBlur\":15,\"heatNormalizeData\":true,\"legendPosition\":\"bottomright\",\"mapZoom\":2,\"mapCenter\":[15,5],\"wms\":{\"enabled\":false,\"url\":\"https://basemap.nationalmap.gov/arcgis/services/USGSTopo/MapServer/WMSServer\",\"options\":{\"version\":\"1.3.0\",\"layers\":\"0\",\"format\":\"image/png\",\"transparent\":true,\"attribution\":\"Maps provided by USGS\",\"styles\":\"\"}}},\"aggs\":[{\"id\":\"1\",\"enabled\":true,\"type\":\"count\",\"schema\":\"metric\",\"params\":{}},{\"id\":\"2\",\"enabled\":true,\"type\":\"geohash_grid\",\"schema\":\"segment\",\"params\":{\"field\":\"geometry\",\"autoPrecision\":true}}],\"listeners\":{}}","uiStateJSON":"{\"mapCenter\":[36.0907250822317,-86.75010681152344],\"mapZoom\":10}","description":"","kibanaSavedObjectMeta":{"searchSourceJSON":"{\"index\":\"geo\",\"query\":{\"query_string\":{\"query\":\"*\",\"analyze_wildcard\":true}},\"filter\":[]}"}
}'