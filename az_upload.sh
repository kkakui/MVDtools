#! /bin/bash
COMPANIES=(company1:key1 company2:key2 company3:key3)
ENDPOINT_BASE=http://localhost:10000/

for target in ${COMPANIES[@]}; do
  az storage container create --name src-container \
    --account-name ${target%:*}assets \
    --account-key ${target#*:} \
    --blob-endpoint ${ENDPOINT_BASE}${target%:*}assets
done

for target in ${COMPANIES[@]}; do
  az storage blob upload --container-name src-container --name text-document.txt --file test1.txt \
    --account-name ${target%:*}assets \
    --account-key ${target#*:} \
    --blob-endpoint ${ENDPOINT_BASE}${target%:*}assets
  az storage blob upload --container-name src-container --name text-document-2.txt --file test2.txt \
    --account-name ${target%:*}assets \
    --account-key ${target#*:} \
    --blob-endpoint ${ENDPOINT_BASE}${target%:*}assets
done

exit
