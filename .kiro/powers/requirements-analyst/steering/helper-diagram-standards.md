---
inclusion: agent
---

# Diagram and Documentation Standards

This document defines the mandatory standards for UML diagrams and documentation format in requirements analysis.

---

## Expression Priority (FUNDAMENTAL RULE)

**ALWAYS follow this priority when expressing requirements:**

```
1st Priority: Diagram (Visual representation)
    └── 2nd Priority: UML Diagram (Standard notation)
        └── 3rd Priority: Mermaid Syntax (Generation method)
```

### Priority Matrix

| Expression Method | Priority | Usage |
|-------------------|----------|-------|
| **UML Diagram (Mermaid)** | 🥇 Highest | Default choice - ALWAYS use first |
| **Other Diagrams (Mermaid)** | 🥈 Second | When UML type not applicable |
| **Table + Diagram** | 🥉 Third | Supplementary details only |
| **Text/Table only** | ❌ Avoid | Only when diagram is impossible |

### UML Diagram Selection Guide

| Requirement Type | UML Diagram | Mermaid Type |
|------------------|-------------|--------------|
| System interactions | Use Case Diagram | `graph TB` with actors |
| **Process flow** | **Activity Diagram** | **`stateDiagram-v2`** |
| Time-based interactions | Sequence Diagram | `sequenceDiagram` |
| **Domain model** | **Class Diagram** | **`classDiagram`** |
| **Data model** | **ER Diagram** | **`erDiagram`** |
| State transitions | State Diagram | `stateDiagram-v2` |
| Component structure | Component Diagram | `graph TB` with subgraphs |

> ⚠️ **Class Diagram vs ER Diagram**: Do NOT mix their syntax! See sections 4 and 5 for correct usage.

---

## ⛔ Mermaid Syntax Constraints (MANDATORY)

**CRITICAL**: Mermaid has strict syntax rules. Violating these will cause parse errors.

### Special Characters in Node Text

| Character | Problem | Solution |
|-----------|---------|----------|
| `()` | Parsed as node shape | Use quotes: `["text (note)"]` |
| `[]` | Parsed as node shape | Use quotes: `["text [note]"]` |
| `{}` | Parsed as node shape | Use quotes: `["text {note}"]` |
| `<>` | Parsed as HTML/link | Use quotes or escape: `["text <note>"]` |
| `/` | May cause issues | Use quotes: `["A/B"]` |

### Verification Checklist

Before generating ANY Mermaid diagram, verify:
- [ ] All node text with special characters `()[]{}/<>` wrapped in quotes `""`
- [ ] No unescaped parentheses in node labels
- [ ] No unescaped brackets in node labels
- [ ] Line breaks `<br/>` only used inside quoted strings

---

## 1. UML Use Case Diagram Standards

### MANDATORY Rules

- **Actors**: Must use stick figure icon (not rectangles)
- **Use Cases**: Must use ellipse shape
- **System Boundary**: Must use dashed rectangle
- **Relationships**: Must use correct stereotypes
  - `<<include>>`: Mandatory dependency (always executed)
  - `<<extend>>`: Optional extension (conditionally executed)
  - `<<generalize>>`: Inheritance relationship

---

## 2. Business Process Standards (Activity Diagram)

### MANDATORY Rules

- **Core user activity flows MUST use UML Activity Diagram**
- **Tables alone are NOT sufficient** - must have accompanying diagram
- **Parallel processing MUST be explicitly marked** using fork/join or `par` syntax
- **Decision points MUST use diamond shape**
- **Start/End MUST use standard notation** (filled circle / bull's eye)

---

## 3. Use Case Main Flow Standards (Sequence Diagram)

### MANDATORY Rules

- **Use Case main flows MUST use Sequence Diagram**
- **Actor-System tables alone are NOT sufficient**
- **All key participants MUST be included**: User, UI, System, Agent, Database, External Services
- **Parallel execution MUST use `par` syntax**
- **Alternative flows use `alt` syntax**
- **Optional flows use `opt` syntax**

---

## 4. Class Diagram Standards (Domain Model)

### When to Use

- **Domain modeling**: Core business entities and relationships
- **Data structure design**: Object attributes and methods
- **Inheritance hierarchies**: Class specialization

### MANDATORY Rules

- Use `classDiagram` syntax for object relationships
- Define attributes with visibility (`+` public, `-` private, `#` protected)
- Use correct relationship notation

---

## 5. ER Diagram Standards (Data Model)

### When to Use

- **Database design**: Entity relationships for persistence
- **Data modeling**: Tables and foreign key relationships
- **System integration**: Data exchange structures

### MANDATORY Rules

- Use `erDiagram` syntax for entity relationships
- Define attributes with data types
- Use correct cardinality notation

### ⚠️ DO NOT MIX SYNTAX

```
❌ WRONG (mixing syntax):
classDiagram
    A ||--o{ B

❌ WRONG (mixing syntax):
erDiagram
    A <|-- B

✅ CORRECT:
Use classDiagram for OOP relationships
Use erDiagram for database relationships
```

---

## 6. Document Format Standards

### MANDATORY Rules

- **Each analysis item MUST be on a separate line**
- **Key terms MUST be bold**
- **Consistent indentation** throughout document
- **Clear visual hierarchy** with proper heading levels

---

## 7. Diagram Quality Standards

### MANDATORY Rules

1. **All UML diagrams MUST follow standard syntax**
2. **Use Mermaid syntax for all diagrams**
3. **Apply appropriate styling and color coding**:
   - Primary elements: `fill:#e1f5fe` (light blue)
   - Secondary elements: `fill:#f3e5f5` (light purple)
   - Warning/attention: `fill:#fff3e0` (light orange)
   - Success/completion: `fill:#e8f5e9` (light green)
   - Error/critical: `fill:#ffebee` (light red)

4. **Complex processes MUST be decomposed** into multiple diagrams
5. **Each diagram MUST have a clear title**
