[.features[] | select(.properties."owner:type" == "cooperative")]
| group_by(.properties.owner)
| map({ 
    owner_wikidata: .[0].properties."owner:wikidata",
    owner: .[0].properties.owner, 
    owner_short: .[0].properties."owner:short", 
    owner_abbr: .[0].properties."owner:abbr",
    owner_website: .[0].properties."owner:website", 
    buildings: (select(.[0].properties.building != null) | length)  
})
