---
description: Analyze and prioritize technical debt in code scope
argument-hint: [scope]
---

Analyze and prioritize technical debt for: $ARGUMENTS

## Instructions
Conduct a comprehensive technical debt analysis covering:

1. **Debt Identification**:
   - Code smells and anti-patterns
   - Architectural violations
   - Performance bottlenecks
   - Security vulnerabilities
   - Test coverage gaps

2. **Debt Classification**:
   - Categorize by type and severity
   - Assess business impact
   - Estimate remediation effort
   - Determine urgency and priority

3. **Cost-Benefit Analysis**:
   - Calculate cost of inaction
   - Estimate remediation ROI
   - Consider opportunity costs
   - Factor in risk mitigation

4. **Prioritization Framework**:
   - Create prioritized backlog
   - Develop roadmap for debt reduction
   - Allocate resources effectively
   - Track progress over time

## Output Format
```
# Technical Debt Analysis: [Scope]

## Executive Summary
**Analysis Date**: [Date]
**Scope**: [Description of analyzed scope]
**Total Debt Items**: [X] items identified
**Debt Categories**: [List of categories found]
**Estimated Remediation Cost**: [X] developer-weeks
**Business Risk Level**: [Critical/High/Medium/Low]
**Immediate Action Required**: [Yes/No]

## Debt Overview

### Debt by Category
| Category | Count | Severity | Effort (days) | Risk | Priority |
|----------|-------|----------|---------------|------|----------|
| Code Quality | [X] | [Avg] | [Total] | [Level] | [High/Med/Low] |
| Architecture | [X] | [Avg] | [Total] | [Level] | [High/Med/Low] |
| Performance | [X] | [Avg] | [Total] | [Level] | [High/Med/Low] |
| Security | [X] | [Avg] | [Total] | [Level] | [High/Med/Low] |
| Testing | [X] | [Avg] | [Total] | [Level] | [High/Med/Low] |
| Documentation | [X] | [Avg] | [Total] | [Level] | [High/Med/Low] |

### Debt by Severity
| Severity | Count | Percentage | Effort (days) | Business Impact |
|----------|-------|------------|---------------|----------------|
| Critical | [X] | [XX]% | [Total] | High |
| High | [X] | [XX]% | [Total] | Medium |
| Medium | [X] | [XX]% | [Total] | Low |
| Low | [X] | [XX]% | [Total] | Minimal |

## Detailed Debt Analysis

### Critical Debt Items (Immediate Action Required)

#### 1. [Debt Item Title]
- **Type**: [Code Quality/Architecture/Performance/Security/Testing]
- **Location**: [File:Line] or [Module/Component]
- **Description**: [Detailed description of the debt]
- **Current Impact**: [How this affects the system]
- **Future Risk**: [Potential consequences if not addressed]
- **Business Impact**: [Effect on business operations]
- **Estimated Effort**: [X] days
- **Required Skills**: [Skills needed to fix]
- **Dependencies**: [What needs to be done first]
- **Remediation Strategy**:
  1. [Step 1]: [Description]
  2. [Step 2]: [Description]
  3. [Step 3]: [Description]

#### 2. [Debt Item Title]
[Same structure as above]

### High Priority Debt Items

#### 1. [Debt Item Title]
- **Type**: [Category]
- **Location**: [File:Line] or [Module/Component]
- **Description**: [Detailed description]
- **Current Impact**: [Current effects]
- **Future Risk**: [Potential consequences]
- **Business Impact**: [Business effect]
- **Estimated Effort**: [X] days
- **Remediation Strategy**: [High-level approach]

#### 2. [Debt Item Title]
[Same structure as above]

### Medium Priority Debt Items

#### 1. [Debt Item Title]
- **Type**: [Category]
- **Location**: [File:Line] or [Module/Component]
- **Description**: [Detailed description]
- **Estimated Effort**: [X] days
- **Suggested Timeline**: [When to address]

### Low Priority Debt Items

#### 1. [Debt Item Title]
- **Type**: [Category]
- **Location**: [File:Line] or [Module/Component]
- **Description**: [Brief description]
- **Estimated Effort**: [X] days
- **Suggested Timeline**: [When to address]

## Category-Specific Analysis

### Code Quality Debt

#### Code Smells Identified
- **Long Methods**: [X] methods exceeding [X] lines
- **Large Classes**: [X] classes with too many responsibilities
- **Duplicated Code**: [X] instances of code duplication
- **Complex Conditionals**: [X] complex nested conditions
- **Magic Numbers/Strings**: [X] instances

#### SOLID Violations
- **Single Responsibility**: [X] violations
- **Open/Closed**: [X] violations
- **Liskov Substitution**: [X] violations
- **Interface Segregation**: [X] violations
- **Dependency Inversion**: [X] violations

#### Specific Issues
1. **[Issue Title]**: [File:Line]
   - **Problem**: [Description]
   - **Impact**: [Effect on maintainability]
   - **Effort**: [X] days

### Architecture Debt

#### Architectural Issues
- **Tight Coupling**: [X] instances of tight coupling
- **Circular Dependencies**: [X] circular dependency chains
- **Violation of Layered Architecture**: [X] violations
- **Missing Abstractions**: [X] missing abstraction opportunities
- **Inconsistent Patterns**: [X] inconsistent implementation patterns

#### Specific Architectural Problems
1. **[Issue Title]**: [Component/Module]
   - **Problem**: [Description]
   - **Current State**: [How it's currently implemented]
   - **Target State**: [How it should be implemented]
   - **Migration Strategy**: [How to transition]

### Performance Debt

#### Performance Issues
- **Database Queries**: [X] slow queries identified
- **Memory Leaks**: [X] potential memory leaks
- **Inefficient Algorithms**: [X] inefficient implementations
- **Missing Caching**: [X] opportunities for caching
- **N+1 Query Problems**: [X] N+1 query issues

#### Performance Metrics
- **Response Time Issues**: [X] endpoints with slow response times
- **Throughput Bottlenecks**: [X] identified bottlenecks
- **Resource Utilization**: [X] resource usage inefficiencies

### Security Debt

#### Security Vulnerabilities
- **Injection Vulnerabilities**: [X] SQL injection, XSS, etc.
- **Authentication Issues**: [X] authentication weaknesses
- **Authorization Gaps**: [X] missing authorization checks
- **Data Exposure**: [X] sensitive data exposure risks
- **Outdated Dependencies**: [X] vulnerable dependencies

#### Compliance Issues
- **GDPR Compliance**: [X] compliance gaps
- **Industry Standards**: [X] standard violations
- **Security Best Practices**: [X] best practice violations

### Testing Debt

#### Test Coverage Analysis
| Module | Coverage | Target | Gap |
|--------|----------|---------|-----|
| [module1] | [X]% | [Y]% | [Z]% |
| [module2] | [X]% | [Y]% | [Z]% |

#### Testing Issues
- **Missing Unit Tests**: [X] untested methods/classes
- **Integration Test Gaps**: [X] missing integration scenarios
- **Test Quality Issues**: [X] flaky or unreliable tests
- **Test Maintenance**: [X] tests needing updates
- **Test Performance**: [X] slow test suites

### Documentation Debt

#### Documentation Issues
- **Missing API Documentation**: [X] undocumented APIs
- **Outdated Documentation**: [X] outdated docs
- **Missing Code Comments**: [X] uncommented complex code
- **README Gaps**: [X] missing setup/usage information
- **Architecture Documentation**: [X] missing architectural docs

## Cost-Benefit Analysis

### Cost of Inaction
| Debt Category | Immediate Cost | 6-Month Cost | 1-Year Cost | Risk Multiplier |
|---------------|----------------|--------------|-------------|-----------------|
| Code Quality | $[X] | $[Y] | $[Z] | [X]x |
| Architecture | $[X] | $[Y] | $[Z] | [X]x |
| Performance | $[X] | $[Y] | $[Z] | [X]x |
| Security | $[X] | $[Y] | $[Z] | [X]x |
| Testing | $[X] | $[Y] | $[Z] | [X]x |
| **Total** | **$[Total]** | **$[Total]** | **$[Total]** | **[X]x** |

### Remediation ROI Analysis
| Debt Item | Remediation Cost | Annual Savings | ROI Period | Net Benefit (3 years) |
|-----------|------------------|----------------|------------|-----------------------|
| [Item 1] | $[X] | $[Y] | [Z] months | $[Amount] |
| [Item 2] | $[X] | $[Y] | [Z] months | $[Amount] |

### Business Impact Assessment
- **Developer Productivity**: [X]% improvement potential
- **Feature Velocity**: [X]% increase potential
- **Bug Reduction**: [X]% reduction potential
- **System Reliability**: [X]% improvement potential
- **Customer Satisfaction**: [X]% improvement potential

## Prioritization Framework

### Priority Matrix
```
Impact ↓      | Low    | Medium | High
--------------|--------|---------|-------
High          | Low    | Medium  | Critical
Medium        | Low    | Medium  | High
Low           | Very   | Low     | Medium
               | Low    |         |
