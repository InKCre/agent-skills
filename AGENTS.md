# InKCre Agent Assets

This repository owns reusable Agent execution assets that have more than one
real InKCre repository consumer.

Reason in English. Communicate with humans in Chinese.

## Ownership

- `skills/`: canonical cross-repository skills owned here.
- `templates/`: starting points for new repositories; existing repository
  instructions remain locally owned and evolve with their code.
- `catalog.json`: discovery metadata for assets owned here or intentionally
  owned by another InKCre delivery surface.
- `tasks/`: volatile task packets retained only while their parent task is active.

Do not copy product behavior, repository commands, deployment truth, or a
package consumer skill into this repository. A new shared skill requires at
least two named consumers and one canonical owner.

## Workflow

- Keep each skill self-contained and follow the Agent Skills `SKILL.md` format.
- Prefer a thin consumer discovery entry over copied skill content.
- Change an externally owned asset in its owner repository first.
- Validate JSON with `python -m json.tool catalog.json` and patches with
  `git diff --check`.
- Require explicit Human authorization before commit, push, publication, or
  external repository/settings mutation.
