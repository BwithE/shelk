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
        "First time seen",
        "Last time seen",
        "channel",
        "Speed",
        "Privacy",
        "Cipher",
        "Authentication",
        "Power",
        "# beacons",
        "# IV",
        "LAN IP",
        "ID-length",
        "ESSID",
        "Key"
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
    "convert": {
      "field": "Power",
      "type": "long",
      "ignore_missing": true
    }
  },
  {
    "convert": {
      "field": "Speed",
      "type": "long",
      "ignore_missing": true
    }
  },
  {
    "convert": {
      "field": "channel",
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