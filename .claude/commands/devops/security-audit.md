---
description: Security review and recommendations for components
argument-hint: [component]
---

Conduct comprehensive security audit for: $ARGUMENTS

## Instructions
Perform a thorough security analysis covering authentication, authorization, data protection, and compliance:

1. **Security Assessment**:
   - Identify potential vulnerabilities
   - Assess current security controls
   - Review authentication and authorization
   - Evaluate data protection measures

2. **Threat Modeling**:
   - Identify potential attack vectors
   - Assess impact of security breaches
   - Prioritize security risks
   - Recommend mitigation strategies

3. **Compliance Review**:
   - Check regulatory compliance
   - Review industry standards adherence
   - Assess data privacy requirements
   - Validate security best practices

4. **Security Recommendations**:
   - Immediate security improvements
   - Long-term security roadmap
   - Security monitoring and alerting
   - Incident response procedures

## Output Format
```
# Security Audit Report: [Component]

## Executive Summary
**Security Posture**: [Overall security rating - Critical/High/Medium/Low]
**Key Findings**: [Number of critical/high/medium/low issues]
**Compliance Status**: [Compliance with relevant standards]
**Overall Risk**: [Risk assessment]

## Security Assessment Findings

### Critical Issues (Immediate Action Required)
1. **[Vulnerability 1]** - CVSS: [Score]
   - **Description**: [Detailed vulnerability description]
   - **Impact**: [Business and technical impact]
   - **Affected Components**: [List of affected parts]
   - **Exploitation**: [How this could be exploited]
   - **Remediation**: [Step-by-step fix]
   - **Timeline**: [Fix timeline]

### High Priority Issues
1. **[Vulnerability 2]** - CVSS: [Score]
   - **Description**: [Detailed vulnerability description]
   - **Impact**: [Business and technical impact]
   - **Remediation**: [Fix procedure]
   - **Timeline**: [Fix timeline]

### Medium Priority Issues
[Similar format for medium issues]

### Low Priority Issues
[Similar format for low issues]

## Authentication and Authorization Review

### Authentication Mechanisms
- **Current Implementation**: [Description of auth methods]
- **Strengths**: [What works well]
- **Weaknesses**: [Areas needing improvement]
- **Recommendations**:
  - **Immediate**: [Quick improvements]
  - **Long-term**: [Strategic improvements]

### Authorization Controls
- **Access Control Model**: [Current model description]
- **Role-based Access**: [RBAC implementation status]
- **Privilege Escalation**: [Controls and potential issues]
- **Recommendations**: [Improvement suggestions]

## Data Protection Assessment

### Data Classification
- **Sensitive Data**: [Types of sensitive data handled]
- **Data Flow**: [How data moves through the system]
- **Storage Security**: [Encryption and protection methods]
- **Data Lifecycle**: [Retention and deletion policies]

### Encryption Implementation
- **Data at Rest**: [Current encryption status]
- **Data in Transit**: [TLS/SSL implementation]
- **Key Management**: [Key storage and rotation]
- **Recommendations**: [Encryption improvements]

### Privacy Compliance
- **GDPR Compliance**: [Assessment status]
- **CCPA Compliance**: [Assessment status]
- **Data Subject Rights**: [Implementation status]
- **Privacy Policies**: [Current status and gaps]

## Infrastructure Security

### Network Security
- **Firewall Configuration**: [Current setup]
- **Network Segmentation**: [Implementation status]
- **DMZ Implementation**: [Current status]
- **Ingress/Egress Controls**: [Traffic controls]

### Container/Cloud Security
- **Container Security**: [Docker/Kubernetes security]
- **Cloud Configuration**: [Security settings review]
- **Identity and Access Management**: [IAM configuration]
- **Secrets Management**: [Current implementation]

### Application Security
- **Secure Coding Practices**: [Assessment of code security]
- **Dependency Security**: [Third-party library vulnerabilities]
- **API Security**: [API protection measures]
- **Session Management**: [Session security implementation]

## Threat Modeling

### Attack Surface Analysis
#### External Threats
- **Web Application Attacks**: [SQLi, XSS, CSRF vulnerabilities]
- **API Attacks**: [Authentication bypass, rate limiting]
- **Infrastructure Attacks**: [DDoS, network intrusion]

#### Internal Threats
- **Insider Threats**: [Privileged access risks]
- **Data Exfiltration**: [Potential data leakage points]
- **Privilege Escalation**: [Internal attack vectors]

### Attack Scenarios
1. **[Scenario 1]**: [Attack description and likelihood]
   - **Impact**: [Business impact]
   - **Prevention**: [Preventive measures]
   - **Detection**: [Detection methods]

## Compliance and Standards

### Regulatory Compliance
- **PCI DSS**: [If applicable, compliance status]
- **HIPAA**: [If applicable, compliance status]
- **SOX**: [If applicable, compliance status]
- **Industry Standards**: [Relevant standards compliance]

### Security Frameworks
- **NIST Cybersecurity Framework**: [Implementation status]
- **ISO 27001**: [Compliance assessment]
- **SOC 2**: [If applicable, status]
- **OWASP Top 10**: [Vulnerability assessment]

## Security Monitoring and Detection

### Current Monitoring Capabilities
- **Security Events**: [What's currently monitored]
- **Intrusion Detection**: [IDS/IPS implementation]
- **Log Analysis**: [Security log analysis capabilities]
- **Threat Intelligence**: [Threat feed integration]

### Recommended Enhancements
- **SIEM Implementation**: [Security information management]
- **Security Metrics**: [KPIs for security monitoring]
- **Alert Configuration**: [Security alerting setup]
- **Threat Hunting**: [Proactive threat detection]

## Incident Response Assessment

### Current Capabilities
- **Response Plan**: [Existing incident response plan]
- **Team Structure**: [Security team organization]
- **Communication Plan**: [Stakeholder notification process]
- **Documentation**: [Current incident procedures]

### Recommendations
- **Plan Enhancement**: [Improvements to response plan]
- **Team Training**: [Security training recommendations]
- **Tooling**: [Additional security tools needed]
- **Testing**: [Incident response testing schedule]

## Security Roadmap

### Immediate Actions (0-30 days)
1. **[Priority 1]**: [Critical security fix]
   - **Effort**: [Time/complexity estimate]
   - **Owner**: [Team/person responsible]
   - **Success Criteria**: [How to measure completion]

2. **[Priority 2]**: [High priority fix]
   - **Effort**: [Time/complexity estimate]
   - **Owner**: [Team/person responsible]

### Short-term Improvements (1-3 months)
- **[Improvement 1]**: [Security enhancement]
- **[Improvement 2]**: [Security enhancement]

### Long-term Strategic Initiatives (3-12 months)
- **[Initiative 1]**: [Major security project]
- **[Initiative 2]**: [Major security project]

## Security Best Practices Recommendations

### Development Security
- **Secure SDLC**: [Implement security in development lifecycle]
- **Code Reviews**: [Security-focused code review process]
- **Security Testing**: [Automated security testing]
- **Developer Training**: [Security awareness training]

### Operational Security
- **Access Management**: [Least privilege implementation]
- **Patch Management**: [Security patch procedures]
- **Backup Security**: [Secure backup procedures]
- **Disaster Recovery**: [Security-focused recovery plan]

## Cost and Resource Requirements

### Security Investment
- **Tools and Software**: [Security tooling costs]
- **Training**: [Security training budget]
- **Personnel**: [Security staff requirements]
- **Consulting**: [External security expertise]

### ROI Analysis
- **Risk Reduction**: [Quantified risk reduction]
- **Compliance Benefits**: [Compliance cost avoidance]
- **Insurance Impact**: [Cyber insurance premium reduction]

## Conclusion and Next Steps

### Summary of Findings
- **Critical Issues**: [Number and summary]
- **Overall Risk Level**: [Assessment]
- **Compliance Status**: [Summary]

### Immediate Actions Required
1. [Action 1] - [Timeline]
2. [Action 2] - [Timeline]
3. [Action 3] - [Timeline]

### Follow-up Schedule
- **30-Day Review**: [Check on progress]
- **90-Day Assessment**: [Security posture review]
- **Annual Audit**: [Comprehensive security review]
```

Focus on providing actionable security recommendations with clear priorities and implementation guidance.