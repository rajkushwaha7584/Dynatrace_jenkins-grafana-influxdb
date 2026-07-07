# Jenkins Grafana InfluxDB Pipeline Monitoring

This project monitors Jenkins pipeline pass/fail status using InfluxDB and Grafana.

## Flow

Jenkins Pipeline → InfluxDB → Grafana Dashboard

## Dashboard Metrics

The dashboard shows:

- Total pipelines
- Passed pipelines
- Failed pipelines

## Tools Used

- Jenkins
- InfluxDB
- Grafana
- Docker Compose
- Jenkins InfluxDB Plugin

## Services

| Tool | URL |
|---|---|
| Jenkins | http://localhost:8080 |
| InfluxDB | http://localhost:8086 |
| Grafana | http://localhost:3000 |

## Jenkins InfluxDB Target

| Field | Value |
|---|---|
| Description | jenkins-influxdb |
| URL | http://influxdb:8086 |
| Organization | devops |
| Bucket | jenkins |
| Credential ID | influxdb-token |

## Grafana Dashboard

Dashboard JSON path:

```text
grafana/dashboards/jenkins-pipeline-weekly-dashboard.json
