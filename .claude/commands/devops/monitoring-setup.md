---
description: Generate monitoring and alerting configuration
argument-hint: [service_name]
---

Generate comprehensive monitoring and alerting setup for: $ARGUMENTS

## Instructions
Create a complete monitoring strategy including metrics collection, alerting rules, dashboards, and response procedures:

1. **Metrics Collection**:
   - Key performance indicators (KPIs)
   - Business metrics
   - Technical metrics
   - Custom application metrics

2. **Alerting Strategy**:
   - Alert severity levels
   - Escalation procedures
   - Alert fatigue prevention
   - On-call schedules

3. **Dashboard Design**:
   - System overview dashboards
   - Service-specific dashboards
   - Business intelligence dashboards
   - Incident response dashboards

4. **Response Procedures**:
   - Incident response playbooks
   - Troubleshooting guides
   - Communication templates
   - Post-incident review process

## Output Format
```
# Monitoring and Alerting Setup: [Service Name]

## Metrics Collection Strategy

### Application Metrics
#### Performance Metrics
- **Response Time**: [Description, collection method]
- **Throughput**: [Description, collection method]
- **Error Rate**: [Description, collection method]
- **Request Count**: [Description, collection method]

#### Business Metrics
- **[Business Metric 1]**: [Description, importance]
- **[Business Metric 2]**: [Description, importance]

#### Resource Metrics
- **CPU Usage**: [Collection method, thresholds]
- **Memory Usage**: [Collection method, thresholds]
- **Disk Usage**: [Collection method, thresholds]
- **Network I/O**: [Collection method, thresholds]

### Database Metrics
- **Connection Pool**: [Metrics to track]
- **Query Performance**: [Slow queries, execution plans]
- **Replication Lag**: [For replicated databases]
- **Lock Contention**: [Deadlock monitoring]

### External Service Metrics
- **[Service 1]**: [Availability, response time, error rate]
- **[Service 2]**: [Availability, response time, error rate]

## Alerting Strategy

### Alert Severity Levels
#### Critical (P0) - Immediate Response Required
- **Service Down**: [Alert condition]
- **High Error Rate**: > 10% for 5 minutes
- **Response Time**: > 5 seconds for 3 minutes
- **Database Connection**: Failure for 1 minute

#### High (P1) - Response within 15 minutes
- **Elevated Error Rate**: > 5% for 10 minutes
- **Slow Response**: > 2 seconds for 5 minutes
- **High Memory Usage**: > 85% for 10 minutes
- **Queue Buildup**: [Specific threshold]

#### Medium (P2) - Response within 1 hour
- **Moderate Error Rate**: > 2% for 15 minutes
- **Performance Degradation**: Response time > 1s for 10 minutes
- **Resource Usage**: CPU > 70% for 15 minutes

#### Low (P3) - Response within 4 hours
- **Informational**: Non-critical issues
- **Trend Alerts**: Gradual performance changes
- **Capacity Planning**: Resource usage trends

### Alert Rules Configuration
```yaml
# Example alert rules
groups:
  - name: [service_name]
    rules:
      - alert: ServiceDown
        expr: up{service="[service_name]"} == 0
        for: 1m
        labels:
          severity: critical
        annotations:
          summary: "[service_name] is down"
          description: "[service_name] has been down for more than 1 minute"

      - alert: HighErrorRate
        expr: rate(http_requests_total{status=~"5.."}[5m]) / rate(http_requests_total[5m]) > 0.10
        for: 5m
        labels:
          severity: critical
        annotations:
          summary: "High error rate detected"
          description: "Error rate is {{ $value | humanizePercentage }}"
