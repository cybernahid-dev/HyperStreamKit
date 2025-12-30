# Release Process

This document describes how releases of **HyperStreamKit** are planned,
prepared, and published.

Developed and maintained by **cybernahid-dev**.

---

## 🎯 Release Goals

Each release aims to be:

- Stable
- Well-documented
- Backward-compatible (within MAJOR versions)
- Production-ready

---

## 🔢 Release Types

### PATCH Release (x.y.Z)
- Bug fixes
- Performance improvements
- No API changes

### MINOR Release (x.Y.z)
- New features
- Backward-compatible API additions
- Deprecations (if any)

### MAJOR Release (X.y.z)
- Breaking API changes
- Architectural shifts
- Migration required

---

## 🧪 Pre-Release Checklist

Before publishing a release:

- All tests pass
- Build succeeds
- CHANGELOG.md updated
- API compatibility reviewed
- Documentation updated
- Version numbers bumped

---

## 🏷️ Version Tagging

Releases are tagged using Git tags:

v1.2.0 v1.2.1 

---

## 📦 Publishing

Each release includes:

- GitHub Release page
- Release notes
- Linked CHANGELOG section
- Source code snapshot

Future releases may include:
- Maven Central artifacts
- Checksums and signatures

---

## 🚨 Hotfix Policy

Critical issues may trigger an immediate PATCH release.

Hotfix releases prioritize stability and minimal change.

---

## 📝 Release Notes

Release notes should include:

- Summary of changes
- Added features
- Fixed issues
- Migration notes (if required)

---

## 🏁 Final Note

A good release is not just code—it is trust.

HyperStreamKit releases aim to earn that trust every time.

— **cybernahid-dev**