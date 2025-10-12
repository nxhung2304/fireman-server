---
description: Generate database schema design for entities
argument-hint: [entity_name]
---

Generate comprehensive database schema design for: $ARGUMENTS

## Instructions
Design a complete database schema including tables, relationships, indexes, constraints, and optimization strategies:

1. **Entity Analysis**:
   - Identify entity attributes and data types
   - Define relationships with other entities
   - Determine constraints and validation rules
   - Consider performance and scalability

2. **Schema Design**:
   - Table structure and column definitions
   - Primary and foreign key relationships
   - Indexes and constraints
   - Normalization and denormalization decisions

3. **Performance Optimization**:
   - Index strategy for query performance
   - Partitioning and sharding considerations
   - Caching strategies
   - Query optimization

4. **Data Integrity**:
   - Constraints and validation rules
   - Triggers and stored procedures
   - Data migration strategies
   - Backup and recovery procedures

## Output Format
```
# Database Schema Design: [Entity Name]

## Entity Overview
**Entity Name**: [Table name]
**Description**: [Entity purpose and scope]
**Business Context**: [How this entity fits into business logic]

### Attributes
| Attribute | Type | Null | Default | Description | Constraints |
|-----------|------|------|---------|-------------|-------------|
| id | BIGINT | No | Auto-increment | Primary key | PRIMARY KEY |
| [attribute1] | [Type] | [Yes/No] | [Default] | [Description] | [Constraints] |
| [attribute2] | [Type] | [Yes/No] | [Default] | [Description] | [Constraints] |
| created_at | TIMESTAMP | No | CURRENT_TIMESTAMP | Creation timestamp | |
| updated_at | TIMESTAMP | No | CURRENT_TIMESTAMP | Last update timestamp | ON UPDATE |

## Table Structure

### Main Table: [table_name]
```sql
CREATE TABLE [table_name] (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    [column1_name] [DATA_TYPE] [CONSTRAINTS],
    [column2_name] [DATA_TYPE] [CONSTRAINTS],
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    -- Indexes
    INDEX idx_[column1_name] ([column1_name]),
    INDEX idx_[column2_name] ([column2_name]),
    INDEX idx_created_at (created_at),
    
    -- Constraints
    CONSTRAINT chk_[constraint_name] CHECK ([condition]),
    CONSTRAINT uq_[unique_name] UNIQUE ([unique_columns])
);
```

### Related Tables

#### [related_table_1]
```sql
CREATE TABLE [related_table_1] (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    [table_name]_id BIGINT NOT NULL,
    [other_columns...],
    
    FOREIGN KEY ([table_name]_id) REFERENCES [table_name](id) 
        ON DELETE CASCADE ON UPDATE CASCADE,
        
    INDEX idx_[table_name]_id ([table_name]_id)
);
```

#### [related_table_2]
```sql
CREATE TABLE [related_table_2] (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    [table_name]_id BIGINT NOT NULL,
    [other_columns...],
    
    FOREIGN KEY ([table_name]_id) REFERENCES [table_name](id) 
        ON DELETE RESTRICT ON UPDATE CASCADE,
        
    INDEX idx_[table_name]_id ([table_name]_id)
);
```

## Relationships

### One-to-Many Relationships
- **[table_name]** → **[child_table]**: One [entity] has many [child entities]
- **Foreign Key**: `[child_table].[table_name]_id`
- **Cardinality**: 1:N
- **Delete Rule**: [CASCADE/RESTRICT/SET NULL]

### Many-to-Many Relationships
#### [junction_table]
```sql
CREATE TABLE [junction_table] (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    [table1]_id BIGINT NOT NULL,
    [table2]_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY ([table1]_id) REFERENCES [table1](id) ON DELETE CASCADE,
    FOREIGN KEY ([table2]_id) REFERENCES [table2](id) ON DELETE CASCADE,
    
    UNIQUE KEY uq_[table1]_[table2] ([table1]_id, [table2]_id),
    INDEX idx_[table1]_id ([table1]_id),
    INDEX idx_[table2]_id ([table2]_id)
);
```

## Index Strategy

### Primary Indexes
- **Primary Key**: `id` (AUTO_INCREMENT)
- **Unique Indexes**: [List of unique constraints]

### Secondary Indexes
#### Performance Critical Indexes
```sql
-- For frequent WHERE clauses
CREATE INDEX idx_[column_name] ON [table_name] ([column_name]);

