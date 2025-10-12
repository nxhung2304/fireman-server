---
description: Review architectural patterns and suggest improvements
argument-hint: [component_name]
---

Conduct an architectural review of: $ARGUMENTS

## Instructions
Analyze the component's architecture and provide comprehensive recommendations:

1. **Current Architecture Assessment**:
   - Identify current patterns and approaches used
   - Evaluate separation of concerns
   - Assess coupling and cohesion levels
   - Review scalability and maintainability aspects

2. **Architecture Patterns**:
   - Evaluate if current patterns are appropriate
   - Suggest better patterns if needed
   - Consider microservices vs monolithic trade-offs
   - Review event-driven vs synchronous approaches

3. **Data Flow Analysis**:
   - Trace data flow through the component
   - Identify bottlenecks and single points of failure
   - Evaluate caching strategies
   - Review data consistency approaches

4. **Integration Points**:
   - Analyze external dependencies
   - Review API design and contracts
   - Evaluate error handling and resilience
   - Consider security implications

5. **Scalability & Performance**:
   - Identify current scalability limitations
   - Suggest performance optimizations
   - Review resource utilization
   - Consider horizontal vs vertical scaling

## Output Format
```
## Architecture Review: [Component Name]

### Current Architecture Overview
[Description of current architecture with diagrams if helpful]

### Strengths
- [Strength 1]: [Description]
- [Strength 2]: [Description]

### Areas for Improvement
1. **[Issue Area]** - [Severity: High/Medium/Low]
   - Current approach: [Description]
   - Recommended change: [Specific suggestion]
   - Expected benefits: [Benefits]

### Suggested Architecture Evolution
#### Phase 1: [Immediate improvements]
- [Improvement 1]
- [Improvement 2]

#### Phase 2: [Medium-term changes]
- [Improvement 1]
- [Improvement 2]

### Integration Recommendations
- [External system]: [Integration approach]
- [Data flow]: [Recommended pattern]

### Risks and Mitigations
- **Risk**: [Description]
  - **Mitigation**: [Strategy]
```

Focus on practical, implementable suggestions that improve the system's quality attributes.