Effort →      | Low    | Medium  | High
```

### Prioritized Backlog

#### Sprint 1 (Immediate)
1. **[Critical Item 1]** - [X] days
   - **Priority**: Critical
   - **Dependencies**: None
   - **Owner**: [Team/Person]

2. **[Critical Item 2]** - [X] days
   - **Priority**: Critical
   - **Dependencies**: [Dependencies]
   - **Owner**: [Team/Person]

#### Sprint 2-3 (Short-term)
1. **[High Item 1]** - [X] days
   - **Priority**: High
   - **Dependencies**: [Dependencies]
   - **Owner**: [Team/Person]

2. **[High Item 2]** - [X] days
   - **Priority**: High
   - **Dependencies**: [Dependencies]
   - **Owner**: [Team/Person]

#### Quarter 1 (Medium-term)
1. **[Medium Item 1]** - [X] days
   - **Priority**: Medium
   - **Dependencies**: [Dependencies]
   - **Owner**: [Team/Person]

#### Quarter 2-3 (Long-term)
1. **[Low Item 1]** - [X] days
   - **Priority**: Low
   - **Dependencies**: [Dependencies]
   - **Owner**: [Team/Person]

## Implementation Strategy

### Resource Allocation
- **Development Team**: [X] FTE allocated
- **QA Team**: [X] FTE allocated
- **DevOps Team**: [X] FTE allocated
- **Timeline**: [X] months for full debt reduction

### Milestones and Metrics
- **Month 1**: [X]% reduction in critical debt
- **Month 3**: [X]% reduction in high-priority debt
- **Month 6**: [X]% reduction in medium-priority debt
- **Month 12**: [X]% reduction in overall debt

### Success Metrics
- **Debt Reduction**: Target [X]% reduction per quarter
- **Code Quality**: Target [X]% improvement in quality metrics
- **Developer Productivity**: Target [X]% improvement
- **Bug Reduction**: Target [X]% reduction in bug count
- **Feature Velocity**: Target [X]% increase in delivery speed

## Risk Management

### Debt-Related Risks
| Risk | Probability | Impact | Mitigation Strategy | Owner |
|------|-------------|---------|-------------------|-------|
| System Failure | [High/Med/Low] | [High/Med/Low] | [Strategy] | [Owner] |
| Security Breach | [High/Med/Low] | [High/Med/Low] | [Strategy] | [Owner] |
| Performance Degradation | [High/Med/Low] | [High/Med/Low] | [Strategy] | [Owner] |
| Developer Turnover | [High/Med/Low] | [High/Med/Low] | [Strategy] | [Owner] |

### Mitigation Strategies
- **Short-term Mitigation**: [Immediate actions]
- **Long-term Mitigation**: [Strategic approaches]
- **Monitoring**: [How to track debt-related risks]

## Recommendations

### Immediate Actions (This Month)
1. **[Action 1]**: [Description and justification]
2. **[Action 2]**: [Description and justification]
3. **[Action 3]**: [Description and justification]

### Short-term Goals (3 Months)
1. **[Goal 1]**: [Description and success criteria]
2. **[Goal 2]**: [Description and success criteria]

### Long-term Strategy (12 Months)
1. **[Strategic Initiative 1]**: [Description]
2. **[Strategic Initiative 2]**: [Description]

### Process Improvements
- **Code Review Process**: [Improvements to prevent debt accumulation]
- **Architecture Governance**: [Architectural review process]
- **Quality Gates**: [Automated quality checks]
- **Training and Education**: [Team skill development]

## Monitoring and Tracking

### Debt Metrics Dashboard
- **Debt Index**: Overall debt score
- **Debt Trend**: Debt accumulation/reduction over time
- **Category Breakdown**: Debt by category
- **Remediation Progress**: Track against plan

### Regular Review Schedule
- **Weekly**: Debt item status review
- **Monthly**: Debt reduction progress review
- **Quarterly**: Strategy and priority review
- **Annually**: Comprehensive debt assessment

## Conclusion

### Summary of Findings
- **Total Debt Items**: [X] items identified
- **Critical Items**: [X] requiring immediate attention
- **Estimated Remediation Cost**: [X] developer-weeks
- **Business Risk Level**: [Critical/High/Medium/Low]
- **ROI Potential**: [X]% return on remediation investment

### Next Steps
1. **Immediate**: Address [X] critical items within [timeframe]
2. **Short-term**: Implement [X] high-priority improvements
3. **Long-term**: Establish [X] processes to prevent debt accumulation
4. **Monitoring**: Set up [X] tracking and reporting mechanisms

### Stakeholder Communication
- **Development Team**: [Communication plan and frequency]
- **Management**: [Reporting schedule and format]
- **Product Team**: [Impact on feature delivery]
- **Customers**: [Communication plan for user-facing issues]
```

Focus on providing actionable insights with clear priorities and measurable outcomes for debt reduction.