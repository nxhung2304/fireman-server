# Claude Commands for Fireman Server

This directory contains custom Claude Code slash commands to help streamline development workflows for the Fireman Server project. These commands are organized by category and provide comprehensive templates for common development tasks.

## How to Use

Commands are invoked using the `/` prefix in Claude Code. For example:

```
/plan-issue implement user authentication
```

Some commands accept arguments:
```
/analyze-code app/services/user_service.rb
```

Or positional arguments:
```
/api-design users
```

## Command Categories

### 📋 Planning & Management (`planning/`)
Strategic planning and project management commands.

#### `/plan-issue <feature_name>`
Generate comprehensive GitHub issues with implementation phases, technical requirements, and acceptance criteria.

**Example**: `/plan-issue implement user authentication system`

#### `/roadmap <category>`
Create phased implementation roadmaps with timelines and dependencies.

**Example**: `/roadmap mobile app development`

#### `/breakdown <task_description>`
Break down complex tasks into manageable subtasks with priorities and estimates.

**Example**: `/breakdown optimize database performance`

### 🏗️ Architecture & Code Quality (`architecture/`)
Code review, architecture analysis, and testing strategy commands.

#### `/refactor-suggestions <file_path>`
Analyze code for SOLID violations, code smells, and suggest specific improvements with examples.

**Example**: `/refactor-suggestions app/services/user_service.rb`

#### `/architecture-review <component>`
Review architectural patterns and suggest improvements with current state analysis.

**Example**: `/architecture-review payment processing system`

#### `/test-plan <feature_name>`
Generate comprehensive testing strategies with unit, integration, and E2E test plans.

**Example**: `/test-plan user authentication flow`

### 📚 Documentation & Communication (`documentation/`)
Documentation generation and communication improvement commands.

#### `/docs <topic>`
Generate comprehensive technical documentation with examples and best practices.

**Example**: `/docs API authentication flow`

#### `/update-readme <section>`
Update specific README sections with current project information.

**Example**: `/update-readme installation instructions`

#### `/changelog <version>`
Generate structured changelog entries with impact assessment and migration guides.

**Example**: `/changelog v2.1.0`

### 🔧 Development Workflow (`workflow/`)
Development workflow optimization and code generation commands.

#### `/scaffold <feature_type> <name>`
Generate boilerplate code for new features with proper structure and tests.

**Example**: `/scaffold service user_payment_processor`

#### `/debug <issue_description>`
Provide systematic debugging approaches with step-by-step troubleshooting guides.

**Example**: `/debug slow database queries`

#### `/optimize <component>`
Analyze performance bottlenecks and suggest specific optimizations.

**Example**: `/optimize API response times`

### 🚀 DevOps & Infrastructure (`devops/`)
Infrastructure, deployment, monitoring, and security commands.

#### `/deployment-checklist <environment>`
Generate comprehensive pre and post-deployment checklists.

**Example**: `/deployment-checklist production`

#### `/monitoring-setup <service>`
Create complete monitoring and alerting configurations.

**Example**: `/monitoring-setup user authentication service`

#### `/security-audit <component>`
Conduct thorough security reviews with vulnerability assessments.

**Example**: `/security-audit payment processing`

### ⚡ Feature Development (`features/`)
Feature-specific development commands for APIs, databases, and UI components.

#### `/api-design <resource_name>`
Design complete REST APIs with endpoints, schemas, and documentation.

**Example**: `/api-design user management`

#### `/database-schema <entity_name>`
Generate normalized database schemas with relationships and optimization.

**Example**: `/database-schema user_profiles`

#### `/ui-component <component_type> <component_name>`
Create React/Vue components with TypeScript, tests, and documentation.

**Example**: `/ui-component form UserProfileForm`

### 📊 Analysis & Reporting (`analysis/`)
Performance analysis, code review summaries, and technical debt assessment.

#### `/performance-report <time_period>`
Generate comprehensive performance analysis with actionable insights.

**Example**: `/performance-report last_30_days`

#### `/code-review-summary <pr_number>`
Summarize code review findings with prioritized action items.

**Example**: `/code-review-summary 123`

#### `/tech-debt-analysis <scope>`
Analyze and prioritize technical debt with ROI calculations.

**Example**: `/tech-debt-analysis authentication module`

## Features

### 🎯 Structured Output
All commands generate structured, professional output that can be directly used in:
- GitHub issues and pull requests
- Documentation files
- Team discussions
- Project planning sessions

