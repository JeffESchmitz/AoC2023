# Adopting the learning guides from 2024 and 2025

Reviewed on November 12, 2026: **45 project Markdown files**, comprising 21 in AoC2024 and 24 in AoC2025. The review includes hidden project documentation such as `.vscode/USAGE.md`; generated dependency/build directories and Git internals are excluded.

Six shared guides are byte-for-byte identical across the two repositories. Each was read once as shared content, with both copies compared. The learning trackers also share passages; unchanged passages were compared against the already-read 2024 text, and every changed or new 2025 passage was read. All day-specific notes were read. Sources were left unchanged.

The source revisions are:

- AoC2024: `d841885835509e5379f13d5c0c05403432362d34`.
- AoC2025: `e277e770319fcdd342f178e44cc37f06ae644c58`.

## What belongs in AoC2023

The existing repository already had concise adaptations of the framework, teacher, prompts, checklist, and AoCTools reference. This pass expands those guides and adds navigation, a quick start, practice exercises, a debugging guide, and a reusable learning-note template.

The [documentation map](README.md) is the entry point. Shared concepts have one primary home and links from related pages. This is a curated adaptation; it does not synchronize or bulk-copy the historical documents.

Historical answers, full walkthroughs, performance tables, and completion claims remain at source. They are useful optional references, but do not establish what was solved or verified in 2023. The new practice exercises use toy examples rather than future 2023 solutions. Existing 2023 day notes and progress are preserved.

## Corrections and qualifications

Several source passages disagree with later notes or make stronger claims than their evidence supports. The adopted guidance handles these as follows:

- Swift integer division truncates toward zero, rather than always taking the mathematical floor.
- Set membership is expected constant time; a whole set intersection still depends on the sizes involved.
- “First” does not establish a monotone predicate, and “minimum” does not establish an equal-cost shortest-path model. State the assumptions before choosing an algorithm.
- A greedy construction may find a maximal result without proving a maximum. Keep the proof requirement rather than copying a general correctness claim.
- Path compression mutates state, but that alone does not require a reference type; a mutating value-type implementation is also possible.
- Random checks are useful evidence, not proof of complete coverage. An accepted personal answer does not resolve a contradictory public example.
- Historical loop, functional-pipeline, and lazy-sequence timings do not establish universal performance rules. Compare matching build modes and inputs, and include initialization when work moves outside a part's timer.
- Parser combinators can improve composition and model types, but input correctness is still checked at runtime. AoC2023 does not directly declare every package imported in the older examples.
- Claimed time savings, learning multipliers, mastery-by-day schedules, and promised stars are omitted. Track demonstrated understanding and checks actually run.

The shared agent architecture becomes review perspectives for one assistant. It does not install agents, authorize delegation, or change the repository's Git policy. Setup commands were checked against AoC2023's manifest, scripts, runner, tests, and locally resolved AoCTools manifest; no dependencies were changed.

## Source inventory

Links below open the original historical documents, which **contain puzzle spoilers for their respective years**. They are provenance and optional references, not required startup reading.

### AoC2024: 21 files

