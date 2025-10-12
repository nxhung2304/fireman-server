---
description: Generate REST API design for resources
argument-hint: [resource_name]
---

Generate comprehensive REST API design for: $ARGUMENTS

## Instructions
Design a complete REST API including endpoints, request/response schemas, authentication, error handling, and documentation:

1. **Resource Analysis**:
   - Identify resource attributes and relationships
   - Define resource lifecycle and operations
   - Determine access patterns and use cases
   - Consider performance and scalability requirements

2. **API Design**:
   - Endpoint design following REST principles
   - HTTP method usage and status codes
   - Request and response schema definitions
   - Error handling and validation

3. **Security and Authentication**:
   - Authentication method selection
   - Authorization and permissions
   - Rate limiting and throttling
   - Data validation and sanitization

4. **Documentation and Testing**:
   - OpenAPI/Swagger specification
   - Example requests and responses
   - Testing strategies
   - Integration guidelines

## Output Format
```
# REST API Design: [Resource Name]

## Resource Overview
**Resource Name**: [Plural resource name]
**Description**: [Resource purpose and scope]
**Business Context**: [How this resource fits into business logic]

### Resource Attributes
| Attribute | Type | Required | Description | Validation |
|-----------|------|----------|-------------|------------|
| id | UUID | Yes | Unique identifier | Auto-generated |
| [attribute1] | [Type] | [Yes/No] | [Description] | [Validation rules] |
| [attribute2] | [Type] | [Yes/No] | [Description] | [Validation rules] |

### Resource Relationships
- **Parent**: [Parent resource, if applicable]
- **Children**: [Child resources, if applicable]
- **Related**: [Related resources and their relationships]

## API Endpoints

### Collection Operations

#### GET /api/v1/[resources]
**Description**: Retrieve a paginated list of [resources]

**Request Parameters**:
| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| page | integer | No | 1 | Page number for pagination |
| limit | integer | No | 20 | Number of items per page (max 100) |
| sort | string | No | created_at | Sort field |
| order | string | No | desc | Sort order (asc/desc) |
| [filter1] | [type] | No | - | [Filter description] |
| [filter2] | [type] | No | - | [Filter description] |

**Response**: 
```json
{
  "data": [
    {
      "id": "uuid",
      "[attribute1]": "value",
      "[attribute2]": "value",
      "created_at": "2024-01-01T00:00:00Z",
      "updated_at": "2024-01-01T00:00:00Z"
    }
  ],
  "pagination": {
    "page": 1,
    "limit": 20,
    "total": 100,
    "pages": 5
  }
}
```

#### POST /api/v1/[resources]
**Description**: Create a new [resource]

**Request Body**:
```json
{
  "[attribute1]": "value",
  "[attribute2]": "value"
}
```

**Response** (201 Created):
```json
{
  "data": {
    "id": "uuid",
    "[attribute1]": "value",
    "[attribute2]": "value",
    "created_at": "2024-01-01T00:00:00Z",
    "updated_at": "2024-01-01T00:00:00Z"
  }
}
```

### Individual Resource Operations

#### GET /api/v1/[resources]/{id}
**Description**: Retrieve a specific [resource] by ID

**Path Parameters**:
- `id` (UUID, required): Resource identifier

**Response** (200 OK):
```json
{
  "data": {
    "id": "uuid",
    "[attribute1]": "value",
    "[attribute2]": "value",
    "created_at": "2024-01-01T00:00:00Z",
    "updated_at": "2024-01-01T00:00:00Z"
  }
}
```

#### PUT /api/v1/[resources]/{id}
**Description**: Update a specific [resource]

**Request Body**:
```json
{
  "[attribute1]": "new_value",
  "[attribute2]": "new_value"
}
```

**Response** (200 OK):
```json
{
  "data": {
    "id": "uuid",
    "[attribute1]": "new_value",
    "[attribute2]": "new_value",
    "created_at": "2024-01-01T00:00:00Z",
    "updated_at": "2024-01-01T01:00:00Z"
  }
}
```

#### DELETE /api/v1/[resources]/{id}
**Description**: Delete a specific [resource]

**Response** (204 No Content)

### Additional Endpoints
[Add any custom endpoints for specific business logic]

## HTTP Status Codes

### Success Codes
- `200 OK`: Request successful, resource returned
- `201 Created`: Resource successfully created
- `204 No Content`: Request successful, no content returned

### Client Error Codes
- `400 Bad Request`: Invalid request body or parameters
- `401 Unauthorized`: Authentication required or failed
- `403 Forbidden`: Insufficient permissions
- `404 Not Found`: Resource not found
- `409 Conflict`: Resource conflict (duplicate, etc.)
- `422 Unprocessable Entity`: Validation errors

### Server Error Codes
- `500 Internal Server Error`: Unexpected server error
- `503 Service Unavailable`: Service temporarily unavailable

## Error Response Format

### Validation Errors (422)
```json
{
  "error": {
    "code": "validation_error",
    "message": "Validation failed",
    "details": {
      "[field1]": ["Error message 1", "Error message 2"],
      "[field2]": ["Error message 1"]
    }
  }
}
```

### General Errors
```json
{
  "error": {
    "code": "error_code",
    "message": "Human readable error message",
    "details": {
      "additional_info": "Additional context"
    }
  }
}
```

## Authentication and Authorization

### Authentication Method
- **Type**: [JWT/OAuth2/API Key/etc.]
- **Header**: `Authorization: Bearer <token>`
- **Token Endpoint**: `/oauth/token`
- **Token Expiration**: [Time period]

### Authorization
- **Permissions Required**:
  - `GET /api/v1/[resources]`: [permission_name]:read
  - `POST /api/v1/[resources]`: [permission_name]:create
  - `PUT /api/v1/[resources]/{id}`: [permission_name]:update
  - `DELETE /api/v1/[resources]/{id}`: [permission_name]:delete

### Rate Limiting
- **Limits**: [Number] requests per [time period]
- **Headers**: `X-RateLimit-Limit`, `X-RateLimit-Remaining`, `X-RateLimit-Reset`
- **Throttling Response**: 429 Too Many Requests

## Data Validation

### Input Validation Rules
- **[attribute1]**: [Validation rules]
- **[attribute2]**: [Validation rules]
- **Custom Validators**: [Any custom validation logic]

### Sanitization
- **HTML Stripping**: For text fields
- **SQL Injection Prevention**: Parameterized queries
- **XSS Prevention**: Input sanitization

## OpenAPI/Swagger Specification

```yaml
openapi: 3.0.0
info:
  title: [Resource Name] API
  version: 1.0.0
  description: API for managing [resources]

