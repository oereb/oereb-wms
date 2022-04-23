# oereb-wms

WMS server for OEREB-Kataster.

**Achtung**: Das `linux/arm64`-Image verwendet QGIS 3.10 aus dem Ubuntu-Repo. Im Ubuntugis-Repo gibt es keine `linux/arm64`-Pakete.

# startup and shutdown

## startup
```
docker-compose up --build
```

## shutdown
```
ctrl-c
```

```
docker-compose down
```

The `docker-compose down` command makes sure the image is also set back into its original state, so one can run the import of the OEREB and AV data again without issues.

## tests
Currently only the GetCapabilities command of both services is tested. See the "script" section in the corresponding [main.yml](.github/workflows/main.yml) file for the commands to manually run the tests.

The tests are in the bash script [tests/test-wms.sh](tests/test-wms.sh).

```
docker-compose -f docker-compose.test.yml build
docker-compose -f docker-compose.test.yml run test-qgis-server
```
