---
inclusion: agent
description: "Reverse engineering workflow - extract requirements from existing codebase"
keywords: ["reverse", "逆向", "extract", "codebase", "existing", "legacy", "现有代码", "提取需求"]
---

# Reverse Command

**Command Objective**: Reverse engineer an existing codebase to extract and document requirements, enabling requirements analysis for legacy or undocumented projects.

**Your Role**: Professional Requirements Analyst with Code Analysis Skills

---

## Purpose

Extract requirements from existing projects by:
- **Analyzing codebase**: Understand technology stack, architecture, and patterns
- **Extracting product context**: Identify purpose, users, and business logic
- **Documenting features**: Map functionality and user-facing capabilities
- **Synthesizing requirements**: Convert code analysis into structured requirements

## When to Use

- Onboarding to an existing project without documentation
- Adopting requirements methodology for legacy codebases
- Creating requirements documentation for undocumented projects
- Understanding unfamiliar codebases quickly
- Preparing for major refactoring or modernization
- Generating requirements baseline before enhancement projects

## Prerequisites

**Required**:
- An existing codebase to analyze
- Access to source files, configuration files, and package manifests

**Helpful but optional**:
- Existing README or documentation
- Git history for context
- Running application for behavior observation
- Access to stakeholders who understand the system

---

## Quick Reference

| Step | Focus | Output | Critical? |
|------|-------|--------|-----------|
| 1. Project Discovery | Scan codebase structure | Project overview | ✅ Yes |
| 2. Tech Stack Analysis | Identify technologies | Technology inventory | ✅ Yes |
| 3. Architecture Analysis | Map structure & patterns | Architecture summary | ✅ Yes |
| 4. Product Context | Understand purpose & users | Product context summary | ✅ Yes |
| 5. Feature Extraction | Identify business features | Feature inventory | ✅ Yes |
| 6. Requirements Synthesis | Convert to requirements | Requirements list | ✅ Yes |
| 7. User Review | Validate with user | Confirmed requirements | ✅ Yes |

---

## Output

**File**: `.kiro/specs/[spec-name]/reverse.md`

> After completion, user can proceed to Phase 2 (Sort) or Phase 3 (Analysis) with the extracted requirements.

---

## Pre-Check (GATE CHECK)

**MUST satisfy these conditions before starting**:

| Check Item | Requirement | Status |
|-----------|-------------|--------|
| Codebase Access | MUST have read access to source code | [ ] |
| Project Scope | MUST identify analysis boundaries | [ ] |
| User Available | MUST have user available to validate findings | [ ] |

**If check fails**: STOP. Resolve access issues before proceeding.

---

## Operating Constraints

**NON-DESTRUCTIVE**: This workflow only reads and analyzes; it generates new files but does NOT modify existing code.

**USER CONFIRMATION**: All extracted requirements require user review and approval.

**ITERATIVE REFINEMENT**: Generated requirements are drafts; expect multiple rounds of refinement with user input.

**EVIDENCE-BASED**: Every requirement must trace back to specific code evidence.

**MERMAID FIRST (MANDATORY)**: When documenting flows, processes, sequences, or relationships:
- **MUST** use Mermaid syntax as the primary representation
- **NEVER** use plain text descriptions as a substitute for diagrams
- Supported diagram types:
  - `sequenceDiagram` - For API calls, service interactions, user journeys
  - `flowchart` - For business logic, decision trees, process flows
  - `erDiagram` - For data models and entity relationships
  - `classDiagram` - For component structures and dependencies
- Plain text descriptions are supplementary only, not replacements

---

## Execution Flow

### Step 1: Project Discovery

Scan the project to gather initial context:

**File System Analysis**:
- Identify root directory and project boundaries
- Detect monorepo vs single project structure
- Find configuration files (package.json, pyproject.toml, Cargo.toml, etc.)
- Locate source directories and entry points

**Version Control Analysis** (if available):
- Check git history for project age and activity
- Identify main contributors
- Review recent changes for active areas

**Output**: Project overview summary for user confirmation

### Step 2: Technology Stack Analysis

Analyze dependencies and configuration to determine the tech stack.

### Step 3: Architecture Analysis

Understand the project's architecture and patterns.

### Step 4: Product Context Extraction

Understand what the product does and who it serves.

### Step 5: Feature Extraction

Extract business features from code analysis.

### Step 6: Requirements Synthesis

Convert extracted features into requirements format.

### Step 7: User Review and Validation

Present findings for user validation.

---

## Exit Criteria

| Exit Item | Qualification Standard | Status |
|-----------|----------------------|--------|
| **Project Overview** | Project scope and tech stack documented | [ ] |
| **Architecture Diagram** | At least one Mermaid diagram created | [ ] |
| **Feature Inventory** | All major features identified with evidence | [ ] |
| **Requirements List** | Requirements extracted (≥10 items for typical project) | [ ] |
| **Technical Debt** | TODO/FIXME/deprecated items catalogued | [ ] |
| **User Validation** | User has reviewed and confirmed findings | [ ] |

---

## Next Steps

After completing this command:

```
Reverse engineering complete.

Next, you can:
1. Run **Phase 2 (Sort)** to prioritize the extracted requirements
2. Run **Phase 3 (Analysis)** to analyze into user stories
3. Review and refine the extracted requirements manually
4. Share findings with stakeholders for validation
```