-- For ORDER BY queries
CREATE INDEX idx_[column1]_[column2] ON [table_name] ([column1], [column2]);

-- For JOIN operations
CREATE INDEX idx_foreign_key ON [table_name] ([foreign_key_column]);

-- Composite indexes for complex queries
CREATE INDEX idx_complex_query ON [table_name] ([column1], [column2], [column3]);
```

#### Specialized Indexes
- **Full-text Index**: For text search capabilities
- **Spatial Index**: For geographical data
- **Partial Index**: For filtered subsets of data

### Index Maintenance
- **Rebuild Strategy**: [Schedule for index rebuilding]
- **Monitoring**: [Index usage and performance monitoring]
- **Optimization**: [Index optimization procedures]

## Constraints and Validation

### Data Integrity Constraints
```sql
-- Check constraints
ALTER TABLE [table_name] 
ADD CONSTRAINT chk_[column_name] CHECK ([condition]);

-- Unique constraints
ALTER TABLE [table_name] 
ADD CONSTRAINT uq_[column_name] UNIQUE ([column_name]);

-- Foreign key constraints
ALTER TABLE [table_name] 
ADD CONSTRAINT fk_[foreign_table] 
FOREIGN KEY ([column_name]) REFERENCES [foreign_table](id)
    ON DELETE [ACTION] ON UPDATE [ACTION];
```

### Business Logic Constraints
- **[Constraint 1]**: [Business rule description]
- **[Constraint 2]**: [Business rule description]
- **[Constraint 3]**: [Business rule description]

## Data Types and Specifications

### Numeric Types
- **BIGINT**: Primary keys and large numeric values
- **INT**: Standard integer values
- **DECIMAL**: Financial calculations (precision: 10, scale: 2)
- **BOOLEAN**: True/false values

### String Types
- **VARCHAR(n)**: Variable-length strings with length limit
- **TEXT**: Long-form text content
- **CHAR(n)**: Fixed-length strings
- **ENUM**: Predefined value sets

### Date/Time Types
- **TIMESTAMP**: Date and time with timezone
- **DATE**: Date only
- **TIME**: Time only
- **DATETIME**: Date and time without timezone

### JSON and Binary Types
- **JSON**: Structured data storage
- **BLOB**: Binary data storage
- **UUID**: Unique identifiers

## Query Patterns and Optimization

### Common Queries
#### Primary Access Patterns
```sql
-- Find by ID (most common)
SELECT * FROM [table_name] WHERE id = ?;

-- Find by [indexed_column]
SELECT * FROM [table_name] WHERE [indexed_column] = ?;

-- List with pagination
SELECT * FROM [table_name] 
WHERE [condition] 
ORDER BY [sort_column] 
LIMIT ? OFFSET ?;

-- Search queries
SELECT * FROM [table_name] 
WHERE [search_column] LIKE ? 
ORDER BY [relevance_column];
```

#### JOIN Queries
```sql
-- [table_name] with related data
SELECT t.*, r.[related_field]
FROM [table_name] t
LEFT JOIN [related_table] r ON t.id = r.[table_name]_id
WHERE t.[condition];

