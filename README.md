# InKCre Agent Skills

Organization-level discovery and reusable execution assets for InKCre Agents.

## Scope

This repository owns an Agent asset only when at least two repositories need
the same executable guidance and keeping separate copies would create drift.
Repository-local `AGENTS.md`, commands, architecture, deployment behavior, and
product-package skills remain with their code.

Current external owners are recorded in [`catalog.json`](catalog.json):

- `edit-svc-shared-docs` stays in `InKCre/docs` because its workflow and check
  script operate on that Hub.
- `ui-web` stays in the published `@inkcre/ui-web` package because it describes
  that package's components and ships with the product artifact.

## Consumption

Use the smallest mechanism supported by the consumer:

1. load an installed or package-delivered skill directly;
2. add a thin local discovery wrapper that points to the canonical owner;
3. add a versioned shared mount only after at least two consumers prove that a
   wrapper is insufficient.

There is no synchronization bot or cross-repository writer. Consumers update
their own references through ordinary reviewed changes.

## Layout

```text
skills/                  canonical skills owned here, when admitted
templates/AGENTS.root.md starting point for a new repository
catalog.json             owner and consumer discovery metadata
tasks/                   active task packets
```
