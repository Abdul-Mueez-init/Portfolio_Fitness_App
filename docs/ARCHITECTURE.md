# FitForge AI Architecture

Version: 1.0

---

# Architecture Goal

Build for scalability.

Every feature should be independently maintainable.

---

# Architecture Style

Feature-first architecture.

Each feature owns its own code.

---

lib/

core/

features/

shared/

---

# Core

Contains app-wide utilities.

Examples:

Theme

Constants

Helpers

Extensions

Routing

Services

Dependency Injection

---

# Features

Each feature contains:

UI

Widgets

Models

Repository

Services (if needed)

Controllers

---

Example

features/

home/

workout/

coach/

profile/

---

# Shared

Reusable widgets.

Examples:

PrimaryButton

AppCard

LoadingIndicator

EmptyState

---

# Routing

Centralized.

No navigation logic inside widgets.

---

# State Management

Riverpod (planned)

Rules:

Business logic stays outside UI.

Widgets display state only.

---

# Repository Pattern

UI

↓

Controller

↓

Repository

↓

Data Source

↓

API / Local Database

---

# Dependency Injection

Centralized.

Avoid manually creating services everywhere.

---

# Naming Rules

Files:

snake_case.dart

Classes:

PascalCase

Variables:

camelCase

Constants:

camelCase or kConstant

---

# Widget Rules

Widgets should do one thing well.

Split large widgets.

Avoid 500-line files.

---

# Error Handling

Never ignore exceptions.

Display user-friendly messages.

Log useful debug information.

---

# Performance

Use const.

Avoid unnecessary rebuilds.

Extract widgets.

Lazy load where possible.

---

# Folder Ownership

A feature should not directly manipulate another feature's internals.

Communicate through clean interfaces.

---

# Documentation Rule

Complex decisions must be documented.