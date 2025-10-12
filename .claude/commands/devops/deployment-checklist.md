---
description: Generate deployment checklist for environments
argument-hint: [environment]
---

Generate comprehensive deployment checklist for: $ARGUMENTS

## Instructions
Create a detailed pre and post-deployment checklist tailored to the specified environment:

1. **Pre-deployment Preparation**:
   - Code quality and testing requirements
   - Environment-specific configurations
   - Backup and rollback procedures
   - Stakeholder communication

2. **Deployment Process**:
   - Step-by-step deployment sequence
   - Verification points and health checks
   - Performance monitoring setup
   - Error handling procedures

3. **Post-deployment Verification**:
   - Functionality testing
   - Performance validation
   - Monitoring and alerting
   - User acceptance criteria

## Output Format
```
# Deployment Checklist: [Environment]

## Pre-deployment Checklist (T-1 Day)

### Code Quality ✅
- [ ] All tests passing (Unit: X%, Integration: X%, E2E: X%)
- [ ] Code review completed and approved
- [ ] Static analysis completed with no critical issues
- [ ] Security scan completed and vulnerabilities addressed
- [ ] Performance tests completed with acceptable results

### Environment Preparation ✅
- [ ] Target environment is healthy and ready
- [ ] Configuration files updated for [environment]
- [ ] Environment variables verified
- [ ] Database migrations prepared and tested
- [ ] Backup strategy confirmed and tested

### Dependencies ✅
- [ ] External services are available and healthy
- [ ] API endpoints verified and accessible
- [ ] Third-party integrations tested
- [ ] CDN/cache invalidation planned

### Communication ✅
- [ ] Stakeholders notified of deployment window
- [ ] Maintenance notices sent (if applicable)
- [ ] Support team briefed on changes
- [ ] Documentation updated and published

## Deployment Checklist (T-Time)

### Deployment Sequence ✅
1. **[Step 1]**: [Action]
   - Command: `[command]`
   - Expected result: [description]
   - Verification: [how to verify]

2. **[Step 2]**: [Action]
   - Command: `[command]`
   - Expected result: [description]
   - Verification: [how to verify]

### Health Checks ✅
- [ ] Application is responding to health checks
- [ ] Database connections are healthy
- [ ] External service connections are working
- [ ] Background jobs are processing normally
- [ ] Memory and CPU usage within expected ranges

### Rollback Preparedness ✅
- [ ] Rollback plan documented and tested
- [ ] Previous version artifacts available
- [ ] Database rollback scripts ready
- [ ] Rollback verification steps defined

## Post-deployment Checklist (T+30 Minutes)

### Functionality Verification ✅
- [ ] Core user journeys tested and working
- [ ] API endpoints responding correctly
- [ ] Database operations working normally
- [ ] Authentication and authorization working
- [ ] Background jobs processing successfully

### Performance Validation ✅
- [ ] Response times within acceptable ranges (< Xms)
- [ ] Error rates below threshold (< X%)
- [ ] Database query performance acceptable
- [ ] Memory usage stable and within limits
- [ ] CPU usage within expected ranges

### Monitoring and Alerting ✅
- [ ] All monitoring dashboards showing green status
- [ ] Alert configurations verified and working
- [ ] Log aggregation receiving data correctly
- [ ] Error tracking configured and functional

### User Acceptance ✅
- [ ] Internal testing completed successfully
- [ ] Key stakeholders have verified functionality
- [ ] User feedback collected (if applicable)
- [ ] Documentation links verified and accessible

## Rollback Procedures (If Needed)

### Immediate Rollback (T+0-15 minutes)
```bash
# Commands to rollback deployment
[Rollback commands]
```

### Verification Steps
- [ ] Previous version is running and healthy
- [ ] Data integrity verified
- [ ] User functionality restored
- [ ] Monitoring shows normal operation

## Communication Templates

### Pre-deployment Notification
**Subject**: Scheduled Deployment - [Environment] - [Date/Time]
**Body**: [Template for notification]

### Deployment Complete Notification
**Subject**: Deployment Complete - [Environment] - [Version]
**Body**: [Template for completion notification]

### Rollback Notification
**Subject**: Deployment Rollback - [Environment] - [Version]
**Body**: [Template for rollback notification]

## Contacts and Escalation
- **Primary Deployer**: [Name/Contact]
- **Secondary Deployer**: [Name/Contact]
- **On-call Engineer**: [Name/Contact]
- **Product Owner**: [Name/Contact]
- **Support Lead**: [Name/Contact]

## Metrics to Monitor Post-deployment
- **Response Time**: Target < Xms
- **Error Rate**: Target < X%
- **Throughput**: Target > X requests/second
- **Memory Usage**: Target < X%
- **CPU Usage**: Target < X%
- **Database Connections**: Target < X active connections
```

Customize the checklist based on your specific deployment process and environment requirements.