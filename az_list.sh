#! /bin/bash
COMPANIES=(company1:key1 company2:key2 company3:key3)
ENDPOINT_BASE=http://localhost:10000/

for target in ${COMPANIES[@]}; do
  echo [${target%:*}]
  az storage blob list --container-name src-container \
    --account-name ${target%:*}assets \
    --account-key ${target#*:} \
    --blob-endpoint ${ENDPOINT_BASE}${target%:*}assets | jq .[].name
done

exit
