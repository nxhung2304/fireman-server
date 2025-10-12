---
description: Break down complex tasks into smaller, manageable subtasks
argument-hint: [task_description]
---

Break down the following task into detailed subtasks: $ARGUMENTS

## Instructions
Analyze the requested task and create a comprehensive breakdown:

1. **Task Analysis**: Understand the scope and complexity
2. **Subtask Identification**: Break into logical, actionable items
3. **Dependencies**: Identify what needs to be completed first
4. **Prioritization**: Order subtasks by importance and dependencies
5. **Time Estimates**: Provide realistic time estimates for each subtask
6. **Acceptance Criteria**: Define what completion looks like for each subtask

## Output Format
```
## Main Task: [Task Name]

### Phase 1: [Phase Name]
- [ ] **Subtask 1** (X hours/days) - Description
  - Dependencies: None
  - Acceptance: [Criteria]
  
- [ ] **Subtask 2** (X hours/days) - Description
  - Dependencies: Subtask 1
  - Acceptance: [Criteria]

### Phase 2: [Phase Name]
...
```

Focus on creating granular, actionable subtasks that can be completed independently. Include testing, documentation, and review tasks as needed.