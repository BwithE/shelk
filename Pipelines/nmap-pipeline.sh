#!/bin/bash
curl -X PUT "127.0.0.1:9200/_ingest/pipeline/local-nmap-pipeline" -H 'Content-Type: application/json' -d'
{
  "description": "nmap Pipeline",
  "processors": [
    {
      "csv": {
        "field": "message",
        "target_fields": ["IP", "Host", "OS", "Proto", "Port", "Service", "Product"],
        "ignore_missing": false
      }
    },
    {
      "convert": {
        "field": "Port",
        "type": "long",
        "ignore_missing": true
      }
    },
    {
      "remove": {
        "field": "message"
      }
    }
  ]
}
'
