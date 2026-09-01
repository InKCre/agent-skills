# InKCre Agent Skills

Organization-level common instructions and reusable execution assets for
InKCre coding Agents.

## Scope

This repository owns a reusable Agent Skill only when at least two repositories
need the same executable guidance and keeping separate copies would create drift.
Repository-local `AGENTS.md`, commands, architecture, deployment behavior, and
product-package skills remain with their code.

Current external owners are recorded in [`catalog.json`](catalog.json):

- `edit-svc-shared-docs` stays in `InKCre/docs` because its workflow and check
  script operate on that Hub.
- `ui-web` stays in the published `@inkcre/ui-web` package because it describes
  that package's components and ships with the product artifact.

## Consumption

### Common instructions

Clone this repository at a reviewed commit, then install the Codex user profile:

```bash
./install.sh
./install.sh --check
```

The installer links [`global/AGENTS.md`](global/AGENTS.md) to
`~/.codex/AGENTS.md`. It refuses to replace an existing path. The instructions
therefore apply to every Codex project for that user and must remain safe outside
an InKCre checkout. Repository-specific rules stay in each repository's own
`AGENTS.md`.

Update by reviewing and checking out a newer repository commit. Roll back by
checking out the previous commit. Restart Codex after either operation.

### Skills

Portable skills under `skills/` can be inspected or installed with the standard
open Agent Skills CLI:

```bash
npx skills add InKCre/agent-skills --list
npx skills add InKCre/agent-skills --skill <name> --agent codex
npx skills add InKCre/agent-skills --skill <name> --agent codex --global
```

Project scope is the default. Use global scope only when the skill applies to
work outside one repository. In automation or another reproducible environment,
use a reviewed commit in the direct skill URL:

```bash
npx skills add https://github.com/InKCre/agent-skills/tree/<commit>/skills/<name> --agent codex
```

The repository currently has no admitted shared Skill, so `--list` reports no
skills until the first asset proves two consumers.

For an asset owned outside this repository, use the smallest mechanism supported
by the consumer:

1. load an installed or package-delivered skill directly;
2. add a thin local discovery wrapper that points to the canonical owner;
3. add a versioned shared mount when the wrapper must read the canonical asset.

There is no synchronization bot or cross-repository writer. Consumers update
their own references through ordinary reviewed changes.

## Layout

```text
global/AGENTS.md          user-scope common coding Agent instructions
skills/                  canonical skills owned here, when admitted
templates/AGENTS.root.md starting point for a new repository
catalog.json             owner and consumer discovery metadata
tasks/                   active task packets
```

The consumption split follows the useful part of
[`arcboxlabs/agent-skills`](https://github.com/arcboxlabs/agent-skills): keep
global instructions separate from portable and project-scoped skills, and make
installation idempotent and conflict-preserving. InKCre does not carry its
multi-client generation, vendored skills, checks, or Git hooks without a proven
consumer.
