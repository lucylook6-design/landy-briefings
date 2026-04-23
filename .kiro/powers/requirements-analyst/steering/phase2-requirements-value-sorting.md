---
inclusion: agent
---

# Phase 2: Value Sorting

**Phase Objective**: Prioritize requirements and develop release plans.
**Time Allocation**: 10% of total effort
**Your Role**: Professional Requirements Analyst

---

## Quick Reference

| Method | Focus | Output | When to Use |
|--------|-------|--------|-------------|
| MoSCoW | Categorical priority | MUST/SHOULD/COULD/WONT list | All projects |
| RICE Scoring | Quantitative ranking | Scored priority list | Many requirements (>20) |
| Value-Cost Matrix | Trade-off visualization | Quadrant placement | Resource constraints |
| Weighted Scoring | Multi-factor evaluation | Composite scores | Complex decisions |

**CRITICAL CONSTRAINT**: MUST requirements MUST NOT exceed 30% of total.

---

## Output

**File**: `.kiro/specs/[feature-name]/sort.md`

> **Dependencies**: See `POWER.md` → File Dependencies for required template and helper files.

---

## Pre-Check (GATE CHECK)

**MUST pass this check before starting**:

- [ ] **Phase 3 completed?** All requirements analyzed with dependencies mapped?
- [ ] **Inputs available?** Domain model, feasibility assessment, dependency graph ready?
- [ ] **Unclear items identified?** Any requirements with unclear business value flagged?

**If ANY check fails**: STOP. NEVER proceed. Return to Phase 3.

---

## Your Tasks (NON-NEGOTIABLE)

1. **MoSCoW Classification**: Classify ALL requirements into MUST/SHOULD/COULD/WONT
2. **RICE Scoring**: Use RICE method for quantitative evaluation
3. **Value-Cost Analysis**: Use value-cost matrix for trade-off decisions
4. **Develop Release Plan**: Plan MVP and subsequent versions

## What You MUST NEVER Do

- ❌ NEVER prioritize based on intuition alone - use scientific methods
- ❌ NEVER let MUST priorities exceed 30% - this is a hard limit
- ❌ NEVER ignore requirement dependencies - validate against dependency graph
- ❌ NEVER develop release plan without stakeholder input

---

## Method 1: MoSCoW Classification

### MoSCoW Categories

| Category | Definition | Guidance | Typical % |
|----------|------------|----------|-----------|
| **Must Have** | Cannot launch without these | Core functionality, legal/compliance | ≤30% |
| **Should Have** | Important but not critical | Significant value, can workaround | 20-30% |
| **Could Have** | Nice to have if time permits | Enhances experience, low urgency | 20-30% |
| **Won't Have** | Not in this release | Future consideration, descoped | 10-20% |

---

## Method 2: RICE Scoring

### RICE Formula

```
RICE Score = (Reach × Impact × Confidence) / Effort
```

### RICE Factors

| Factor | Scale | Description | How to Estimate |
|--------|-------|-------------|-----------------|
| **Reach** | Number | Users affected per quarter | Analytics, user research |
| **Impact** | 0.25, 0.5, 1, 2, 3 | Per-user impact | Minimal(0.25) → Massive(3) |
| **Confidence** | 0-100% | How certain are we | Data-backed(100%) → Gut(20%) |
| **Effort** | Person-months | Development cost | Engineering estimate |

---

## Method 3: Value-Cost Matrix

### Value-Cost Quadrants

| Quadrant | Strategy | Action |
|----------|----------|--------|
| **P0 (Quick Win)** | Do First | High value, low effort - prioritize immediately |
| **P1 (Strategic)** | Plan Carefully | High value, high effort - worth investment but plan |
| **P2 (Fill-in)** | If Time Permits | Low value, low effort - easy add-ons |
| **P3 (Avoid)** | Deprioritize | Low value, high effort - usually not worth it |

---

## Exit Criteria (NON-NEGOTIABLE)

| Criteria | Standard | Verification | Status |
|----------|----------|--------------|--------|
| MoSCoW Classification | 100% requirements classified | MUST ≤ 30% | [ ] |
| RICE Scoring | Core requirements scored | Scores documented | [ ] |
| Priority List | Ranked by final score | No dependency conflicts | [ ] |
| Release Plan | MVP and versions defined | Timeline clear | [ ] |
| Stakeholder Approval | Priorities confirmed | Sign-off obtained | [ ] |

---

## Next Step

After completing this phase, proceed to:

**Phase 5: Validation**
- Requirements review meetings
- GWT acceptance criteria
- Prototype testing
- Traceability matrix
