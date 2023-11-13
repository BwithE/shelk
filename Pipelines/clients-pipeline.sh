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
        "First time seen",
        "Last time seen",
        "Power",
        "# packets",
        "BSSID",
        "ESSID"
      ],
      "ignore_missing": false
    }
  },
  {
    "date": {
      "field": "First time seen",
      "timezone": "America/New_York",
      "formats": [
        "yyyy-MM-dd HH:mm:ss"
      ]
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