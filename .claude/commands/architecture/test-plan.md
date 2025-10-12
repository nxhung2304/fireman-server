---
description: Generate comprehensive testing strategy for a feature
argument-hint: [feature_name]
---

Create a comprehensive testing strategy for: $ARGUMENTS

## Instructions
Develop a thorough testing plan covering all testing levels:

1. **Unit Testing**:
   - Identify all units (functions, methods, classes)
   - Define test cases for happy paths
   - Cover edge cases and error conditions
   - Specify mocking requirements
   - Set coverage targets

2. **Integration Testing**:
   - Identify component interactions
   - Test data flow between components
   - Verify external API integrations
   - Test database interactions
   - Include contract testing

3. **End-to-End Testing**:
   - Define user journey scenarios
   - Test complete workflows
   - Include cross-browser/device testing
   - Verify performance under load
   - Test error recovery paths

4. **Performance Testing**:
   - Identify performance bottlenecks
   - Define load testing scenarios
   - Set response time expectations
   - Plan stress testing
   - Include scalability testing

5. **Security Testing**:
   - Identify security vulnerabilities
   - Test authentication/authorization
   - Include input validation testing
   - Test for common attacks (XSS, SQL injection, etc.)
   - Review data encryption and privacy

## Output Format
```
## Test Plan: [Feature Name]

### Test Scope
- **In Scope**: [List of components and features]
- **Out of Scope**: [Items not covered in this test plan]

### Unit Testing Strategy
#### Test Classes/Modules
- **[Class/Module Name]**: [Test description]
  - Test cases: [Number of tests]
  - Coverage target: [X%]
  - Mock requirements: [Dependencies to mock]

#### Test Data Strategy
- Test data generation approach
- Fixtures and factories needed
- Edge cases to cover

### Integration Testing
#### Component Interactions
- **[Component A] ↔ [Component B]**: [Test scenarios]
- **External API Integration**: [Test approach]

### End-to-End Testing
#### User Scenarios
1. **[Scenario Name]**: [Step-by-step test]
   - Preconditions: [Required state]
   - Expected results: [Expected outcomes]

### Performance Testing
#### Metrics and Targets
- Response time: < [X]ms
- Throughput: [X] requests/second
- Concurrent users: [X]
- Memory usage: < [X]MB

### Test Environment Setup
- **Unit Tests**: [Environment requirements]
- **Integration Tests**: [Setup requirements]
- **E2E Tests**: [Environment needs]

### Test Execution Plan
- **Unit Tests**: [When to run]
- **Integration Tests**: [When to run]
- **E2E Tests**: [When to run]
- **Performance Tests**: [Schedule]

### Success Criteria
- All tests pass with [X]% coverage
- Performance targets met
- Security vulnerabilities resolved
- User acceptance criteria satisfied
```

Include specific test examples and setup instructions.