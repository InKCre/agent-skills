# Bootstrap InKCre Agent Assets

- **Outcome**: establish one small discovery and ownership repository for
  genuinely shared Agent execution assets without moving repository-local or
  product-owned truth out of its delivery owner.
- **Guardrails**: no copied Spoke `AGENTS.md`, synchronization bot, custom
  registry, cross-repository write credential, or speculative shared skill.
- **Verification**: `catalog.json` parses; every catalog entry names one owner,
  a path, and a delivery mechanism; the installer passes install/check and
  conflict-preservation probes; the repository instructions and README agree
  with the catalog.
- **Current truth**: `edit-svc-shared-docs` is owned by `InKCre/docs`; `ui-web`
  is owned by the UI package. No new skill currently proves two consumers. The
  common-instruction profile has a consumer method but no adopted consumer yet.
- **Consumption**: a reviewed checkout can link common Codex instructions with
  `install.sh`; portable skills use the standard `npx skills` project or global
  installation flow. Existing repository `AGENTS.md` files remain local.
- **Reference**: the useful boundary from `arcboxlabs/agent-skills` is the split
  between user-wide instructions and portable/project skills plus an idempotent,
  conflict-preserving installer. InKCre omits unneeded vendors, hooks, checks,
  and multi-client generation.
