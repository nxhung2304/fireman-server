---
description: Provide performance optimization suggestions
argument-hint: [component]
---

Analyze and provide performance optimization suggestions for: $ARGUMENTS

## Instructions
Perform a comprehensive performance analysis and provide actionable optimizations:

1. **Performance Assessment**:
   - Identify current performance bottlenecks
   - Analyze resource utilization patterns
   - Measure baseline performance metrics

2. **Optimization Opportunities**:
   - Code-level optimizations
   - Database query improvements
   - Caching strategies
   - Algorithm and data structure improvements

3. **Implementation Priority**:
   - High-impact, low-effort optimizations
   - Medium-impact improvements
   - Long-term architectural changes

4. **Measurement and Monitoring**:
   - How to measure optimization impact
   - Performance monitoring setup
   - Alert configuration for regressions

## Output Format
```
## Performance Optimization Analysis: [Component]

### Current Performance Assessment
#### Baseline Metrics
- **Response Time**: [Current measurement]
- **Throughput**: [Current measurement]
- **Memory Usage**: [Current measurement]
- **CPU Usage**: [Current measurement]
- **Database Query Time**: [Current measurement]

#### Identified Bottlenecks
1. **[Bottleneck 1]**: [Description and impact]
2. **[Bottleneck 2]**: [Description and impact]

### Optimization Recommendations

#### Quick Wins (High Impact, Low Effort)
1. **[Optimization 1]**: [Implementation details]
   - **Expected Improvement**: [Quantified benefit]
   - **Implementation Time**: [Time estimate]
   - **Code Changes**: [Specific changes needed]
   - **Example**:
     ```code
     [Before/After code example]
     ```

2. **[Optimization 2]**: [Implementation details]
   - **Expected Improvement**: [Benefit]
   - **Implementation Time**: [Time estimate]

#### Medium-term Improvements
1. **[Improvement 1]**: [Description]
   - **Expected Improvement**: [Benefit]
   - **Implementation Time**: [Time estimate]
   - **Complexity**: [Implementation complexity]

#### Long-term Architectural Changes
1. **[Change 1]**: [Description]
   - **Expected Improvement**: [Benefit]
   - **Implementation Time**: [Time estimate]
   - **Risks**: [Potential risks]

### Database Optimizations
#### Query Improvements
- **Slow Query 1**: [Optimization approach]
  ```sql
  -- Before
  [Current query]
  
  -- After
  [Optimized query]
  ```

#### Index Recommendations
- **Index 1**: [Table/columns, reason]
- **Index 2**: [Table/columns, reason]

### Caching Strategy
#### Recommended Caching
- **Cache Layer 1**: [What to cache, TTL]
- **Cache Layer 2**: [What to cache, TTL]

#### Implementation
```code
[Caching implementation example]
```

### Code-Level Optimizations
#### Algorithm Improvements
- **Current Algorithm**: [O(n) description]
- **Optimized Algorithm**: [O(log n) description]
- **Performance Gain**: [Expected improvement]

#### Memory Optimization
- **Memory Leak**: [Location and fix]
- **Object Pooling**: [Implementation suggestion]
- **Lazy Loading**: [Where to apply]

### Monitoring and Measurement
#### Performance Metrics to Track
- **Metric 1**: [How to measure]
- **Metric 2**: [How to measure]

#### Alert Configuration
- **Response Time Alert**: > [threshold]ms
- **Memory Usage Alert**: > [threshold]%
- **Error Rate Alert**: > [threshold]%

### Implementation Roadmap
#### Week 1-2
- [ ] Implement quick wins
- [ ] Set up performance monitoring
- [ ] Measure baseline improvements

#### Month 1
- [ ] Implement medium-term improvements
- [ ] Optimize database queries
- [ ] Add caching layer

#### Quarter 1
- [ ] Implement architectural changes
- [ ] Fine-tune based on metrics
- [ ] Document performance best practices

### Risks and Mitigations
- **Risk**: [Description]
  - **Mitigation**: [How to address]
```

Focus on providing specific, actionable optimizations with measurable benefits.