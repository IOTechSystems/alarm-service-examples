#!/bin/sh
curl -X POST http://localhost:59720/rules -H 'Content-Type: application/json' -d '{
  "id": "rule",
  "sql": "SELECT avg(AirPressure) as avgPressure, CASE WHEN avg(AirPressure) > 2999 THEN true ELSE false END as setting FROM demo WHERE meta(deviceName) IN (\"Controller-0\", \"Controller-1\", \"Controller-2\") GROUP BY TUMBLINGWINDOW(ss, 10)",
  "actions": [
    {
      "mqtt": {
        "server": "tcp://mqtt-broker:1883",
        "topic": "xrt/mqtt/input",
        "clientId": "controller_avg",
        "dataTemplate": "{\"avgPressure\":{{.avgPressure}}, \"setting\":{{.setting}}, \"source\":\"ekuiper\"}",
        "sendSingle": true
      }
    },
    {
      "log": {}
    }
  ]
}'