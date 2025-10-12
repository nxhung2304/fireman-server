---
description: Generate changelog entries for new releases
argument-hint: [version]
---

Generate changelog entries for version: $ARGUMENTS

## Instructions
Analyze recent changes and create comprehensive changelog entries:

1. **Review Recent Commits**:
   - Look at git log since last release
   - Identify significant changes and features
   - Categorize changes by type and impact

2. **Analyze Changed Files**:
   - Review modified files for functionality changes
   - Identify breaking changes and deprecations
   - Note performance improvements and bug fixes

3. **Categorize Changes**:
   - **Added**: New features and functionality
   - **Changed**: Modifications to existing features
   - **Deprecated**: Features that will be removed in future
   - **Removed**: Features that have been removed
   - **Fixed**: Bug fixes and issue resolutions
   - **Security**: Security-related changes

4. **Assess Impact**:
   - Identify breaking changes that require user action
   - Note performance improvements
   - Highlight security updates
   - Mention migration requirements

## Output Format
```
# Changelog

## [Version] - [Date]

### Added
- **[Feature Name]**: [Description of new feature]
- **[Feature Name]**: [Description with benefits]

### Changed
- **[Component]**: [Description of change and impact]
- **[API]**: [Description of API modification]

### Deprecated
- **[Feature]**: [Description and alternative approach]
- **[Method]**: [Description and replacement method]

### Removed
- **[Feature]**: [Description and migration path]
- **[Configuration]**: [Description and replacement]

### Fixed
- **[Issue Description]**: [Fix details]
- **[Bug Title]**: [Resolution and impact]

### Security
- **[Security Issue]**: [Description and fix]
- **[Vulnerability]**: [Mitigation and update]

## Migration Guide
### Required Actions
- **[Action 1]**: [Step-by-step instructions]
- **[Action 2]**: [Details on how to update]

### Optional Improvements
- **[Improvement 1]**: [Recommendation]
- **[Improvement 2]**: [Benefits and implementation]

## Contributors
- [@username] - [Contribution description]
- [@username] - [Contribution description]

## Links
- [Pull Request #XXX](link)
- [Issue #XXX](link)
```

Focus on creating clear, user-friendly changelog entries that help users understand what changed and how it affects them.