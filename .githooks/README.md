# Input guard hooks

Advent of Code asks people not to share their puzzle input, so none of it may reach GitHub. These hooks block a commit or push that would publish it.

## Turn them on

Git never enables hooks from a clone automatically, so run this once in every new clone:

```sh
./setup
```

It sets `git config core.hooksPath .githooks` and checks that the input files are gitignored.

## What they check

| Hook | Checks | Blocks when |
| --- | --- | --- |
| `pre-commit` | Staged changes | An input file (`Sources/Inputs/*Input.swift`) or `.aoc-session` is staged, even with `git add -f` or as a rename |
| `pre-push` | Every commit the remote doesn't have yet | Same, for any commit being pushed, including commits made with `--no-verify` |

Both hooks also block any added line containing 16 consecutive characters from one of your local input lines, or a whole input line of 8–15 characters. They ignore pieces made of fewer than 5 different characters, such as `......#.........`. They also block when they can't read the changes, rather than letting them through. The matching code is in `aoc-input-scan`.

The hooks compare against the input files on this machine, so download a day’s input with `./input.sh <day>` before writing its tests.

## When a hook blocks

1. Read the reported text and the input file it matches.
2. If it’s copied input, replace it with made-up data. Never get past the hook with `--no-verify`.
3. If it’s public example text from the puzzle page that happens to overlap your input, a person may add the **whole example line** to `.git/info/aoc-allowlist`, one line per entry. That file is deliberately local: a committed allowlist would let input slip past the check.

## Backstop on GitHub

The `Input guard` workflow (`.github/workflows/input-guard.yml`) runs on every push and pull request. It fails if an input or session file is tracked, or appears anywhere in the history, or if `.gitignore` stops ignoring them. It has no copy of your input, so it can’t catch copied fragments. It also runs after the push, so it alerts you rather than preventing the leak.
