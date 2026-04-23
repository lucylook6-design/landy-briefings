---
inclusion: agent
---

# Clarification Output Template

**Output File**: `.kiro/specs/[feature-name]/clarification.md`

**Standards**: Must follow Ambiguity Taxonomy from `phase4-requirements-clarification.md`

---

## File Template

```markdown
# Clarification Log: [Feature Name]

**Feature**: [feature-name]
**Session Date**: YYYY-MM-DD
**Total Questions**: [N]
**Status**: In Progress | Completed

---

## Q1: [Question Title]

**Category**: Functional Scope / Domain & Data / Interaction & UX / Non-Functional / Integration / Edge Cases / Terminology

**Question**: [Complete question text that was asked]

**Options Presented**:
- **A**: [Option A - full description]
- **B**: [Option B - full description]
- **C**: [Option C - full description]
- **Other**: Custom answer allowed

**Recommended**: Option [X] - [Reason for this recommendation]

**User's Choice**: [The option letter user selected, or their custom answer]

**Resolution**: [How this clarification was applied to the analysis document]

**Applied To**: [Section in requirements.md that was updated]

---

## Summary

| # | Question | Category | Choice | Applied To |
|---|----------|----------|--------|------------|
| 1 | [Brief question summary] | [Category] | [A/B/C/Custom] | [Section in requirements.md] |
| 2 | [Brief question summary] | [Category] | [A/B/C/Custom] | [Section in requirements.md] |

---

## Coverage Summary

| Category | Status | Notes |
|----------|--------|-------|
| **Functional Scope** | Resolved / Clear / Deferred | [Brief note] |
| **Domain & Data** | Resolved / Clear / Deferred | [Brief note] |
| **Interaction & UX** | Resolved / Clear / Deferred | [Brief note] |
| **Non-Functional** | Resolved / Clear / Deferred | [Brief note] |
| **Integration** | Resolved / Clear / Deferred | [Brief note] |
| **Edge Cases** | Resolved / Clear / Deferred | [Brief note] |
| **Terminology** | Resolved / Clear / Deferred | [Brief note] |

**Status Legend**:
- **Resolved**: Was ambiguous, now clarified through Q&A
- **Clear**: Already sufficient in analysis document
- **Deferred**: Non-blocking, can resolve during implementation

---

## Next Steps Available

**What would you like to do next?**

| Option | Action | When to Choose |
|--------|--------|----------------|
| **A** | **Clarify** (Continue) | Deferred items need resolution, or new ambiguities found |
| **B** | **Analyze** (Re-analyze) | Significant changes require updating analysis document |
| **C** | **Validate** (Proceed) | All critical ambiguities resolved, ready for validation |

---
**Reply with A, B, or C to proceed.**
```
