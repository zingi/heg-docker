# **H**DF-**E**OS to **G**eoTIFF Conversion Tool
_[HDF-EOS to GeoTIFF Conversion Tool](https://newsroom.gsfc.nasa.gov/sdptoolkit/HEG/HEGDownload.html), packed into a docker container_

**docker-compose.yml**:
```yaml
version: "3.7"
services: 
  heg:
    image: zingi/heg:1.1.0
    container_name: heg
    network_mode: "host"
    volumes: 
      - $HOME/.Xauthority:/root/.Xauthority:rw
      # - /path/to/my/folder/with/hdf-files/:/root/data
    environment: 
      - DISPLAY
```

## Starting the container with the provided docker-compose.yml
1. `cd` into the the folder of the **docker-compose.yml** file 
2. Then start it with `docker-compose up -d`

## Starting the HEG GUI (only works if host is linux)
1. On the host: `xhost +local:all` allow local requests to the X server
2. Start the GUI application from the container: `docker exec -it heg HEG`
