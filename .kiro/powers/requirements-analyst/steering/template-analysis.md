---
inclusion: agent
---

# Analysis Output Template

**Output Files**:
- `.kiro/specs/[feature-name]/requirements.md` - This template
- `.kiro/specs/[feature-name]/data-model.md` - See `template-data-model.md`

**Standards**: Must follow `helper-diagram-standards.md`

---

## File Template

```markdown
# Analysis: [Feature Name]

**Created**: [Date]
**Status**: In Progress | Completed

---

## 1. User Personas

| Persona | Description | Key Goals |
|---------|-------------|-----------|
| [Persona 1] | [Brief description] | [Primary goals] |
| [Persona 2] | [Brief description] | [Primary goals] |

---

## 2. Core User Activity Flow

### Activity Diagram

\`\`\`mermaid
stateDiagram-v2
    [*] --> Activity1: Start

    Activity1 --> Decision1
    state Decision1 <<choice>>
    Decision1 --> Activity2: [Condition A]
    Decision1 --> Activity3: [Condition B]

    Activity2 --> Activity4
    Activity3 --> Activity4
    Activity4 --> [*]: End
\`\`\`

### Activity Details

| Activity | Description | Input | Output | Participants |
|----------|-------------|-------|--------|--------------|
| **Activity 1** | [Description] | [Input] | [Output] | [Who] |
| **Activity 2** | [Description] | [Input] | [Output] | [Who] |

---

## 3. User Story Map

### Release Planning

| Activity | MVP | v1.1 | v2.0 |
|----------|-----|------|------|
| **[Activity 1]** | US-001, US-002 | US-003 | US-004 |
| **[Activity 2]** | US-005 | US-006, US-007 | - |

---

## 4. User Stories

### Activity 1: [Activity Name]

#### US-001: [Story Title]

**Priority**: P0 | P1 | P2
**Persona**: [Which persona]
**Release**: MVP | v1.1 | v2.0

**Story**:
> As a [role],
> I want [feature/capability],
> So that [business value/benefit].

**Acceptance Criteria**:

\`\`\`gherkin
Scenario: [Scenario name]
  Given [precondition]
  When [action]
  Then [expected result]
\`\`\`

**INVEST Check**:
- [ ] **I**ndependent
- [ ] **N**egotiable
- [ ] **V**aluable
- [ ] **E**stimable
- [ ] **S**mall
- [ ] **T**estable

---

## 5. Use Case Diagram

\`\`\`mermaid
graph TB
    subgraph SystemBoundary["System Boundary"]
        direction TB
        UC1((UC-001<br/>Use Case 1))
        UC2((UC-002<br/>Use Case 2))
        UC3((UC-003<br/>Use Case 3))

        UC1 -->|<<include>>| UC2
        UC3 -.->|<<extend>>| UC1
    end

    Actor1[/"👤 Actor 1"\]
    Actor2[/"👤 Actor 2"\]

    Actor1 --> UC1
    Actor1 --> UC3
    Actor2 --> UC2

    style UC1 fill:#e1f5fe,stroke:#01579b
    style UC2 fill:#e1f5fe,stroke:#01579b
    style UC3 fill:#fff3e0,stroke:#e65100
\`\`\`

### Use Case List

| UC ID | Name | Primary Actor | Priority | Description |
|-------|------|---------------|----------|-------------|
| **UC-001** | [Name] | [Actor] | P0 | [Brief description] |
| **UC-002** | [Name] | [Actor] | P0 | [Brief description] |

---

## 6. Use Case Details

### UC-001: [Use Case Name]

#### Main Flow Sequence Diagram

\`\`\`mermaid
sequenceDiagram
    autonumber

    actor User as 👤 User
    participant UI as 🖥️ Interface
    participant System as ⚙️ System
    participant DB as 🗄️ Database

    User->>UI: 1. Initiate Request
    activate UI
    UI->>System: 2. Forward Request
    activate System
    System->>DB: 3. Query Data
    activate DB
    DB-->>System: 4. Return Data
    deactivate DB

    alt Success
        System-->>UI: 5. Success Response
        UI-->>User: 6. Display Result
    else Failure
        System-->>UI: 5. Error Response
        UI-->>User: 6. Display Error
    end

    deactivate System
    deactivate UI
\`\`\`

#### Preconditions
1. [Condition that must be true before starting]

#### Postconditions (Success)
1. [State after successful completion]

#### Exception Flows

**E1: [Error scenario name]**
- **Trigger**: [What causes this exception]
- **System Response**: "[Error message]"
- **Recovery**: [How to recover]

---

## 7. Success Criteria

| SC ID | Requirement | Category | Metric | Target | Verification |
|-------|-------------|----------|--------|--------|--------------|
| **SC-001** | US-001 | Functional | [Metric] | [Target] | [Method] |
| **SC-002** | US-001 | Performance | [Metric] | [Target] | [Method] |

---

## 8. Dependency Analysis

### Dependency Matrix

| Req ID | Depends On | Type | Impact if Delayed |
|--------|------------|------|-------------------|
| **REQ-002** | REQ-001 | Mandatory | Blocks feature |
| **REQ-003** | REQ-001, External API | Mandatory + External | High risk |

---

## 9. Feasibility Assessment

| Requirement | Technical Feasibility | Risk Level | Notes |
|-------------|----------------------|------------|-------|
| **REQ-001** | High | Low | Standard implementation |
| **REQ-002** | Medium | Medium | Requires new integration |

---

## 10. Non-Functional Requirements (NFR)

### Performance Requirements

| NFR ID | Requirement | Metric | Target | Related FR |
|--------|-------------|--------|--------|------------|
| NFR-P01 | [Requirement] | [Metric] | [Target] | US-XXX |

### Security Requirements

| NFR ID | Requirement | Metric | Target | Related FR |
|--------|-------------|--------|--------|------------|
| NFR-S01 | [Requirement] | [Metric] | [Target] | US-XXX |

---

## 11. Analysis Summary

**User Roles Identified**:
- [Role 1]
- [Role 2]

**Core Activities**:
- [Activity 1]
- [Activity 2]

**Key Findings**:
- **Finding 1**: [Description]
- **Finding 2**: [Description]

---

## 12. Next Steps

- [ ] Proceed to Phase 4: Clarify (Requirements Clarification)
- [ ] OR if iterating: Return to Phase 4/5 with updated analysis
```
