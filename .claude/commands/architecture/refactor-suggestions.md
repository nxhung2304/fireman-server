---
description: Analyze code and suggest refactoring improvements
argument-hint: [file_path]
---

Analyze the provided file for refactoring opportunities: $ARGUMENTS

## Instructions
Perform a comprehensive code review focusing on:

1. **SOLID Principles**:
   - Single Responsibility: Does each class/method have one clear purpose?
   - Open/Closed: Is the code open for extension but closed for modification?
   - Liskov Substitution: Are inheritance relationships correct?
   - Interface Segregation: Are interfaces focused and cohesive?
   - Dependency Inversion: Does code depend on abstractions, not concretions?

2. **Code Smells**:
   - Long methods, classes, and parameter lists
   - Duplicate code and logic
   - Complex conditional statements
   - Magic numbers and strings
   - Inappropriate intimacy between classes

3. **Design Patterns**:
   - Opportunities to apply appropriate design patterns
   - Current patterns that could be improved
   - Anti-patterns that should be removed

4. **Performance**:
   - Inefficient algorithms or data structures
   - Memory leaks or excessive object creation
   - Database query optimization opportunities

5. **Maintainability**:
   - Code clarity and readability
   - Proper error handling
   - Adequate documentation
   - Test coverage gaps

## Output Format
```
## Refactoring Analysis: [File Name]

### High Priority Issues
1. **[Issue Title]** - [Impact: High/Medium/Low]
   - Current code: [Code snippet]
   - Suggested improvement: [Refactored code]
   - Benefits: [Why this improves the code]

### Medium Priority Issues
...

### Low Priority Issues
...

### Suggested Refactoring Steps
1. [Step 1]
2. [Step 2]
...

### Design Pattern Recommendations
- [Pattern name]: [When to use it]
```

Provide specific, actionable suggestions with code examples.