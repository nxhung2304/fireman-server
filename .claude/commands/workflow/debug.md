---
description: Provide systematic debugging approach for issues
argument-hint: [issue_description]
---

Provide a systematic debugging approach for: $ARGUMENTS

## Instructions
Analyze the described issue and create a comprehensive debugging strategy:

1. **Issue Analysis**:
   - Understand the problem scope and symptoms
   - Identify potential root causes
   - Determine impact and urgency

2. **Information Gathering**:
   - Collect relevant logs and error messages
   - Identify affected components and dependencies
   - Check recent changes that might be related

3. **Debugging Steps**:
   - Create a step-by-step debugging process
   - Include commands and tools to use
   - Provide verification methods at each step

4. **Common Solutions**:
   - List typical fixes for this type of issue
   - Include preventive measures
   - Suggest monitoring improvements

## Debugging Framework
```
## Debugging: [Issue Description]

### Issue Summary
**Problem**: [Clear problem statement]
**Symptoms**: [Observable behaviors]
**Impact**: [Who/what is affected]
**Priority**: [Urgency level]

### Initial Information Gathering
1. **Check Logs**:
   ```bash
   [Commands to check relevant logs]
   ```

2. **Verify System Status**:
   ```bash
   [Commands to check system health]
   ```

3. **Review Recent Changes**:
   ```bash
   [Commands to see recent commits/deployments]
   ```

### Systematic Debugging Steps

#### Step 1: Isolate the Problem
- **Action**: [Specific action to take]
- **Command**: [Command to run]
- **Expected**: [What you should see]
- **If Fails**: [Next step if this fails]

#### Step 2: Check Dependencies
- **Action**: [Check external dependencies]
- **Command**: [Verification commands]
- **Expected**: [Expected status]
- **If Fails**: [Troubleshooting steps]

#### Step 3: Test Individual Components
- **Action**: [Test components in isolation]
- **Command**: [Test commands]
- **Expected**: [Expected results]
- **If Fails**: [Next debugging step]

### Common Causes and Solutions
1. **[Cause 1]**:
   - **Symptoms**: [How to identify]
   - **Solution**: [How to fix]
   - **Prevention**: [How to prevent recurrence]

2. **[Cause 2]**:
   - **Symptoms**: [Identification method]
   - **Solution**: [Fix procedure]
   - **Prevention**: [Preventive measures]

### Advanced Debugging Techniques
- **Performance Profiling**: [How to profile]
- **Memory Analysis**: [How to check memory issues]
- **Network Analysis**: [How to debug network problems]
- **Database Debugging**: [How to debug database issues]

### Verification and Monitoring
- **Fix Verification**: [How to confirm the fix works]
- **Monitoring Setup**: [What to monitor going forward]
- **Alert Configuration**: [Alerts to prevent future issues]

### Escalation Criteria
Escalate to [team/person] if:
- [Condition 1]
- [Condition 2]
- [Condition 3]
```

Provide practical, actionable debugging steps that can be followed systematically.