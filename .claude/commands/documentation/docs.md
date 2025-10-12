---
description: Generate technical documentation
argument-hint: [topic]
---

Generate comprehensive technical documentation for: $ARGUMENTS

## Instructions
Create clear, comprehensive documentation that includes:

1. **Overview**:
   - Purpose and scope of the documented item
   - Business value and use cases
   - Target audience and prerequisites

2. **Architecture/Structure**:
   - High-level architecture overview
   - Component relationships and data flow
   - Key design decisions and trade-offs

3. **API/Interface Documentation**:
   - Method/function signatures
   - Parameter descriptions and types
   - Return values and error handling
   - Usage examples with code samples

4. **Setup and Configuration**:
   - Installation/setup requirements
   - Configuration options and defaults
   - Environment variables and dependencies

5. **Usage Examples**:
   - Common use cases with step-by-step instructions
   - Code examples in relevant languages
   - Best practices and patterns

6. **Troubleshooting**:
   - Common issues and solutions
   - Debugging tips and techniques
   - Performance considerations

## Output Format
```
# [Documentation Title]

## Overview
[Clear description of what this documentation covers]

## Prerequisites
- [Requirement 1]
- [Requirement 2]

## Architecture
[High-level overview with diagrams if helpful]

## API Reference
### [Component/Method Name]
**Description**: [What it does]

**Parameters**:
- `param1` (Type): Description
- `param2` (Type): Description

**Returns**: Return type and description

**Example**:
```code
[Usage example]
```

## Usage Examples
### Basic Usage
[Step-by-step example]

### Advanced Usage
[Complex scenario with code]

## Configuration
| Setting | Default | Description |
|---------|---------|-------------|
| setting1 | value1 | Description |

## Troubleshooting
### Common Issues
**Problem**: [Issue description]
**Solution**: [How to fix it]

## Performance Considerations
[Performance tips and limitations]

## Related Documentation
- [Link to related docs]
- [Link to API reference]
```

Focus on creating documentation that is both comprehensive for beginners and detailed enough for experienced developers.