# Contributing to HyperStreamKit

First of all, thank you for considering contributing to **HyperStreamKit** ❤️  
Every contribution helps make this project more powerful and future-ready.

HyperStreamKit is a next-generation Android streaming SDK designed with
performance, adaptability, and modern architecture in mind.

Developed and maintained by **cybernahid-dev**.

---

## 📌 Before You Start

Please make sure you:

- Have basic knowledge of **Android development**
- Are familiar with **Kotlin**
- Understand **Gradle (Kotlin DSL)**
- Respect open-source community guidelines

---

## 🧠 Project Philosophy

HyperStreamKit follows these core principles:

- **Performance First** – GPU-aware rendering & adaptive quality
- **Device Intelligence** – Hardware & network-aware decisions
- **Modular Architecture** – Clean separation of responsibilities
- **Future-Ready** – Designed for next-gen Android devices

Keep these principles in mind when contributing.

---

## 🗂️ Project Structure Overview


hyperstreamkit/ ├── core/        → Engine, profiling, battery & network logic ├── render/      → GPU & fallback rendering layers ├── adaptive/    → Bitrate, quality & prediction engines ├── api/         → Public SDK interfaces


Please place your changes in the correct module.

---

## 🛠️ How to Contribute

### 1️⃣ Fork the Repository
Create your own fork from the main repository.

### 2️⃣ Create a Feature Branch

git checkout -b feature/your-feature-name

or for bug fixes:

git checkout -b fix/bug-description

### 3️⃣ Follow Coding Standards
- Use **Kotlin best practices**
- Avoid unnecessary dependencies
- Write **clean, readable, and documented code**
- Prefer **composition over inheritance**

---

## 🧪 Testing Guidelines

Before submitting:

- Ensure the project builds successfully
- Test changes on **low-end and high-end devices**
- Avoid breaking public APIs
- Keep backward compatibility when possible

---

## 📝 Commit Message Format

Use clear and meaningful commit messages:

feat: add adaptive GPU quality scaler fix: resolve buffer underrun on low bandwidth refactor: improve DeviceProfiler accuracy

---

## 🚀 Pull Request Rules

When opening a Pull Request:

- Describe **what** you changed
- Explain **why** the change is needed
- Reference related issues (if any)
- Keep PRs focused and small

Incomplete or unclear PRs may be closed.

---

## ❌ What Not to Do

- Do not submit plagiarized code
- Do not add breaking changes without discussion
- Do not modify core APIs without approval
- Do not remove author credits or license headers

---

## 📜 License

By contributing, you agree that your contributions will be licensed under the
**Apache License 2.0**, the same license used by this project.

---

## 💬 Questions or Ideas?

If you have a big idea or architectural suggestion:

- Open an **Issue**
- Start a **Discussion**
- Clearly explain the problem and proposed solution

Constructive discussions are always welcome.

---

## 🙌 Final Note

HyperStreamKit aims to redefine Android streaming performance.

Your contribution — big or small — matters.

Thank you for helping build the future 🚀

— **cybernahid-dev**