# Requirements Traceability Matrix (RTM) Template

**Purpose**: Track requirements through design, implementation, and testing phases
**Output File**: `.kiro/specs/[feature-name]/rtm.md`

---

## 1. Document Information

| Field | Value |
|-------|-------|
| **Project** | [Project Name] |
| **Version** | v1.0.0 |
| **Last Updated** | [Date] |
| **Owner** | [Name] |
| **Status** | Draft / Under Review / Approved |

---

## 2. Traceability Matrix

### 2.1 Forward Traceability (Requirements → Implementation)

| Req ID | Requirement | Priority | Design Ref | Code Ref | Test Case | Status |
|--------|-------------|----------|------------|----------|-----------|--------|
| REQ-001 | [Brief description] | Must | DES-001 | `src/module/file.ts:L50` | TC-001, TC-002 | Implemented |
| REQ-002 | [Brief description] | Must | DES-002 | `src/auth/login.ts:L120` | TC-003 | In Progress |
| REQ-003 | [Brief description] | Should | DES-003 | - | TC-004 | Not Started |

### 2.2 Test Traceability

| Test Case ID | Test Name | Requirements Covered | Type | Status |
|--------------|-----------|---------------------|------|--------|
| TC-001 | User registration success | REQ-001 | Functional | Pass |
| TC-002 | User registration validation | REQ-001 | Functional | Pass |
| TC-003 | Login authentication | REQ-002, NFR-002 | Security | Pass |

---

## 3. Coverage Summary

### 3.1 Requirements Coverage

| Category | Total | Designed | Implemented | Tested | Verified |
|----------|-------|----------|-------------|--------|----------|
| Functional (REQ) | 25 | 25 (100%) | 20 (80%) | 18 (72%) | 15 (60%) |
| Non-Functional (NFR) | 10 | 10 (100%) | 8 (80%) | 6 (60%) | 5 (50%) |
| **Total** | **35** | **35 (100%)** | **28 (80%)** | **24 (69%)** | **20 (57%)** |

---

## 4. Traceability Links

### 4.1 Link Types

| Link Type | From | To | Description |
|-----------|------|-----|-------------|
| **Derives** | Business Req | Functional Req | Business requirement decomposed |
| **Implements** | Requirement | Code | Code implements requirement |
| **Verifies** | Test Case | Requirement | Test verifies requirement |
| **Depends** | Requirement | Requirement | Dependency relationship |

---

## 5. Change Impact Analysis

### 5.1 Change Log

| Date | Req ID | Change Type | Description | Impact | Updated By |
|------|--------|-------------|-------------|--------|------------|
| [Date] | REQ-005 | Modified | Updated acceptance criteria | Low | [Name] |
| [Date] | REQ-012 | Added | New requirement from clarification | Medium | [Name] |

---

## 6. Verification Status

### 6.1 Sign-off Status

| Stakeholder | Role | Requirements Verified | Sign-off Date | Status |
|-------------|------|----------------------|---------------|--------|
| [Name] | Product Owner | All Functional | [Date] | Approved |
| [Name] | Tech Lead | All Technical | [Date] | Approved |
| [Name] | QA Lead | All Test Coverage | [Date] | Pending |

---

## Appendix: Status Definitions

| Status | Definition |
|--------|------------|
| **Not Started** | Work has not begun |
| **In Progress** | Currently being worked on |
| **Implemented** | Code complete, awaiting test |
| **Tested** | Test cases executed |
| **Verified** | Stakeholder verified and approved |
| **Blocked** | Cannot proceed due to dependency |
| **Deferred** | Moved to future release |
