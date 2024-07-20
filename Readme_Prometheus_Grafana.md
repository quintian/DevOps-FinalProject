
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
13. In Dashboard on the right top corner click on the blue button that says new. Click on New Dashboard. 
14. Click on Add Visualization. You will be prompted to select a data source. Select Prometheus.
15. You should see the option to select a new visualization. Refer to screenshot grafana_new_ziz.png
16. In Metric input you will see different Jenkins metrics. There, you can choose the metrics you want to display in the dashboard. For example, select jenkins_health_check_score. Then on the top right you should see time series, click there and change it for Stat. You should see something similar to screenshot jenkins_health_score.
17. On the top right click on the blue Apply button. You should see something similar to screenshot initial_grafana_dashboard.png
18. Click on the top right Add button to add a new visualization of the metric you prefer. We included:
    - vm_memory_total_used
    - default_jenkins_builds_last_build_duration_milliseconds
    - jenkins_health_check_score
    - jenkins_node_builds_count
    - jenkins_runs_success_total
    - jenkins_runs_aborted_total
    - jenkins_queue_size_value
    - jenkins_executor_free_value
    - jenkins_executor_in_use_value
    - vm_cpu_load
You can see the finalized dashboard in final_grafana_dashboard.png

