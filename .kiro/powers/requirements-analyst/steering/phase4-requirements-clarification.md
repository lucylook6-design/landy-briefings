---
inclusion: agent
---

# Phase 4: Requirements Clarification

**Phase Objective**: Eliminate ambiguity through targeted questioning and document all clarification decisions.
**Time Allocation**: 15% of total effort
**Your Role**: Professional Requirements Analyst

---

## Quick Reference

| Aspect | Guideline |
|--------|-----------|
| Goal | Clarify ALL critical ambiguities (no fixed limit) |
| Question Format | Multiple-choice (2-4 options) or Short phrase |
| Delivery | ONE question at a time, wait for answer |
| Output Files | `clarification.md` (log) + update Phase 3 outputs |

### ⚠️ CRITICAL: Update Files After EACH Answer

**After user answers EACH question, you MUST IMMEDIATELY:**
1. Write Q&A to `clarification.md`
2. Check and update ALL affected Phase 3 outputs

**DO NOT** ask next question until all affected files are updated.

---

## Output

**File**: `.kiro/specs/[feature-name]/clarification.md`

> **Dependencies**: See `POWER.md` → File Dependencies for required template and helper files.

---

## Pre-Check (GATE CHECK)

**MUST pass this check before starting**:

- [ ] **Phase 3 completed?** Verify `requirements.md` exists with user stories and use cases
- [ ] **Ambiguities identified?** List requirements with `[NEEDS CLARIFICATION]` markers
- [ ] **Stakeholder available?** User can answer clarification questions

**If ANY check fails**: STOP. Return to Phase 3 or wait for stakeholder availability.

---

## Ambiguity Taxonomy (MUST SCAN)

Perform a structured ambiguity scan using this taxonomy:

### 1. Functional Scope & Behavior

| Check Point | Questions to Consider |
|-------------|----------------------|
| Core user goals | What defines success for the user? |
| Success criteria | How do we measure if the feature works? |
| Out-of-scope | What is explicitly NOT included? |
| User roles | Are all personas clearly differentiated? |

### 2. Domain & Data Model

| Check Point | Questions to Consider |
|-------------|----------------------|
| Entities & attributes | Are all data fields defined? |
| Identity & uniqueness | What makes each record unique? |
| Lifecycle/state | What states can entities transition through? |
| Data volume | What scale assumptions are we making? |

### 3. Interaction & UX Flow

| Check Point | Questions to Consider |
|-------------|----------------------|
| User journeys | Are critical paths fully documented? |
| Error states | What happens when things go wrong? |
| Empty states | What does the user see with no data? |
| Loading states | How is progress communicated? |

### 4. Non-Functional Quality Attributes

| Check Point | Questions to Consider |
|-------------|----------------------|
| Performance | Latency and throughput targets? |
| Scalability | Horizontal/vertical limits? |
| Reliability | Uptime and recovery requirements? |
| Security | Authentication and authorization rules? |
| Compliance | Regulatory constraints? |

### 5. Integration & External Dependencies

| Check Point | Questions to Consider |
|-------------|----------------------|
| External APIs | Which services? Failure modes? |
| Data formats | Import/export specifications? |
| Protocol versions | API versioning strategy? |

### 6. Edge Cases & Failure Handling

| Check Point | Questions to Consider |
|-------------|----------------------|
| Negative scenarios | What if user provides invalid input? |
| Rate limiting | How to handle abuse? |
| Concurrent edits | Conflict resolution strategy? |

### 7. Terminology & Consistency

| Check Point | Questions to Consider |
|-------------|----------------------|
| Glossary terms | Are key terms defined? |
| Synonyms | Are deprecated terms identified? |

---

## Execution Flow

### Step 1: Load and Analyze Specification

Read `requirements.md` and scan for ambiguities using the taxonomy above.

### Step 2: Generate Prioritized Questions

**Question Constraints**:
- **Answerable**: Multiple-choice (2-4 options) OR Short phrase (<=5 words)
- **Impactful**: Must materially impact architecture, data model, UX, or compliance
- **Balanced**: Cover different categories from the taxonomy
- **Non-trivial**: Exclude already-answered or obvious questions

### Step 3: Sequential Questioning (ONE AT A TIME)

**CRITICAL**: Present EXACTLY ONE question at a time. Wait for answer before next question.

#### Multiple-Choice Question Format

```markdown
**Question [N/Total]**: [Category]

[Complete question text]

**Recommended**: Option [X] - [Brief reason for recommendation]

**Options**:

> **A** - [Option A description]

> **B** - [Option B description]

> **C** - [Option C description]

> **Other** - Provide your own answer (<=5 words)

---
Reply with option letter (e.g., "A"), or "yes" to accept recommendation, or enter your custom answer.
```

### Step 4: Record Answers (MANDATORY)

**CRITICAL**: After EACH question is answered, you MUST **IMMEDIATELY** perform ALL of the following:

1. **Record to clarification log** (`clarification.md`)
2. **Update ALL affected Phase 3 outputs**
3. **Verify both files saved** before proceeding to next question

### Step 5: Stop Conditions

Stop asking questions when ANY of these apply:
- All critical ambiguities resolved
- User signals completion ("done", "enough", "no more")
- Remaining ambiguities are non-blocking (can defer to implementation)

---

## Exit Criteria (NON-NEGOTIABLE)

| Criteria | Standard | Verification | Status |
|----------|----------|--------------|--------|
| Clarification Log | `clarification.md` created | File exists | [ ] |
| All Q&A Recorded | Complete details for each question | Review log | [ ] |
| Analysis Updated | Clarifications applied to `requirements.md` | Cross-reference | [ ] |
| No Contradictions | Consistent statements | Review both files | [ ] |
| Critical Ambiguities | All critical ambiguities resolved | Review coverage | [ ] |

---

## Next Step (MUST PROMPT USER)

**CRITICAL**: After EVERY clarification session, you MUST present the following options to the user:

| Option | Action | Description |
|--------|--------|-------------|
| **A** | **Clarify** | Continue clarification - resolve deferred items or new ambiguities |
| **B** | **Analyze** | Return to Analysis - update requirements.md with clarification results |
| **C** | **Validate** | Proceed to Validation - verify requirements through 5 dimensions |