paths:
  /api/v1/[resources]:
    get:
      summary: List [resources]
      parameters:
        - name: page
          in: query
          schema:
            type: integer
            default: 1
        - name: limit
          in: query
          schema:
            type: integer
            default: 20
      responses:
        '200':
          description: Successful response
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    type: array
                    items:
                      $ref: '#/components/schemas/[ResourceName]'
                  pagination:
                    $ref: '#/components/schemas/Pagination'
    
    post:
      summary: Create [resource]
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/[ResourceName]Create'
      responses:
        '201':
          description: Resource created
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    $ref: '#/components/schemas/[ResourceName]'

  /api/v1/[resources]/{id}:
    get:
      summary: Get [resource] by ID
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: string
            format: uuid
      responses:
        '200':
          description: Successful response
          content:
            application/json:
              schema:
                type: object
                properties:
                  data:
                    $ref: '#/components/schemas/[ResourceName]'

components:
  schemas:
    [ResourceName]:
      type: object
      properties:
        id:
          type: string
          format: uuid
        [attribute1]:
          type: [type]
        created_at:
          type: string
          format: date-time
        updated_at:
          type: string
          format: date-time
    
    [ResourceName]Create:
      type: object
      required:
        - [required_field1]
        - [required_field2]
      properties:
        [attribute1]:
          type: [type]
        [attribute2]:
          type: [type]
    
    Pagination:
      type: object
      properties:
        page:
          type: integer
        limit:
          type: integer
        total:
          type: integer
        pages:
          type: integer
```

## Testing Strategy

### Unit Tests
- **Model Validation**: Test resource validation rules
- **Business Logic**: Test business logic methods
- **Utilities**: Test helper functions

### Integration Tests
- **API Endpoints**: Test all endpoints with various inputs
- **Authentication**: Test auth flows and permissions
- **Database**: Test database operations

### Performance Tests
- **Load Testing**: Test under expected load
- **Stress Testing**: Test beyond expected limits
- **Endurance Testing**: Test over extended periods

## Implementation Guidelines

### Code Structure
```
app/
├── controllers/
│   └── api/v1/[resource_name]_controller.rb
├── models/
│   └── [resource_name].rb
├── services/
│   └── [resource_name]_service.rb
├── validators/
│   └── [resource_name]_validator.rb
└── policies/
    └── [resource_name]_policy.rb
```

### Best Practices
- Use consistent naming conventions
- Implement proper error handling
- Add comprehensive logging
- Include request tracing
- Use database transactions
- Implement proper caching

### Monitoring and Logging
- **Request Logging**: Log all API requests
- **Performance Metrics**: Track response times
- **Error Tracking**: Monitor errors and exceptions
- **Usage Analytics**: Track API usage patterns

## Security Considerations

### Input Validation
- Validate all input parameters
- Sanitize user input
- Prevent injection attacks
- Validate file uploads

### Output Security
- Sanitize output data
- Prevent information leakage
- Use secure headers
- Implement CSP headers

### Rate Limiting and Abuse Prevention
- Implement rate limiting
- Add request throttling
- Monitor for abuse patterns
- Implement IP blocking if needed
```

Focus on creating a production-ready API design that follows REST best practices and industry standards.