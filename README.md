### NGINX PROMETHEUS 

docker-compose file that reverse proxies, logs and monitors http traffic.

## Containers 

* nginx - host port 80 and reverse proxy publicly hosted docker exposed ports via named hosts
* nginx-exporter - prometheus status information for nginx
* prometheus - Monitoring platform with graphing/alerting capability
* promtail - picks up nginx logs for loki
* loki - collects stats in a format for grafana
* grafana - UI to see NGINX stats


## Ports
* 80 - nginx, expected to behind an https load balancer (but could be setup for https)
* 9090 - prometheus UI. no password, protect this port from being exposed to the outside world
* 9113 - prometheus nginx status page, endpoint prometheus uses to garner server state
* 9080 - nginx status page (to be depreciated)
* 3000 - grafana UI, no password, protect this port from being exposed to the outside world
* 9100 - loki