| Source | Treatment |
| --- | --- |
| [.vscode/USAGE.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/.vscode/USAGE.md) | Review editor guidance; omit historical extension-install claims and missing tasks. |
| [AGENT-SYSTEM-MAP.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/AGENT-SYSTEM-MAP.md) | Adapt navigation into docs/README.md. |
| [AOC-AGENT-PROMPTS.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/AOC-AGENT-PROMPTS.md) | Expand docs/prompts.md with focused requests. |
| [AOC-AGENT-QUICK-START.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/AOC-AGENT-QUICK-START.md) | Adapt workflow into QUICKSTART.md and daily-checklist.md. |
| [AOC-AGENT-STACK.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/AOC-AGENT-STACK.md) | Use review perspectives in docs/prompts.md and problem-solving.md with one assistant. |
| [AOC-AGENT-SYSTEM-README.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/AOC-AGENT-SYSTEM-README.md) | Adapt help levels and session flow into docs/README.md; omit outcome promises. |
| [AOC-PUZZLE-TEACHER.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/AOC-PUZZLE-TEACHER.md) | Expand docs/puzzle-teacher.md and practice.md. |
| [AoC-2024-Learnings.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/AoC-2024-Learnings.md) | Adapt decomposition, state, debugging, and practice lessons; retain historical solutions at source. |
| [CLAUDE.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/CLAUDE.md) | Review package conventions; retain AoC2023 instructions and Git policy. |
| [README.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/README.md) | Use navigation ideas; retain 2023 progress and project identity. |
| [Sources/Day17/Day17-learnings.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/Sources/Day17/Day17-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day18/Day18-learnings.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/Sources/Day18/Day18-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day19/Day19-learnings.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/Sources/Day19/Day19-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day20/Day20-learnings.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/Sources/Day20/Day20-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day21/Day21-Analysis.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/Sources/Day21/Day21-Analysis.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day21/Day21-learnings.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/Sources/Day21/Day21-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day22/Day22-learnings.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/Sources/Day22/Day22-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day23/Day23-learnings.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/Sources/Day23/Day23-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day24/Day24-learnings.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/Sources/Day24/Day24-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day24/Day24-summary.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/Sources/Day24/Day24-summary.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day25/Day25-learnings.md](https://github.com/JeffESchmitz/AoC2024/blob/d841885835509e5379f13d5c0c05403432362d34/Sources/Day25/Day25-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |

### AoC2025: 24 files

| Source | Treatment |
| --- | --- |
| [AGENT-SYSTEM-MAP.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/AGENT-SYSTEM-MAP.md) | Adapt navigation into docs/README.md. |
| [AOC-AGENT-PROMPTS.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/AOC-AGENT-PROMPTS.md) | Expand docs/prompts.md with focused requests. |
| [AOC-AGENT-QUICK-START.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/AOC-AGENT-QUICK-START.md) | Adapt workflow into QUICKSTART.md and daily-checklist.md. |
| [AOC-AGENT-STACK.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/AOC-AGENT-STACK.md) | Use review perspectives in docs/prompts.md and problem-solving.md with one assistant. |
| [AOC-AGENT-SYSTEM-README.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/AOC-AGENT-SYSTEM-README.md) | Adapt help levels and session flow into docs/README.md; omit outcome promises. |
| [AOC-PUZZLE-TEACHER.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/AOC-PUZZLE-TEACHER.md) | Expand docs/puzzle-teacher.md and practice.md. |
| [AoCTools-Cheatsheet.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/AoCTools-Cheatsheet.md) | Retain the existing version-checked 2023 adaptation. |
| [CHECKLIST.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/CHECKLIST.md) | Adapt setup/checklist structure with actual 2023 commands. |
| [CLAUDE.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/CLAUDE.md) | Review package conventions; retain AoC2023 instructions and Git policy. |
| [LICENSE.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/LICENSE.md) | Review attribution; preserve the existing 2023 license unchanged. |
| [QUICKSTART.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/QUICKSTART.md) | Adapt as root QUICKSTART.md with actual 2023 paths and test behavior. |
| [README.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/README.md) | Use navigation ideas; retain 2023 progress and project identity. |
| [Sources/Day01-learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/Sources/Day01-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day02-learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/Sources/Day02-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day03-learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/Sources/Day03-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day04-learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/Sources/Day04-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day05-learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/Sources/Day05-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day06-learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/Sources/Day06-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day07-learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/Sources/Day07-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day08-learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/Sources/Day08-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day09-learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/Sources/Day09-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day10-learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/Sources/Day10-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [Sources/Day11-learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/Sources/Day11-learnings.md) | Read for reusable reasoning, debugging, and note structure; keep the worked solution at source. |
| [TwelveDaysOfCode-2025-Learnings.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/TwelveDaysOfCode-2025-Learnings.md) | Adapt learning, counting, reuse, and measurement lessons; retain historical solutions at source. |

## Maintaining the adaptation

Use [AGENTS.md](../AGENTS.md) or [CLAUDE.md](../CLAUDE.md) for current working instructions. Use the actual resolved dependency for APIs and toolchain requirements. Add new day notes only for actual learning, using [TEMPLATE.md](learnings/TEMPLATE.md) if helpful. Keep human contributor attribution and the repository license intact.

When changing these guides later, check local links and the documented command behavior. Documentation-only validation does not establish that any unfinished puzzle works.
