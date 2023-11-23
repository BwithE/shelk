#!/bin/bash
curl -X PUT "127.0.0.1:9200/_ingest/pipeline/local-clients-pipeline" -H 'Content-Type: application/json' -d'
{
  "description": "Clients Pipeline",
  "processors": [
  {
    "csv": {
      "field": "message",
      "target_fields": [
        "Client MAC",
        "BSSID",
        "ESSID"
      ],
      "ignore_missing": false
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
