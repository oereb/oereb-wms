#!/usr/bin/env bash
#script for testing the status code of a GetCapabilities request. Should normally output status code 200

#give qgis-server and pg a bit of time to properly initiate
echo "wait 20 seconds to allow PG and QGIS server to properly initiate"
sleep 20

STATUS_CODE_OEREB=`/usr/bin/curl -LI -o /dev/null -w "%{http_code}\n" -s "http://qgis-server/wms/oereb?SERVICE=WMS&REQUEST=GetCapabilities"`
echo "HTTP STATUS-CODE-OEREB=$STATUS_CODE_OEREB"

if [ $STATUS_CODE_OEREB = 200 ]
then
  exit 0
else
  exit 1
fi