-- Many-to-many relationships
SELECT t.*, jt.[junction_fields]
FROM [table_name] t
JOIN [junction_table] jt ON t.id = jt.[table_name]_id
WHERE jt.[related_table]_id = ?;
```

### Performance Optimization
#### Query Optimization
- **Query Analysis**: Use EXPLAIN to analyze query execution
- **Index Usage**: Ensure indexes are being used effectively
- **Query Caching**: Implement query result caching
- **Connection Pooling**: Optimize database connections

#### Database Configuration
```sql
-- MySQL optimization settings
SET innodb_buffer_pool_size = [appropriate_size];
SET query_cache_size = [appropriate_size];
SET max_connections = [appropriate_limit];

-- PostgreSQL optimization settings
SET shared_buffers = [appropriate_size];
SET effective_cache_size = [appropriate_size];
SET work_mem = [appropriate_size];
```

## Migration Strategy

### Version Control
- **Migration Files**: [Naming convention and structure]
- **Rollback Procedures**: [How to rollback changes]
- **Deployment Process**: [How to deploy schema changes]

### Data Migration
```sql
-- Example migration script
-- Migration: Add [new_feature] to [table_name]
-- Version: 001

BEGIN;

-- Add new column
ALTER TABLE [table_name] 
ADD COLUMN [new_column] [DATA_TYPE] [DEFAULT_VALUE];

-- Create index for new column
CREATE INDEX idx_[new_column] ON [table_name] ([new_column]);

-- Migrate existing data if needed
UPDATE [table_name] 
SET [new_column] = [migration_logic]
WHERE [condition];

COMMIT;
```

### Rollback Script
```sql
-- Rollback: Remove [new_feature] from [table_name]
BEGIN;

-- Drop index
DROP INDEX idx_[new_column] ON [table_name];

-- Drop column
ALTER TABLE [table_name] 
DROP COLUMN [new_column];

COMMIT;
```

## Backup and Recovery

### Backup Strategy
- **Full Backups**: [Schedule and retention]
- **Incremental Backups**: [Schedule and retention]
- **Point-in-Time Recovery**: [Configuration and procedures]

### Recovery Procedures
1. **Assess Impact**: Determine scope of data loss
2. **Select Backup**: Choose appropriate backup point
3. **Execute Recovery**: Restore database from backup
4. **Verify Integrity**: Validate data consistency
5. **Update Application**: Reconnect applications

## Security Considerations

### Data Encryption
- **At Rest**: [Encryption method and implementation]
- **In Transit**: [SSL/TLS configuration]
- **Key Management**: [Key storage and rotation]

### Access Control
- **Database Users**: [User roles and permissions]
- **Connection Security**: [IP whitelisting, VPN access]
- **Audit Logging**: [Query and access logging]

### Data Masking
- **Sensitive Fields**: [Fields to mask]
- **Masking Strategy**: [How to mask sensitive data]
- **Development Data**: [Anonymization for dev environments]

## Monitoring and Maintenance

### Performance Monitoring
- **Query Performance**: Monitor slow queries
- **Index Usage**: Track index effectiveness
- **Connection Metrics**: Monitor connection pool usage
- **Storage Usage**: Track disk space usage

### Regular Maintenance
```sql
-- MySQL maintenance
OPTIMIZE TABLE [table_name];
ANALYZE TABLE [table_name];
CHECK TABLE [table_name];

-- PostgreSQL maintenance
VACUUM ANALYZE [table_name];
REINDEX TABLE [table_name];
```

## Scalability Considerations

### Vertical Scaling
- **Hardware Upgrades**: CPU, Memory, Storage improvements
- **Configuration Tuning**: Database parameter optimization

### Horizontal Scaling
- **Read Replicas**: Distribute read operations
- **Sharding**: Partition data across multiple servers
- **Connection Routing**: Load balancing and failover

### Future Enhancements
- **Partitioning**: [Table partitioning strategy]
- **Archiving**: [Historical data archiving]
- **Caching Layer**: [Application-level caching]
```

Focus on creating a scalable, performant, and maintainable database schema that follows normalization principles while considering performance optimization.