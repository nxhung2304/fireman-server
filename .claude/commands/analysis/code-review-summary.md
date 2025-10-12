---
description: Summarize code review findings for pull requests
argument-hint: [pr_number]
---

Generate comprehensive code review summary for PR: $ARGUMENTS

## Instructions
Analyze the pull request and create a structured summary covering:

1. **Code Quality Assessment**:
   - Code style and formatting compliance
   - Best practices adherence
   - Code complexity and maintainability
   - Security considerations

2. **Functionality Review**:
   - Feature implementation completeness
   - Bug fixes and their effectiveness
   - Edge case handling
   - Performance implications

3. **Testing Coverage**:
   - Test completeness and quality
   - Test case scenarios covered
   - Mock usage and isolation
   - Integration with existing test suite

4. **Documentation and Comments**:
   - Code documentation adequacy
   - API documentation updates
   - README updates if needed
   - Inline code comments quality

## Output Format
```
# Code Review Summary: PR #[PR Number]

## Overview
**PR Title**: [PR Title]
**Author**: [@author]
**Reviewers**: [@reviewer1, @reviewer2]
**Files Changed**: [X] files, [+Y additions, -Z deletions]
**Review Date**: [Date]
**Overall Status**: [Approved/Request Changes/Needs Work]

## Quick Summary
- **Primary Focus**: [Main purpose of the PR]
- **Key Changes**: [Most significant changes]
- **Risk Level**: [Low/Medium/High]
- **Test Coverage**: [X]% (target: [Y]%)
- **Breaking Changes**: [Yes/No]

## Detailed Review Findings

### Code Quality Assessment

#### ✅ Strengths
1. **[Strength 1]**: [Description of what was done well]
   - **Example**: [Code snippet or specific reference]
   - **Impact**: [Why this is good]

2. **[Strength 2]**: [Description of what was done well]
   - **Example**: [Code snippet or specific reference]
   - **Impact**: [Why this is good]

#### ⚠️ Areas for Improvement
1. **[Issue 1]**: [Description of the issue]
   - **Location**: [File:Line] or [Function name]
   - **Severity**: [Low/Medium/High]
   - **Suggestion**: [How to improve]
   - **Code Example**:
     ```diff
     - [Current code]
     + [Suggested improvement]
     ```

2. **[Issue 2]**: [Description of the issue]
   - **Location**: [File:Line] or [Function name]
   - **Severity**: [Low/Medium/High]
   - **Suggestion**: [How to improve]
   - **Code Example**:
     ```diff
     - [Current code]
     + [Suggested improvement]
     ```

#### 🚫 Critical Issues
1. **[Critical Issue 1]**: [Description of the critical issue]
   - **Location**: [File:Line] or [Function name]
   - **Risk**: [Why this is critical]
   - **Required Action**: [Must be fixed before merge]
   - **Code Example**:
     ```diff
     - [Problematic code]
     + [Required fix]
     ```

### Functionality Review

#### Feature Implementation
- **Completeness**: [Fully/Partially/Not implemented]
- **Correctness**: [Correct/Needs adjustments]
- **Edge Cases**: [Well handled/Missing some/Not considered]
- **Performance**: [Good/Acceptable/Needs optimization]

#### Specific Functionality Feedback
1. **[Feature 1]**: [Comments on implementation]
   - **Status**: [Working/Needs work/Blocked]
   - **Issues**: [Any problems identified]
   - **Suggestions**: [Improvement recommendations]

2. **[Feature 2]**: [Comments on implementation]
   - **Status**: [Working/Needs work/Blocked]
   - **Issues**: [Any problems identified]
   - **Suggestions**: [Improvement recommendations]

#### Breaking Changes
- **Breaking Changes Detected**: [Yes/No]
- **Impact**: [Description of impact if any]
- **Migration Path**: [How to handle breaking changes]
- **Backward Compatibility**: [How maintained if applicable]

### Testing Assessment

#### Test Coverage Analysis
| File | Lines | Covered | Coverage | Status |
|------|-------|---------|----------|---------|
| [file1] | [X] | [Y] | [Z]% | 🟢/🟡/🔴 |
| [file2] | [X] | [Y] | [Z]% | 🟢/🟡/🔴 |
| **Total** | [X] | [Y] | [Z]% | 🟢/🟡/🔴 |

#### Test Quality Review
- **Unit Tests**: [Adequate/Needs improvement/Insufficient]
- **Integration Tests**: [Present/Missing/Needs improvement]
- **Edge Case Testing**: [Comprehensive/Partial/Minimal]
- **Mock Usage**: [Appropriate/Overused/Underused]

#### Specific Test Feedback
1. **[Test Issue 1]**: [Description]
   - **Location**: [Test file]
   - **Problem**: [What's wrong with the test]
   - **Suggestion**: [How to improve]

2. **[Test Issue 2]**: [Description]
   - **Location**: [Test file]
   - **Problem**: [What's wrong with the test]
   - **Suggestion**: [How to improve]

### Security Review

#### Security Assessment
- **Vulnerabilities Found**: [Yes/No]
- **Security Best Practices**: [Followed/Partially followed/Not followed]
- **Input Validation**: [Adequate/Needs improvement/Insufficient]
- **Authentication/Authorization**: [Properly handled/Needs review/Issues found]

#### Security Issues
1. **[Security Issue 1]**: [Description]
   - **Severity**: [Critical/High/Medium/Low]
   - **Location**: [File:Line]
   - **Fix Required**: [Yes/No]
   - **Recommendation**: [How to address]

### Performance Review

#### Performance Impact Assessment
- **Performance Impact**: [Positive/Neutral/Negative]
- **Database Queries**: [Optimized/Acceptable/Needs optimization]
- **Memory Usage**: [Efficient/Acceptable/Potential issues]
- **API Response Times**: [Improved/No change/Regressed]

#### Performance Issues
1. **[Performance Issue 1]**: [Description]
   - **Impact**: [High/Medium/Low]
   - **Location**: [File:Line or function]
   - **Recommendation**: [Optimization suggestion]

### Documentation Review

#### Documentation Assessment
- **Code Comments**: [Adequate/Needs improvement/Insufficient]
- **API Documentation**: [Updated/Needs update/Not applicable]
- **README Updates**: [Required/Not required]
- **Change Log**: [Updated/Needs update]

#### Documentation Issues
1. **[Documentation Issue 1]**: [Description]
   - **Location**: [File or section]
   - **Suggestion**: [How to improve]

## Review Comments Summary

### By Reviewer

#### [@reviewer1]
- **Total Comments**: [X]
- **Approval Status**: [Approved/Request Changes/Needs Work]
- **Key Concerns**: [Main points raised]
- **Positive Feedback**: [What was praised]

#### [@reviewer2]
- **Total Comments**: [X]
- **Approval Status**: [Approved/Request Changes/Needs Work]
- **Key Concerns**: [Main points raised]
- **Positive Feedback**: [What was praised]

### Comment Categories
- **Code Style**: [X] comments
- **Functionality**: [X] comments
- **Testing**: [X] comments
- **Security**: [X] comments
- **Performance**: [X] comments
- **Documentation**: [X] comments

## Action Items

### Must Fix Before Merge
- [ ] **[Critical Issue 1]**: [Description and location]
- [ ] **[Critical Issue 2]**: [Description and location]
- [ ] **[Test Coverage]**: Add tests for [uncovered functionality]

### Should Fix (Recommended)
- [ ] **[Improvement 1]**: [Description and benefit]
- [ ] **[Improvement 2]**: [Description and benefit]
- [ ] **[Documentation]**: Update [specific documentation]

### Nice to Have (Optional)
- [ ] **[Enhancement 1]**: [Description]
- [ ] **[Enhancement 2]**: [Description]

## Merge Recommendation

### Recommendation Status
**[MERGE READY / REQUEST CHANGES / NEEDS WORK]**

### Justification
- **Code Quality**: [Summary of code quality assessment]
- **Testing**: [Summary of testing status]
- **Risk Assessment**: [Risk level and mitigation]
- **Business Impact**: [Impact on users and business]

### Merge Conditions
- **Required Actions**: [List of must-fix items]
- **Verification Steps**: [How to verify fixes]
- **Testing Requirements**: [Tests that must pass]
- **Documentation Requirements**: [Documentation that must be updated]

## Files Changed

### Summary
| File Type | Count | Lines Added | Lines Deleted |
|-----------|-------|-------------|---------------|
| Source Code | [X] | [Y] | [Z] |
| Tests | [X] | [Y] | [Z] |
| Documentation | [X] | [Y] | [Z] |
| Configuration | [X] | [Y] | [Z] |
| **Total** | [X] | [Y] | [Z] |

### File-by-File Analysis
#### [file1]
- **Changes**: [Description of changes]
- **Risk Level**: [Low/Medium/High]
- **Review Status**: [Approved/Needs work]
- **Comments**: [Key review points]

#### [file2]
- **Changes**: [Description of changes]
- **Risk Level**: [Low/Medium/High]
- **Review Status**: [Approved/Needs work]
- **Comments**: [Key review points]

## Next Steps

### For Author
1. **Address Critical Issues**: [Timeline for fixes]
2. **Respond to Comments**: [Engagement with reviewer feedback]
3. **Update Tests**: [Testing requirements]
4. **Update Documentation**: [Documentation requirements]

### For Reviewers
1. **Re-review**: [When to re-review after changes]
2. **Final Approval**: [Process for final approval]
3. **Merge Assistance**: [How to help with merge process]

### For Team
1. **Knowledge Sharing**: [How to share learnings from this PR]
2. **Process Improvement**: [What can be improved in review process]
3. **Standards Update**: [Any standards that need updating]

## Lessons Learned

### What Went Well
- **[Positive 1]**: [Description]
- **[Positive 2]**: [Description]

### Areas for Improvement
- **[Improvement 1]**: [Description]
- **[Improvement 2]**: [Description]

### Process Recommendations
- **[Process 1]**: [Suggestion for improving process]
- **[Process 2]**: [Suggestion for improving process]

## Metrics

### Review Metrics
- **Review Time**: [X] days from PR creation to first review
- **Revision Cycles**: [X] rounds of changes
- **Total Comments**: [X] comments across all reviewers
- **Time to Merge**: [X] days (if applicable)

### Quality Metrics
- **Code Coverage**: [X]% (target: [Y]%)
- **Static Analysis**: [Issues found/resolved]
- **Security Scan**: [Issues found/resolved]
- **Performance Tests**: [Pass/Fail status]

## Conclusion

### Overall Assessment
- **Code Quality**: [Excellent/Good/Fair/Poor]
- **Readiness for Production**: [Ready/Needs work/Not ready]
- **Business Value**: [High/Medium/Low]
- **Technical Debt Impact**: [Positive/Neutral/Negative]

### Final Recommendation
**[APPROVED / CHANGES REQUESTED / REJECTED]**

**Summary**: [Brief explanation of final decision and key reasons]

**Next Review Date**: [If changes requested, when to expect re-review]
```

Focus on providing constructive, actionable feedback that helps improve code quality while maintaining team velocity.