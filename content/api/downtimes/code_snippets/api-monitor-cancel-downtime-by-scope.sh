#!/bin/bash

api_key="<YOUR_API_KEY>"
app_key="<YOUR_APP_KEY>"

curl -X POST -H "Content-type: application/json" -H "Accept: application/json" \
-d "{
      \"scope\": \"host:i-123\"
}" \
   "https://api.datadoghq.com/api/v1/downtime/cancel/by_scope?api_key=${api_key}&application_key=${app_key}"