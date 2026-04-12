### NGINX with PROMETHEUS & GRAFANA 

docker-compose file that reverse proxies, logs and monitors http traffic.

## Containers 

* nginx - host port 80 and reverse proxy publicly hosted docker exposed ports via named hosts
* nginx-exporter - prometheus status information for nginx
* prometheus - Monitoring platform with graphing/alerting capability
* promtail - picks up nginx logs for loki
* loki - collects stats in a format for grafana
* grafana - UI to see NGINX logs

## Ports
* 80 - nginx, expected to behind an https load balancer (but could be setup for https)

Protect the following from exposure to the Internet

* 9080 - nginx status
* 9090 - prometheus UI. no password, protect this port from being exposed to the outside world
* 9113 - prometheus nginx exporter page, endpoint prometheus uses for web server point in time stats
* 9000 - grafana UI, no password
* 9095 - promtrail
* 9088 - promtrail
* 9096 - loki
* 9100 - loki

## Architecture

Containers run on host network, so as to successfully reverse proxy for any open ports running on the host. 

## start 

```docker compose up```

