# heg-docker
_HDF-EOS to GeoTIFF Conversion Tool, packed into a docker container_

## Starting the container with the provided docker-compose.yml
1. `cd` into the the folder of the **docker-compose.yml file** 
2. Then start it with `docker-compose up -d`

## Starting the HEG GUI (only works if host is linux)
1. On the host: `xhost +local:all` allow local requests to the X server
2. Start the GUI application from the container: `docker exec -it heg HEG`
