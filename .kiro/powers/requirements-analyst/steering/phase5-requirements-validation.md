---
inclusion: agent
---

# Phase 5: Requirements Validation

**Phase Objective**: Validate requirements through 5 critical dimensions to ensure they are ready for implementation.
**Time Allocation**: 15% of total effort
**Your Role**: Professional Requirements Analyst

---

## Quick Reference

| Validation Dimension | Focus | Key Question |
|---------------------|-------|--------------|
| **Authenticity** | Real need | Is this a genuine user/business need? |
| **Completeness** | Coverage | Are all aspects fully specified? |
| **Consistency** | Coherence | Are requirements conflict-free? |
| **Feasibility** | Achievability | Is it technically and economically viable? |
| **Verifiability** | Testability | Can we objectively verify it's met? |

---

## Output

**File**: `.kiro/specs/[feature-name]/validation.md`

> **Dependencies**: See `POWER.md` → File Dependencies for required template and helper files.

---

## MANDATORY: Multi-Role Validation

Requirements MUST be validated from 5 role perspectives (see `helper-multi-role-validation.md`):
- **Product Manager (PM)**: Business value, user need, strategic alignment
- **Requirements Analyst (RA)**: Completeness, clarity, traceability
- **Software Architect (SA)**: Technical feasibility, architecture impact, NFRs
- **Software Engineer (SE)**: Implementation clarity, effort estimation, error handling
- **Test Engineer (TE)**: Testability, acceptance criteria, test coverage

---

## Pre-Check (GATE CHECK)

**MUST pass this check before starting**:

- [ ] **Phase 4 completed?** Verify `clarification.md` exists with resolved ambiguities
- [ ] **Requirements documented?** All requirements in `requirements.md` are clarified
- [ ] **Stakeholders available?** Reviewers from different roles identified

**If ANY check fails**: STOP. Return to Phase 4.

---

## Dimension 1: Authenticity Validation

### Purpose

Verify that requirements represent **genuine user needs** and **real business problems**, not assumptions or "nice-to-haves".

### Red Flags (Authenticity Issues)

| Red Flag | Description | Action |
|----------|-------------|--------|
| 🚩 "Users might want..." | Assumption without evidence | Conduct user research |
| 🚩 "Competitor has it" | Feature copying without validation | Validate with YOUR users |
| 🚩 No stakeholder source | Origin unclear | Trace back to source |
| 🚩 "Future-proofing" | Speculative requirement | Defer or validate need |

---

## Dimension 2: Completeness Validation

### Purpose

Ensure requirements are **fully specified** with no missing information, gaps, or TBDs.

### Completeness Metrics

| Category | Total Items | Specified | Complete (%) | Target |
|----------|-------------|-----------|--------------|--------|
| Functional | [N] | [N] | [%] | ≥95% |
| Data | [N] | [N] | [%] | ≥95% |
| Flows | [N] | [N] | [%] | ≥90% |
| States | [N] | [N] | [%] | ≥90% |
| Errors | [N] | [N] | [%] | ≥85% |
| NFRs | [N] | [N] | [%] | ≥90% |

---

## Dimension 3: Consistency Validation

### Purpose

Ensure requirements are **internally coherent** with no conflicts, contradictions, or ambiguous overlaps.

### Consistency Types

| Type | Description | Example |
|------|-------------|---------|
| **Internal** | No conflicts within same requirement | Field is both "required" and "optional" |
| **Inter-requirement** | No conflicts between requirements | REQ-1 says A, REQ-2 says NOT A |
| **Terminology** | Same term means same thing everywhere | "User" vs "Customer" vs "Client" |
| **Data** | Data definitions consistent | Field length differs in different places |

---

## Dimension 4: Feasibility Validation

### Purpose

Validate that requirements are **achievable** from technical, economic, operational, and schedule perspectives.

### Feasibility Dimensions

| Dimension | Focus |
|-----------|-------|
| **Technical** | Technology maturity, team capability, architecture fit |
| **Economic** | ROI, development cost, operational cost |
| **Operational** | Process impact, training, change management |
| **Schedule** | Timeline achievability, milestone gaps |
| **Legal/Compliance** | Regulatory requirements, GDPR, accessibility |

---

## Dimension 5: Verifiability Validation

### Purpose

Ensure every requirement can be **objectively verified** through testing, measurement, or inspection.

### Vague Terms to Scan

| Category | Vague Terms to Detect | Quantified Alternative |
|----------|----------------------|------------------------|
| **Performance** | fast, quick, responsive, efficient | "< 2s response time", "95th percentile < 500ms" |
| **Usability** | user-friendly, easy, intuitive, simple | "Task completion rate > 90%", "< 3 clicks" |
| **Quality** | reliable, stable, robust, secure, safe | "99.9% uptime", "OWASP Top 10 compliant" |
| **Flexibility** | flexible, configurable, extensible | "Supports N configuration options" |
| **Scale** | scalable, many, few, large, small | "10,000 concurrent users", "1TB storage" |

### GWT Acceptance Criteria Format

```gherkin
## Requirement: [REQ-ID] [Requirement Name]

### AC-1: [Scenario Name]
Given [precondition/context]
  And [additional precondition]
When [action/trigger]
Then [expected outcome]
  And [additional outcome with measurable criteria]
```

---

## Exit Criteria (NON-NEGOTIABLE)

| Criterion | Standard | Verification | Status |
|----------|----------|--------------|--------|
| **Authenticity** | All P0/P1 requirements have documented origin | Source traced | [ ] |
| **Completeness** | ≥95% functional, ≥90% NFR coverage | Checklist complete | [ ] |
| **Consistency** | Zero unresolved conflicts | Conflict matrix clear | [ ] |
| **Feasibility** | All dimensions assessed, no blockers | Assessment complete | [ ] |
| **Verifiability** | 100% P0 requirements have GWT | Test design exists | [ ] |
| **Multi-Role Review** | 5 role perspectives applied | Checklist complete | [ ] |
| **Sign-Off** | Key stakeholders approved | Signatures obtained | [ ] |

---

## Next Step (MUST PROMPT USER)

**CRITICAL**: After EVERY validation session, you MUST present the following options to the user:

| Option | Action | Description |
|--------|--------|-------------|
| **A** | **Specify** | Proceed to Specification - write PRD, API spec, BDD, RTM |
| **B** | **Validate** | Continue Validation - address remaining issues or re-validate |
| **C** | **Clarify** | Return to Clarification - resolve ambiguities causing validation failures |
| **D** | **Analyze** | Return to Analysis - update requirements based on validation findings |

### Validation Failure Routing Guide

| Failed Dimension | Primary Issue | Recommended Action |
|------------------|---------------|-------------------|
| **Authenticity** | Unverified user needs | **C (Clarify)** - Need stakeholder confirmation |
| **Completeness** | Missing requirements | **D (Analyze)** - Need to add/expand requirements |
| **Completeness** | Unclear specifications | **C (Clarify)** - Need to resolve ambiguities |
| **Consistency** | Conflicting requirements | **D (Analyze)** - Need to restructure/resolve conflicts |
| **Feasibility** | Technical blockers | **D (Analyze)** - Need to redesign approach |
| **Verifiability** | Missing acceptance criteria | **C (Clarify)** - Need to define test criteria |
