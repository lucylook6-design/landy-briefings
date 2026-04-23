---
inclusion: agent
---

# Phase 3: Requirements Analysis

**Phase Objective**: Deep analysis of dependencies, feasibility, and implementation approaches.
**Time Allocation**: 20% of total effort
**Your Role**: Professional Requirements Analyst

---

## Quick Reference

| Method | Focus | Output | When to Use |
|--------|-------|--------|-------------|
| User Story Mapping | User activities and priorities | Story map with MVP | All projects |
| Use Case Analysis | Actor-system interactions | Use case documents | Complex interactions |
| Success Criteria | Measurable outcomes | SMART criteria list | All requirements |
| Event Storming | Domain events and commands | Domain model | Complex business logic |
| Dependency Analysis | Requirement relationships | Dependency graph | Multi-requirement projects |
| Domain Data Modeling | Entities and relationships | data-model.md | Projects with data entities |
| NFR Analysis | System qualities | NFR specification | All projects |

---

## Output

**Files**:
- `.kiro/specs/[feature-name]/requirements.md` - User stories, use cases, success criteria, dependencies
- `.kiro/specs/[feature-name]/data-model.md` - Entity definitions, relationships, state diagrams

> **Dependencies**: See `POWER.md` → File Dependencies for required template and helper files.

---

## MANDATORY: Diagram and Documentation Standards

**CRITICAL**: Follow `helper-diagram-standards.md` standards for all diagrams and documentation.

### Expression Priority (MUST FOLLOW)

```
1st Priority: Diagram (Visual representation)
    └── 2nd Priority: UML Diagram (Standard notation)
        └── 3rd Priority: Mermaid Syntax (Generation method)
```

---

## Pre-Check (GATE CHECK)

**MUST pass this check before starting**:

- [ ] **Phase 2 completed?** Verify `sort.md` exists with value sorting matrix
- [ ] **Inputs available?** Confirm prioritization (MoSCoW/RICE) is complete
- [ ] **Unclear items identified?** List requirements flagged for clarification

**If ANY check fails**: STOP. NEVER proceed. Return to Phase 2.

---

## MANDATORY: Reference Existing Clarification & Validation Files

**CRITICAL**: If clarification or validation files already exist, you MUST load and reference them.

| File Exists | Action Required |
|-------------|-----------------|
| `clarification.md` | Load and apply all resolved clarifications to analysis |
| `validation.md` | Load and address all validation findings in analysis |
| Both files exist | This is an iteration - update analysis based on both |

---

## Your Tasks (NON-NEGOTIABLE)

1. **User Story Mapping**: Create complete user story maps
2. **Use Case Analysis**: Draw main use case diagrams and write use case documents
3. **Success Criteria Definition**: Define measurable success criteria for each requirement
4. **Dependency Analysis**: Map requirement dependencies and identify conflicts
5. **Feasibility Assessment**: Evaluate technical feasibility and risks
6. **Domain Data Modeling**: Define entities, relationships, and state diagrams in `data-model.md`

## What You MUST NEVER Do

- ❌ NEVER be superficial - deep analysis is mandatory
- ❌ NEVER ignore requirement dependencies - document all relationships
- ❌ NEVER skip technical feasibility assessment - it is required
- ❌ NEVER force-fit DDD just to use it (DDD suits complex business; simple projects can use simplified models)

---

## Method 1: User Story Mapping

**User Story Format**:

```
As a [role],
I want [feature/capability],
So that [business value/benefit].
```

### INVEST Criteria

Each user story MUST be:
- **I**ndependent: Can be developed separately
- **N**egotiable: Details can be discussed
- **V**aluable: Delivers value to user/business
- **E**stimable: Can be sized/estimated
- **S**mall: Fits within a sprint
- **T**estable: Has clear acceptance criteria

---

## Method 2: Use Case Analysis

### Use Case Document Template

