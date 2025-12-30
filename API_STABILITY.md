# API Stability Policy

This document defines the API stability guarantees for **HyperStreamKit**.

The goal of this policy is to provide clarity and confidence for developers
building production applications on top of this SDK.

Developed and maintained by **cybernahid-dev**.

---

## 🎯 Stability Goals

HyperStreamKit aims to:

- Minimize breaking changes
- Clearly communicate API maturity
- Follow Semantic Versioning strictly
- Provide migration paths when changes are unavoidable

---

## 🔢 Versioning Model

HyperStreamKit follows **Semantic Versioning (SemVer)**:

MAJOR.MINOR.PATCH

- **MAJOR** — Breaking API changes
- **MINOR** — Backward-compatible feature additions
- **PATCH** — Backward-compatible bug fixes

---

## 🧪 API Maturity Levels

Public APIs fall into the following categories:

### 🟢 Stable
- Fully supported
- Backward compatibility guaranteed within the same MAJOR version
- Safe for production use

### 🟡 Experimental
- May change without notice
- Not covered by stability guarantees
- Clearly documented as experimental

### 🔴 Internal
- Not part of the public API
- May change or be removed at any time
- Not intended for external use

---

## 📦 Public API Surface

Only classes and interfaces under:

com.hyperstreamkit.sdk.api 

are considered **public APIs**.

Other packages are treated as internal implementation details.

---

## ⚠️ Breaking Changes

Breaking changes may include:

- Removing or renaming public classes or methods
- Changing method signatures
- Altering expected behavior of stable APIs

Breaking changes will only be introduced in a **MAJOR** release.

---

## 🔄 Deprecation Policy

- APIs scheduled for removal will be marked as **@Deprecated**
- Deprecation notices will include migration guidance
- Deprecated APIs will remain for at least one MINOR release cycle

---

## 📢 Communication

API changes will be communicated via:

- CHANGELOG.md
- GitHub Releases
- Documentation updates

---

## 🏁 Final Note

API stability is a promise to developers.

HyperStreamKit takes this promise seriously.

— **cybernahid-dev**