```

### Escalation Policy
#### First Responder (0-15 minutes)
- **Contact**: [On-call engineer]
- **Actions**: 
  - Acknowledge alert
  - Begin initial investigation
  - Check dashboard for patterns

#### Team Lead (15-60 minutes)
- **Contact**: [Team lead/manager]
- **Actions**:
  - Coordinate response
  - Escalate if needed
  - Communicate with stakeholders

#### Incident Commander (60+ minutes)
- **Contact**: [Incident commander]
- **Actions**:
  - Declare incident
  - Mobilize response team
  - Manage stakeholder communications

## Dashboard Design

### System Overview Dashboard
#### Key Widgets
- **Service Health Status**: Overall health indicator
- **Response Time Trend**: 24-hour response time graph
- **Error Rate**: Current error rate with trend
- **Request Volume**: Requests per minute graph
- **Resource Usage**: CPU, memory, disk usage
- **Top Errors**: Most frequent error messages

### Service-Specific Dashboard
#### [Service Name] Metrics
- **Business Metrics**: [Service-specific KPIs]
- **Technical Performance**: Response times by endpoint
- **Error Analysis**: Error breakdown by type
- **Dependencies**: External service status
- **Database Performance**: Query performance metrics

### Incident Response Dashboard
#### Real-time Incident View
- **Active Alerts**: Current alert status
- **Incident Timeline**: Event progression
- **System Impact**: Affected components and users
- **Response Team**: Current responders and actions
- **Communication Log**: Stakeholder notifications

## Implementation Configuration

### Prometheus Configuration
```yaml
# Prometheus configuration for [service_name]
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: '[service_name]'
    static_configs:
      - targets: ['localhost:9090']
    metrics_path: '/metrics'
    scrape_interval: 10s
```

### Grafana Dashboard JSON
[Dashboard configuration with panels and queries]

### Log Aggregation Setup
```yaml
# ELK stack configuration for [service_name]
input:
  beats:
    port: 5044

filter:
  - service: "[service_name]"
    fields:
      log_level: ["error", "warning", "info"]

output:
  elasticsearch:
    hosts: ["elasticsearch:9200"]
    index: "[service_name]-%{+YYYY.MM.dd}"
```

## Response Procedures

### Incident Response Playbook
#### Step 1: Acknowledge and Assess (0-5 minutes)
- [ ] Acknowledge alert in monitoring system
- [ ] Check dashboard for system status
- [ ] Identify affected components and users
- [ ] Estimate business impact

#### Step 2: Initial Investigation (5-15 minutes)
- [ ] Review recent deployments and changes
- [ ] Check logs for error patterns
- [ ] Verify external service status
- [ ] Assess if rollback is needed

#### Step 3: Resolution Actions (15-60 minutes)
- [ ] Implement fix based on investigation
- [ ] Monitor system for recovery
- [ ] Verify fix is working correctly
- [ ] Document actions taken

#### Step 4: Recovery and Communication (60+ minutes)
- [ ] Confirm full system recovery
- [ ] Communicate resolution to stakeholders
- [ ] Update documentation if needed
- [ ] Schedule post-incident review

### Post-Incident Review
#### Review Template
- **Timeline**: What happened and when
- **Impact**: Business and user impact
- **Root Cause**: Primary cause analysis
- **Resolution**: How the issue was fixed
- **Prevention**: Actions to prevent recurrence
- **Learnings**: What we can improve

## Monitoring Tools and Setup

### Required Tools
- **Metrics Collection**: Prometheus/Pushgateway
- **Visualization**: Grafana
- **Alerting**: AlertManager/PagerDuty
- **Log Aggregation**: ELK Stack or similar
- **APM**: New Relic/DataDog/AppDynamics

### Installation Commands
```bash
# Install monitoring stack
docker-compose -f monitoring/docker-compose.yml up -d

# Configure service metrics
curl -X POST http://prometheus:9090/api/v1/targets

# Setup Grafana dashboards
curl -X POST http://grafana:3000/api/dashboards/db
```

## Cost Optimization
- **Metrics Retention**: Configure appropriate retention periods
- **Sampling**: Use sampling for high-volume metrics
- **Alert Consolidation**: Reduce alert noise through intelligent grouping
- **Storage Optimization**: Use efficient storage formats

## Security Considerations
- **Access Control**: Role-based access to monitoring systems
- **Data Privacy**: Ensure sensitive data is not logged
- **Network Security**: Secure monitoring traffic
- **Audit Logs**: Log access to monitoring systems
```

Focus on creating a comprehensive monitoring setup that provides visibility into both technical and business aspects of the service.