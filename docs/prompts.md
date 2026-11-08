# Reusable puzzle prompts

Replace the brackets with the current day, part, and your own observations. These prompts work with one assistant in Claude Code or Codex; they do not require an agent framework.

## Understand without spoilers

> I'm working on AoC 2023 Day [N], Part [P]. Here is the puzzle context and my interpretation: [context]. Use docs/problem-solving.md. Help me identify the goal, state, constraints, and example behavior. Ask one useful question at a time; don't give me the algorithm or implementation yet.

## Compare approaches

> My proposed approach is [approach], with constraints [sizes/rules]. Compare it with one or two alternatives. Explain correctness assumptions and time/space costs. Don't implement anything yet. Relate it to a prior learning only if that connection is useful.

## Find edge cases

> Here is my representation and invariant: [details]. Suggest small adversarial inputs and explain what each tests. Distinguish valid puzzle inputs from malformed input. Don't give me a complete solution.

## Debug my reasoning

> On [small input], I expect [result] but get [result]. Here is my trace/code: [details]. Help locate the first divergent state. Start with a hint; don't replace my implementation.

## Implement when requested

> I understand and choose [approach]. Implement only AoC 2023 Day [N], Part [P] and focused tests using the existing package conventions. Preserve other days. Explain the key choices and report actual test results, including skips. Do not commit or push.

## Capture the lesson

> Summarize what we actually learned today: problem cues, chosen representation, invariant, approach, complexity, failed ideas, and verified checks. Draft docs/learnings/day[NN].md in my voice. Separate verified results from open questions; do not include private puzzle input or claim unearned stars. Do not commit or push.

## Provenance

Adapted from [AOC-AGENT-PROMPTS.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/AOC-AGENT-PROMPTS.md) at AoC2025 commit `e277e770319fcdd342f178e44cc37f06ae644c58`. These are curated 2023 adaptations, not synchronized copies. The original documents retain the longer worked examples and historical context.