### 🔧 Customizable Templates
Commands use templates that can be easily customized for your specific:
- Technology stack (Rails, React, etc.)
- Team workflows
- Documentation standards
- Code quality requirements

### 📋 Actionable Items
Each command provides:
- Clear action items with priorities
- Estimated effort and timelines
- Dependencies and prerequisites
- Success criteria and metrics

### 🔍 Context-Aware
Commands analyze your current codebase to provide:
- Relevant examples based on existing patterns
- Accurate complexity estimates
- Appropriate technology recommendations
- Context-sensitive best practices

## Best Practices

### 1. Start with Planning
Use planning commands to establish clear requirements and scope before development:
```
/plan-issue feature-name
/breakdown complex task
```

### 2. Ensure Quality
Use architecture and code quality commands throughout development:
```
/architecture-review new-component
/refactor-suggestions problematic-file
/test-plan new-feature
```

### 3. Document Everything
Use documentation commands to maintain comprehensive documentation:
```
/docs feature-description
/update-readme relevant-section
/changelog new-version
```

### 4. Monitor and Analyze
Regularly use analysis commands to track project health:
```
/performance-report monthly
/tech-debt-analysis critical-modules
/code-review-summary latest-pr
```

### 5. Deploy Safely
Use DevOps commands for reliable deployments:
```
/deployment-checklist production
/security-audit sensitive-component
/monitoring-setup new-service
```

## Customization

### Adding New Commands
1. Create new `.md` files in appropriate category directories
2. Use the established template format with frontmatter
3. Include clear descriptions and argument hints
4. Provide comprehensive, actionable content

### Modifying Existing Commands
1. Edit the relevant `.md` file
2. Maintain the structure and format
3. Update examples to match your project
4. Test with your specific use cases

### Project-Specific Customization
Replace placeholder content with:
- Your actual technology stack
- Team-specific processes
- Project naming conventions
- Custom quality standards

## Integration with Workflows

### GitHub Integration
Many commands generate GitHub-ready content:
- Use `/plan-issue` to create structured issues
- Use `/changelog` for release documentation
- Use `/code-review-summary` for PR reviews

### CI/CD Pipeline
Integrate commands into your pipeline:
- Use `/security-audit` in security checks
- Use `/test-plan` for coverage requirements
- Use `/deployment-checklist` for deployment gates

### Team Collaboration
Share commands with your team:
- Commands are version-controlled with your project
- Everyone uses the same templates and standards
- Consistent documentation and planning approach

## Examples

### Creating a New Feature
```bash
# 1. Plan the feature
/plan-issue user profile management

# 2. Break down tasks
/breakdown implement user profile CRUD

# 3. Design API
/api-design user_profiles

# 4. Create database schema
/database-schema user_profile

# 5. Scaffold code
/scaffold service UserProfileService

# 6. Plan tests
/test-plan user profile features

# 7. Document
/docs user profile management system

# 8. Update changelog
/changelog v1.2.0
```

### Improving Code Quality
```bash
# 1. Analyze existing code
/refactor-suggestions app/services/problematic_service.rb

# 2. Review architecture
/architecture-review authentication system

# 3. Analyze technical debt
/tech-debt-analysis legacy authentication module

# 4. Optimize performance
/optimize slow database queries

# 5. Security review
/security-audit user authentication
```

### Deployment Preparation
```bash
# 1. Create deployment checklist
/deployment-checklist staging

# 2. Security audit
/security-audit payment processing

# 3. Performance report
/performance-report last_week

# 4. Setup monitoring
/monitoring-setup new-api-service

# 5. Update documentation
/update-readme deployment instructions
```

## Troubleshooting

### Command Not Found
- Ensure the `.claude/commands/` directory structure is correct
- Check that command files have proper frontmatter
- Verify filenames match the command names

### Arguments Not Working
- Use proper argument syntax: `$1`, `$2`, or `$ARGUMENTS`
- Check argument hints in command frontmatter
- Ensure arguments are properly escaped

### Output Not Contextual
- Commands analyze your codebase for relevance
- Ensure you're in the correct project directory
- Check that the codebase is accessible to Claude

## Contributing

To contribute new commands or improvements:

1. Follow the established template format
2. Include comprehensive, actionable content
3. Test commands with real scenarios
4. Update this README with new commands
5. Ensure proper categorization

## Support

For issues with commands:
1. Check the command file for syntax errors
2. Verify the command structure follows templates
3. Test with simpler arguments first
4. Review Claude Code documentation for slash command requirements

---

**Note**: These commands are designed to be used with Claude Code and follow the custom slash command format specified in the Claude Code documentation.