---
inclusion: agent
---

# Data Model Template

**Output File**: `.kiro/specs/[feature-name]/data-model.md`

**Standards**: Must follow `helper-diagram-standards.md`

---

## File Template

```markdown
# Data Model: [Feature Name]

**Created**: [Date]
**Last Updated**: [Date]
**Status**: Draft | Review | Approved

---

## 1. Data Model Overview

### 1.1 Entity Relationship Diagram

\`\`\`mermaid
erDiagram
    ENTITY_A ||--o{ ENTITY_B : "has"
    ENTITY_A {
        string id PK
        string name
        datetime created_at
    }
    ENTITY_B ||--|{ ENTITY_C : "contains"
    ENTITY_B {
        string id PK
        string entity_a_id FK
        string status
        datetime updated_at
    }
    ENTITY_C {
        string id PK
        string entity_b_id FK
        decimal amount
        string type
    }
\`\`\`

### 1.2 Entity Summary

| Entity | Description | Key Attributes | Relationships |
|--------|-------------|----------------|---------------|
| **Entity A** | [Description] | id, name | Has many Entity B |
| **Entity B** | [Description] | id, status | Belongs to Entity A, Has many Entity C |
| **Entity C** | [Description] | id, amount, type | Belongs to Entity B |

---

## 2. Entity Definitions

### 2.1 [Entity Name]

#### Attributes

| Attribute | Type | Required | Unique | Default | Description | Constraints |
|-----------|------|----------|--------|---------|-------------|-------------|
| `id` | string | Yes | Yes | UUID | Primary identifier | UUID v4 format |
| `name` | string | Yes | No | - | Display name | 1-100 characters |
| `status` | enum | Yes | No | `active` | Current status | [active, inactive, suspended] |
| `created_at` | datetime | Yes | No | NOW() | Creation timestamp | ISO 8601 |
| `updated_at` | datetime | Yes | No | NOW() | Last update timestamp | ISO 8601 |

#### Business Rules

| Rule ID | Rule | Validation |
|---------|------|------------|
| BR-001 | [Rule description] | [How to validate] |

---

## 3. Relationships

### 3.1 Relationship Matrix

| From Entity | Relationship | To Entity | Cardinality | Description |
|-------------|--------------|-----------|-------------|-------------|
| Entity A | has | Entity B | 1:N | One A has many B |
| Entity B | contains | Entity C | 1:N | One B contains many C |

---

## 4. State Diagrams

### 4.1 [Entity Name] Lifecycle

\`\`\`mermaid
stateDiagram-v2
    [*] --> Draft: Create

    Draft --> Pending: Submit
    Draft --> Cancelled: Cancel

    Pending --> Approved: Approve
    Pending --> Rejected: Reject

    Approved --> Active: Activate
    Approved --> Cancelled: Cancel

    Active --> Completed: Complete
    Active --> Cancelled: Cancel

    Rejected --> Draft: Revise

    Completed --> [*]
    Cancelled --> [*]
\`\`\`

### 4.2 State Definitions

| State | Description | Allowed Transitions | Who Can Transition |
|-------|-------------|--------------------|--------------------|
| Draft | Initial creation state | Submit, Cancel | Owner |
| Pending | Awaiting approval | Approve, Reject | Approver |
| Approved | Ready for processing | Activate, Cancel | Admin |
| Active | Currently in use | Complete, Cancel | System |
| Completed | Successfully finished | - | - |
| Cancelled | Terminated | - | - |

---

## 5. Data Constraints

### 5.1 Validation Rules

| Constraint ID | Entity | Field | Rule | Error Message |
|---------------|--------|-------|------|---------------|
| VAL-001 | User | email | Must be valid email format | "Invalid email format" |
| VAL-002 | Order | amount | Must be > 0 | "Amount must be positive" |

### 5.2 Referential Integrity

| Constraint | Parent | Child | On Delete | On Update |
|------------|--------|-------|-----------|-----------|
| FK_entity_b_a | Entity A | Entity B | CASCADE | CASCADE |

---

## 6. Data Volume Estimates

| Entity | Initial Count | Monthly Growth | 1-Year Projection | Storage (per record) |
|--------|---------------|----------------|-------------------|---------------------|
| User | 1,000 | +500/month | 7,000 | ~2 KB |
| Order | 5,000 | +2,000/month | 29,000 | ~5 KB |

---

## 7. Domain Glossary

| Term | Definition | Synonyms | Related Entities |
|------|------------|----------|------------------|
| **[Term 1]** | [Definition] | [Synonyms to avoid] | Entity A, Entity B |

---

## 8. Data Model Traceability

### 8.1 Requirements Mapping

| Entity | Source Requirements | User Stories |
|--------|---------------------|--------------|
| Entity A | REQ-001, REQ-002 | US-001, US-003 |
| Entity B | REQ-003, REQ-005 | US-002, US-004 |
```
