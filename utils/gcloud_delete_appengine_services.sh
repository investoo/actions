#!/bin/sh -l

echo "Checking for stopped App Engine services..."

STOPPED_SERVICES=$(gcloud app  --project ${GCLOUD_PROJECT_ID} versions list --filter="SERVICE = ${GH_PROJECT_NAME} AND SERVING_STATUS = STOPPED" --sort-by="LAST_DEPLOYED" --format="value(VERSION.ID)" &)
STOPPED_SERVICES_COUNT=$(echo "$STOPPED_SERVICES" | wc -l)

if [ "$STOPPED_SERVICES_COUNT" -gt 2 ]; then
  NUMBER_OF_SERVICES_TO_KILL=$((STOPPED_SERVICES_COUNT - 2))
  SERVICES_TO_KILL=$(echo "$STOPPED_SERVICES" | head -n $NUMBER_OF_SERVICES_TO_KILL)
  echo "Deleting ${NUMBER_OF_SERVICES_TO_KILL} excess services..."
  gcloud app --project ${GCLOUD_PROJECT_ID} versions delete $SERVICES_TO_KILL
fi