```markdown
## Use Case: [UC-XXX] [Use Case Name]

### Basic Information
| Field | Value |
|-------|-------|
| **Use Case ID** | UC-XXX |
| **Name** | [Descriptive name] |
| **Primary Actor** | [Who initiates] |
| **Secondary Actors** | [Other participants] |
| **Level** | User Goal / Subfunction |
| **Priority** | P0 / P1 / P2 |

### Main Flow (Happy Path)
| Step | Actor | System |
|------|-------|--------|
| 1 | [Actor action] | |
| 2 | | [System response] |

### Exception Flows
**E1: [Error scenario name]**
- **Trigger**: [What causes this exception]
- **Steps**:
  1. System displays error message: "[Exact message]"
  2. [Recovery action]
```

---

## Method 3: Success Criteria Definition

### SMART Criteria

Each success criterion MUST be **SMART**:

| Attribute | Description | Example |
|-----------|-------------|---------|
| **S**pecific | Clear and unambiguous | "Page loads in under 2 seconds" not "Page loads fast" |
| **M**easurable | Quantifiable metric | "95% of users complete checkout" |
| **A**chievable | Realistic given constraints | Consider technical limitations |
| **R**elevant | Aligned with business goals | Ties to user value |
| **T**ime-bound | Has defined timeframe | "Within first 30 days of launch" |

---

## Method 4: Dependency Analysis

### Dependency Types

| Type | Description | Example | Risk Level |
|------|-------------|---------|------------|
| **Mandatory** | Must complete A before B | Login before checkout | High |
| **Optional** | A enhances B | Search filters enhance search | Low |
| **Conflicting** | A and B cannot coexist | Two auth methods | Critical |
| **External** | Depends on outside system | Payment gateway | High |

---

## Method 5: Domain Data Modeling

### Purpose

Create a comprehensive data model that defines all entities, their attributes, relationships, and state lifecycles.

**OUTPUT FILE**: `.kiro/specs/[feature-name]/data-model.md`

### Data Model Components

| Component | Description | Diagram Type |
|-----------|-------------|--------------|
| **Entity Definitions** | All entities with attributes | Table format |
| **Relationships** | Entity relationships and cardinality | ER Diagram |
| **State Diagrams** | Entity lifecycle states | State Diagram |
| **Constraints** | Validation rules, referential integrity | Table format |
| **Data Dictionary** | Standard types, enumerations | Table format |

---

## Method 6: Non-Functional Requirements (NFR) Analysis

### NFR Categories (FURPS+ Model)

| Category | Focus | Key Questions |
|----------|-------|---------------|
| **Performance** | Speed & Efficiency | Response time? Throughput? Concurrent users? |
| **Security** | Protection | Authentication? Authorization? Data encryption? Audit? |
| **Reliability** | Availability | Uptime SLA? Failover? Data backup? Recovery time? |
| **Usability** | User Experience | Accessibility (WCAG)? Learnability? Error handling? |
| **Scalability** | Growth Capacity | Horizontal/vertical scaling? Data volume growth? |
| **Maintainability** | Operational | Logging? Monitoring? Deployment? Documentation? |
| **Compatibility** | Integration | Browsers? Devices? OS? Third-party systems? |

---

## Exit Criteria (NON-NEGOTIABLE)

| Criteria | Standard | Verification | Status |
|----------|----------|--------------|--------|
| **Diagram Standards** | All diagrams follow UML/Mermaid standards | Check against `helper-diagram-standards.md` | [ ] |
| User Story Map | Core user journeys mapped | Verify activity flow | [ ] |
| Use Case Diagrams | Main use cases documented with Sequence Diagrams | Review interactions | [ ] |
| **Success Criteria** | SMART criteria defined for key requirements | Verify measurability | [ ] |
| **Data Model** | `data-model.md` created with entities and relationships | Verify ER diagram and state diagrams | [ ] |
| **NFR Analysis** | All NFR categories reviewed with measurable targets | Verify NFR completeness | [ ] |
| Dependency Graph | Dependencies mapped | Check for circular | [ ] |
| Feasibility Assessment | Technical risks evaluated | Risk assessment complete | [ ] |

---

## Next Step

After completing this phase, proceed to:

**Phase 4: Clarification**
- Systematic questioning to eliminate ambiguity
- Requirement refinement and validation
- Release planning
