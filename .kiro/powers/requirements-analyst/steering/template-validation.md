---
inclusion: agent
---

# Validation Output Template

**Output File**: `.kiro/specs/[feature-name]/validation.md`

**Standards**: Must validate 5 dimensions from `phase5-requirements-validation.md`

---

## File Template

```markdown
# Validation Report: [Feature Name]

**Feature**: [feature-name]
**Date**: YYYY-MM-DD
**Validator**: [Name]
**Status**: In Progress | Completed

---

## Executive Summary

[2-3 sentences summarizing validation outcome]

**Overall Status**: ✅ Validated / ⚠️ Conditional / ❌ Failed

---

## 1. Validation Dimension Summary

| Dimension | Status | Score | Critical Issues | Notes |
|-----------|--------|-------|-----------------|-------|
| **Authenticity** | ✅/⚠️/❌ | [%] | [Count] | [Brief note] |
| **Completeness** | ✅/⚠️/❌ | [%] | [Count] | [Brief note] |
| **Consistency** | ✅/⚠️/❌ | [%] | [Count] | [Brief note] |
| **Feasibility** | ✅/⚠️/❌ | [Rating] | [Count] | [Brief note] |
| **Verifiability** | ✅/⚠️/❌ | [%] | [Count] | [Brief note] |

---

## 2. Authenticity Validation (真实性)

### Authenticity Score: [X]% - [Status]

### Source Verification (Positive Findings)

| Req ID | Origin | Evidence | Stakeholder Confirmed | Confidence |
|--------|--------|----------|----------------------|------------|
| REQ-001 | User Interview #12 | Interview transcript | ✅ Yes | High |

### Red Flags Identified (Negative Findings)

| Req ID | Red Flag | Impact | Action Required |
|--------|----------|--------|-----------------|
| REQ-003 | No user evidence, assumption-based | May build unwanted feature | Conduct user research |

### Authenticity Verdict

> [2-3 sentences explaining why this score is appropriate.]

---

## 3. Completeness Validation (完整性)

### Completeness Score: [X]% - [Status]

### Score Calculation

| Category | Total Items | Specified | Weight | Weighted Score | Target | Status |
|----------|-------------|-----------|--------|----------------|--------|--------|
| Functional | [N] | [N] | 30% | [%] | ≥95% | ✅/❌ |
| Data | [N] | [N] | 20% | [%] | ≥95% | ✅/❌ |
| Flows | [N] | [N] | 20% | [%] | ≥90% | ✅/❌ |
| States | [N] | [N] | 10% | [%] | ≥90% | ✅/❌ |
| Errors | [N] | [N] | 10% | [%] | ≥85% | ✅/❌ |
| NFRs | [N] | [N] | 10% | [%] | ≥90% | ✅/❌ |
| **Total** | | | 100% | **[X]%** | | |

### Gaps Identified (Negative Findings)

| Gap ID | Category | Missing Item | Impact | Severity | Action |
|--------|----------|--------------|--------|----------|--------|
| GAP-001 | Error | Error handling for API timeout | Users see blank screen | Major | Define timeout handling flow |

### Completeness Verdict

> [2-3 sentences explaining the score, highlighting critical gaps.]

---

## 4. Consistency Validation (一致性)

### Consistency Score: [X]% - [Status]

### Conflicts Detected (Negative Findings)

| Conflict ID | Type | Req A | Req B | Description | Resolution Status |
|-------------|------|-------|-------|-------------|-------------------|
| CON-001 | Logic | REQ-001 | REQ-005 | [Conflict description] | ✅ Resolved |
| CON-002 | Terminology | REQ-002 | REQ-008 | "Customer" vs "Client" | ⚠️ Pending |

### Consistency Verdict

> [2-3 sentences explaining the score.]

---

## 5. Feasibility Validation (可行性)

### Overall Feasibility Score: [Rating] - [Status]

### 5.1 Technical Feasibility - [Rating]

| Area | Rating | Evidence |
|------|--------|----------|
| Technology Maturity | High/Medium/Low | [Specific evidence] |
| Team Capability | High/Medium/Low | [Evidence] |
| Architecture Fit | High/Medium/Low | [Evidence] |

**Technical Verdict**: ✅ Feasible / ⚠️ Risks / ❌ Not Feasible

### 5.2 Economic Feasibility - [Rating]

| Metric | Value | Benchmark | Assessment |
|--------|-------|-----------|------------|
| Development Cost | [Amount] | Budget: [Amount] | ✅/⚠️/❌ |
| 3-Year ROI | [%] | Threshold: [%] | ✅/⚠️/❌ |

**Economic Verdict**: ✅ Viable / ⚠️ Marginal / ❌ Not Viable

### 5.3 Schedule Feasibility - [Rating]

| Milestone | Required | Achievable | Gap | Risk |
|-----------|----------|------------|-----|------|
| Design | [Date] | [Date] | [Days] | High/Medium/Low |
| Release | [Date] | [Date] | [Days] | High/Medium/Low |

**Schedule Verdict**: ✅ Achievable / ⚠️ At Risk / ❌ Not Achievable

### Feasibility Verdict

> [3-4 sentences summarizing overall feasibility.]

---

## 6. Verifiability Validation (可验证性)

### Verifiability Score: [X]% - [Status]

### 6.1 Vague Terms Check

| Vague Term | Found In | Count | Replacement Recommendation |
|------------|----------|-------|---------------------------|
| "fast" | REQ-004, REQ-012 | 2 | "Response time < 2s" |
| "user-friendly" | REQ-006 | 1 | "Task completion rate > 90%" |

### 6.2 Non-Quantified Standards Check

| Req ID | Non-Quantified Statement | Issue | Quantified Recommendation |
|--------|--------------------------|-------|--------------------------|
| REQ-004 | "System should respond quickly" | No time metric | "Response time < 500ms for 95th percentile" |

### GWT Coverage Matrix

| Req ID | Happy Path | Error Scenarios | Edge Cases | Status |
|--------|------------|-----------------|------------|--------|
| REQ-001 | ✅ | ✅ (3) | ✅ (2) | ✅ Complete |
| REQ-002 | ✅ | ✅ (2) | ❌ Missing | ⚠️ Incomplete |

### Verifiability Verdict

> [2-3 sentences explaining the score.]

---

## 7. Multi-Role Validation

### Role Sign-Off Matrix

| Req ID | PM | RA | SA | SE | TE | Overall |
|--------|----|----|----|----|-----|---------|
| REQ-001 | ✅ | ✅ | ⚠️ | ✅ | ✅ | ⚠️ |
| REQ-002 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

**Legend**: ✅ Pass | ⚠️ Issues | ❌ Fail

---

## 8. Outstanding Issues

| ID | Dimension | Severity | Description | Owner | Due | Status |
|----|-----------|----------|-------------|-------|-----|--------|
| V-001 | Authenticity | Critical | [Desc] | [Name] | [Date] | Open |
| V-002 | Completeness | Major | [Desc] | [Name] | [Date] | Open |

---

## 9. Sign-Off

| Role | Name | Decision | Date | Comments |
|------|------|----------|------|----------|
| Product Owner | [Name] | Approved/Rejected | [Date] | [Comments] |
| Technical Lead | [Name] | Approved/Conditional/Rejected | [Date] | [Conditions] |

---

## Next Steps Available

| Option | Action | When to Choose |
|--------|--------|----------------|
| **A** | **Specify** (Proceed) | All 5 dimensions pass, no critical issues |
| **B** | **Validate** (Continue) | Critical/major issues remain |
| **C** | **Clarify** (Return) | New ambiguities discovered |

---
**Reply with A, B, or C to proceed.**
```
