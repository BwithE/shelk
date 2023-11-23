#!/bin/bash
curl -X PUT "127.0.0.1:9200/_ingest/pipeline/local-aps-pipeline" -H 'Content-Type: application/json' -d'
{
  "description": "Access Points Pipeline",
  "processors": [
  {
    "csv": {
      "field": "message",
      "target_fields": [
        "BSSID",
        "channel",
        "Privacy",
        "Cipher",
        "Authentication",
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
