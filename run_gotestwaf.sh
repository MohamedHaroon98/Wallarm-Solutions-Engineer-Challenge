#!/bin/bash

URL="http://$(kubectl get ingress -n demo httpbin -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')/gotestwaf"

docker run --rm -v ${PWD}/reports:/app/reports \
  wallarm/gotestwaf \
  --url "$URL" \
  --noEmailReport \
  --reportFormat html \
  --reportName "gotestwaf-monitor" \
  --blockStatusCodes 403 \
  --nonBlockedAsPassed
