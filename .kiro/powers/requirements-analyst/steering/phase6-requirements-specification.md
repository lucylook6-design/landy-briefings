---
inclusion: agent
---

# Phase 6: Requirements Specification

**Phase Objective**: Formalize validated requirements into unified documentation, establish requirements baseline.
**Time Allocation**: 10% of total effort
**Your Role**: Professional Requirements Analyst

---

## Quick Reference

| Deliverable | Format | Purpose | Mandatory? |
|-------------|--------|---------|------------|
| PRD Document | Markdown/PDF | Complete product requirements | ✅ Yes |
| API Specification | OpenAPI YAML | API contract definition | If API-heavy |
| RTM | Markdown | Requirements traceability matrix | ✅ Yes |
| Requirements Baseline | Version controlled | Change management | ✅ Yes |

---

## Output

**Primary Output**: `.kiro/specs/[feature-name]/prd.md` (Product Requirements Document)

**Additional Deliverables**:
- `.kiro/specs/[feature-name]/api.yaml` - OpenAPI specification (if applicable)
- `.kiro/specs/[feature-name]/rtm.md` - Requirements Traceability Matrix

> **Dependencies**: See `POWER.md` → File Dependencies for required template and helper files.

---

## Pre-Check (GATE CHECK)

**MUST satisfy these conditions before starting**:

| Check Item | Requirement | Status |
|-----------|-------------|--------|
| Phase 5 Complete | ALL Phase 5 validation criteria satisfied | [ ] |
| All Requirements Validated | Validated and approved requirements | [ ] |
| Stakeholder Alignment | Consensus on requirements | [ ] |

**If check fails**: STOP. Return to Phase 5 and complete validation.

---

## Custom Template Support (MUST ASK FIRST)

**CRITICAL**: Before generating any specification documents, you MUST ask the user about custom templates.

```markdown
---
## Specification Template Selection

Before I generate the specification documents, I need to know your template preferences.

**Do you want to use a custom specification template?**

| Option | Description |
|--------|-------------|
| **A** | **Use Default Templates** - Use the built-in PRD and API templates |
| **B** | **Use Custom Template** - Provide your own specification template |
| **C** | **Use Both** - Start with custom template, supplement with default sections |

---
Reply with **A**, **B**, or **C**.
```

---

## Your Tasks (NON-NEGOTIABLE)

1. **PRD Document**: Write complete Product Requirements Document
2. **API Specification**: Define API design document (if applicable)
3. **RTM**: Create Requirements Traceability Matrix linking requirements to design, code, and tests
4. **Requirements Baseline**: Establish formal requirements baseline with version control

## What You MUST NEVER Do

- ❌ NEVER use non-standard formats - MUST follow industry standards
- ❌ NEVER omit version control - MUST establish baseline
- ❌ NEVER ignore change management processes - MUST define change procedures
- ❌ NEVER over-pursue document perfection while ignoring actual value

---

## Method 1: PRD Document

### PRD Structure Overview

| Section | Content |
|---------|---------|
| Document Information | Version, owner, status |
| Executive Summary | 2-3 paragraph overview |
| Product Overview | Vision, objectives, target users, scope |
| Functional Requirements | Features, user stories, acceptance criteria, business rules |
| Non-Functional Requirements | Performance, security, reliability, usability |
| User Experience | Flows, wireframes, navigation |
| Technical Specifications | Architecture, integrations, data model |
| Release Plan | MVP, versions, roadmap |
| Dependencies and Risks | Dependencies, risk matrix |
| Appendices | Glossary, references, version history |
| Approvals | Stakeholder sign-off |

---

## Method 2: API Specification (OpenAPI)

### OpenAPI Structure Overview

| Section | Content |
|---------|---------|
| `info` | API name, version, description, contact |
| `servers` | Production and staging URLs |
| `paths` | Endpoints with operations (GET, POST, PUT, DELETE) |
| `components/schemas` | Data models and request/response objects |
| `components/responses` | Reusable response definitions |
| `components/securitySchemes` | Authentication methods |
| `security` | Global security requirements |

---

## Method 3: Requirements Traceability Matrix (RTM)

### Key Traceability Links

| Link Type | From | To | Purpose |
|-----------|------|-----|---------|
| **Derives** | Business Req | Functional Req | Decomposition tracking |
| **Implements** | Requirement | Code Location | Implementation tracking |
| **Verifies** | Test Case | Requirement | Test coverage tracking |
| **Depends** | Requirement | Requirement | Dependency management |

---

## Method 4: Requirements Baseline Management

### Version Numbering

**Semantic Versioning**: MAJOR.MINOR.PATCH

| Component | When to Increment | Example |
|-----------|-------------------|---------|
| **MAJOR** | Incompatible changes, major scope changes | 1.0.0 → 2.0.0 |
| **MINOR** | New features, backward compatible | 1.0.0 → 1.1.0 |
| **PATCH** | Bug fixes, clarifications | 1.0.0 → 1.0.1 |

---

## Complete Process Deliverables Checklist

After completing all 6 phases, verify:

- [ ] ✅ Stakeholder list and interview records
- [ ] ✅ User personas and journey maps
- [ ] ✅ Requirements value sorting matrix (MoSCoW, RICE)
- [ ] ✅ User story maps and use case diagrams
- [ ] ✅ Priority ranking and release plans
- [ ] ✅ Validation report
- [ ] ✅ PRD document
- [ ] ✅ API specification (if applicable)
- [ ] ✅ Requirements Traceability Matrix (RTM)
- [ ] ✅ Requirements baseline with version control

---

## Exit Criteria (NON-NEGOTIABLE)

| Criteria | Standard | Verification | Status |
|----------|----------|--------------|--------|
| PRD Document | Complete and reviewed | Checklist verified | [ ] |
| API Specification | OpenAPI format (if applicable) | Schema validated | [ ] |
| RTM | All requirements traced | Coverage > 80% | [ ] |
| Requirements Baseline | Version established | Git tagged | [ ] |
| Version Control | Under management | Repository confirmed | [ ] |
| Stakeholder Sign-off | Formal approval | Signatures obtained | [ ] |

---

## Congratulations!

You have completed all 6 phases of requirements engineering.

**Next Steps**: Proceed to design phase with:
- Approved PRD as input
- API specifications for development contracts
- RTM for ongoing traceability and change impact analysis
