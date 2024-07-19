
1. Go to jenkins in the browser (normally `localhost:8080`)
2. Go to Manage Jenkins and under System Configuration click Plugins. Under Plugins in the left press Installed Plugins. Make sure you have `Prometheus metrics plugin` installed. If you don't you can install it from the Available Plugins.
3. Go to Manage Jenkins and under System Configuration click System. Go down until you find Prometheus, you should see something like the screenshot jenkins-prometheus.png. If you don't then you probably didn't install `Prometheus metrics plugin` correctly.
4. Enter the Prometheus docker with `docker exec -it name_of_prometheus_container /bin/sh`
5. Connect Prometheus to Jenkins. cd to `/etc/prometheus` and add through vi or nano the following code to `prometheus.yml`

        - job_name: "jenkins"
            metrics_path: /prometheus
            static_configs:
            - targets: ["jenkins:8080"]
    Make sure your yml has the correct identation.
6. exit the prometheus container with `exit`
7. Resetart the prometheus container with `docker restart name_of_prometheus_container`
8. In the browser go to Grafana container (`localhost:3000`). Login using the user `admin` and the password `admin`. 
9. Click in Add Data Source, click on Prometheus. In `Prometheus server URL *` enter `http://prometheus:9090`. Refer to grafana_prometheus_datasource.png
10. On the button Save & test. You should see a message saying 'Successfully queried the Prometheus API.' Refer to screenshot successful_message_datasource.png
11. In Grafana (`localhost:3000`) click on the burger menu and then click in Dashboards.



