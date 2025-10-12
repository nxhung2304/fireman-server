---
description: Generate boilerplate code for new features
argument-hint: [feature_type] [name]
---

Generate boilerplate code for: $1 $2

## Instructions
Based on the feature type and name, create comprehensive boilerplate code including:

1. **File Structure**: Create appropriate directory structure
2. **Main Class/Module**: Primary implementation with proper patterns
3. **Test Files**: Unit and integration test templates
4. **Documentation**: README and API documentation
5. **Configuration**: Configuration files and settings
6. **Integration**: Examples of how to integrate with existing code

## Feature Types Supported
- **service**: Service layer components
- **model**: Data models and entities
- **controller**: API controllers and handlers
- **middleware**: Request/response middleware
- **utility**: Helper utilities and tools
- **component**: UI components (React/Vue)
- **job**: Background job processors
- **migration**: Database migrations

## Output Format
```
## Generated Boilerplate for [Type]: [Name]

### File Structure
```
[path/to/created/files]
```

### Main Implementation
```[language]
[Main class/module code]
```

### Test Template
```[language]
[Test code template]
```

### Configuration
```[config_format]
[Configuration setup]
```

### Integration Example
```[language]
[Example usage]
```

### Next Steps
1. [ ] Review and customize the generated code
2. [ ] Implement business logic in [main file]
3. [ ] Add comprehensive tests
4. [ ] Update documentation
5. [ ] Integrate with existing codebase
```

Generate code that follows the project's existing patterns, conventions, and best practices.