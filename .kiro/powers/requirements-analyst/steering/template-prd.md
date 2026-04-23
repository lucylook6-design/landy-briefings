---
inclusion: agent
---

# PRD (Product Requirements Document) Template

**Purpose**: Comprehensive product requirements document consolidating all analysis, clarification, and validation results.

**Output File**: `.kiro/specs/[feature-name]/prd.md`

**Source Documents**:
- `discovery.md` - Stakeholder and context information
- `sort.md` - Priority and release planning
- `requirements.md` - User stories, use cases, domain model
- `clarification.md` - Clarification decisions
- `validation.md` - Validation results

---

## File Template

```markdown
# Product Requirements Document (PRD)

# [Product/Feature Name]

---

## Document Information

| Field | Value |
|-------|-------|
| **Product Name** | [Name] |
| **Version** | v1.0.0 |
| **Creation Date** | [Date] |
| **Last Updated** | [Date] |
| **Owner** | [Name] |
| **Status** | Draft / In Review / Approved |

### Document History

| Version | Date | Author | Changes | Approved By |
|---------|------|--------|---------|-------------|
| 0.1 | [Date] | [Name] | Initial draft | - |
| 1.0 | [Date] | [Name] | Baseline release | [Names] |

---

## 1. Executive Summary

### 1.1 Overview

[2-3 paragraphs summarizing: What is this product? What problem does it solve? Who is it for? What are the key benefits?]

### 1.2 Key Highlights

| Aspect | Summary |
|--------|---------|
| **Target Users** | [Primary user personas] |
| **Core Value** | [Primary value proposition] |
| **MVP Scope** | [Key features in MVP] |
| **Timeline** | [Target release date] |
| **Success Metric** | [Primary KPI] |

### 1.3 Validation Status

| Dimension | Score | Status |
|-----------|-------|--------|
| Authenticity | [X]% | ✅/⚠️/❌ |
| Completeness | [X]% | ✅/⚠️/❌ |
| Consistency | [X]% | ✅/⚠️/❌ |
| Feasibility | [X]% | ✅/⚠️/❌ |
| Verifiability | [X]% | ✅/⚠️/❌ |

---

## 2. Product Overview

### 2.1 Product Vision

[What is the long-term vision for this product?]

### 2.2 Problem Statement

| Aspect | Description |
|--------|-------------|
| **Current State** | [How things work today] |
| **Pain Points** | [What problems users face] |
| **Impact** | [Business/user impact of these problems] |
| **Evidence** | [Data/research supporting this problem exists] |

### 2.3 Product Objectives

| ID | Objective | Success Metric | Target | Measurement Method |
|----|-----------|----------------|--------|-------------------|
| OBJ-001 | [Objective 1] | [Metric] | [Target Value] | [How measured] |
| OBJ-002 | [Objective 2] | [Metric] | [Target Value] | [How measured] |

### 2.4 Scope Definition

#### In Scope

| ID | Feature/Capability | Release | Priority |
|----|-------------------|---------|----------|
| S-001 | [Feature 1] | MVP | P0 |
| S-002 | [Feature 2] | MVP | P0 |

#### Out of Scope

| Item | Reason | Future Consideration |
|------|--------|---------------------|
| [Excluded item 1] | [Why excluded] | v2.0 / Never |

---

## 3. User Analysis

### 3.1 User Personas

#### Persona 1: [Persona Name]

| Attribute | Description |
|-----------|-------------|
| **Role** | [Job title/role] |
| **Goals** | [What they want to achieve] |
| **Pain Points** | [Current frustrations] |
| **Success Criteria** | [What makes them successful] |

**Quote**: "[Representative quote from user research]"

---

## 4. Functional Requirements

### 4.1 Requirements Summary

| Req ID | Requirement | Priority | Release | Status |
|--------|-------------|----------|---------|--------|
| REQ-001 | [Brief description] | P0 | MVP | Validated |
| REQ-002 | [Brief description] | P0 | MVP | Validated |

### 4.2 Feature: [Feature 1 Name]

#### 4.2.1 User Stories

##### US-001: [Story Title]

| Attribute | Value |
|-----------|-------|
| **Priority** | P0 |
| **Persona** | [Which persona] |
| **Release** | MVP |

**Story**:
> As a [role],
> I want [feature/capability],
> So that [business value/benefit].

**Acceptance Criteria**:

\`\`\`gherkin
Scenario: [Happy path scenario]
  Given [precondition]
  When [action]
  Then [expected result]
    And [additional verification]

Scenario: [Error scenario]
  Given [precondition]
  When [error condition]
  Then [error handling]
    And [user notification]
\`\`\`

---

## 5. Use Cases

### 5.1 Use Case Diagram

\`\`\`mermaid
graph TB
    subgraph SystemBoundary["[System Name]"]
        direction TB
        UC1((UC-001<br/>Use Case 1))
        UC2((UC-002<br/>Use Case 2))

        UC1 -->|<<include>>| UC2
    end

    Actor1[/"👤 Actor 1"\]
    Actor1 --> UC1

    style UC1 fill:#e1f5fe,stroke:#01579b
    style UC2 fill:#e1f5fe,stroke:#01579b
\`\`\`

---

## 6. Domain Model

### 6.1 Entity Relationship Diagram

\`\`\`mermaid
erDiagram
    USER ||--o{ ORDER : places
    USER {
        string id PK
        string email UK
        string name
        datetime created_at
    }
    ORDER ||--|{ ORDER_ITEM : contains
    ORDER {
        string id PK
        string user_id FK
        string status
        decimal total
        datetime created_at
    }
\`\`\`

---

## 7. Non-Functional Requirements

### 7.1 Performance Requirements

| ID | Requirement | Metric | Target | Measurement |
|----|-------------|--------|--------|-------------|
| NFR-P001 | Page Load Time | Time to interactive | < 3 seconds | Lighthouse |
| NFR-P002 | API Response Time | 95th percentile latency | < 500ms | APM monitoring |

### 7.2 Security Requirements

| ID | Category | Requirement | Standard |
|----|----------|-------------|----------|
| NFR-SEC001 | Authentication | Multi-factor authentication for admin | NIST 800-63B |
| NFR-SEC002 | Authorization | Role-based access control (RBAC) | - |

### 7.3 Availability & Reliability

| ID | Requirement | Target | Measurement |
|----|-------------|--------|-------------|
| NFR-A001 | Uptime | 99.9% | Monitoring |
| NFR-A002 | RTO | < 1 hour | DR testing |

---

## 8. Dependencies & Risks

### 8.1 Risk Register

| Risk ID | Risk | Probability | Impact | Score | Mitigation | Owner |
|---------|------|-------------|--------|-------|------------|-------|
| RISK-001 | [Risk description] | H/M/L | H/M/L | [P×I] | [Strategy] | [Name] |

---

## 9. Release Plan

### 9.1 Release Overview

| Release | Theme | Target Date | Status |
|---------|-------|-------------|--------|
| MVP (v1.0) | Core functionality | [Date] | [Status] |
| v1.1 | Enhanced usability | [Date] | Planned |

### 9.2 Roadmap

\`\`\`mermaid
gantt
    title Release Roadmap
    dateFormat YYYY-MM-DD
    section Releases
    MVP (v1.0)   :milestone, m1, 2025-03-31, 0d
    v1.1         :milestone, m2, 2025-06-30, 0d
    v2.0         :milestone, m3, 2025-12-31, 0d
\`\`\`

---

## 10. Glossary

| Term | Definition | Context |
|------|------------|---------|
| [Term 1] | [Definition] | [Where used] |

---

## Approvals

### Stakeholder Sign-Off

| Role | Name | Decision | Date | Comments |
|------|------|----------|------|----------|
| Product Owner | [Name] | Approved / Rejected | [Date] | [Comments] |
| Technical Lead | [Name] | Approved / Conditional | [Date] | [Conditions] |
| QA Lead | [Name] | Approved / Rejected | [Date] | [Comments] |

---

**Document End**
```
