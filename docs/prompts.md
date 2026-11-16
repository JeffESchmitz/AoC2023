# Reusable puzzle prompts

Replace the brackets with the current day, part, and your own observations. These prompts work with one assistant in Claude Code or Codex; they do not require an agent framework.

## Understand without spoilers

> I'm working on AoC 2023 Day [N], Part [P]. Here is the puzzle context and my interpretation: [context]. Use docs/problem-solving.md. Help me identify the goal, state, constraints, and example behavior. Ask one useful question at a time; don't give me the algorithm or implementation yet.

## Compare approaches

> My proposed approach is [approach], with constraints [sizes/rules]. Compare it with one or two alternatives. Explain correctness assumptions and time/space costs. Don't implement anything yet. Relate it to a prior learning only if that connection is useful.

## Choose a representation

> I need to perform [operations] about [frequency] times. The answer counts [unique items / occurrences / paths / cost]. Help me compare representations in Swift. Ask what must remain distinct and explain the dominant operation's cost. Check Package.swift and the resolved dependency before suggesting imports. Don't change dependencies or implement the solver.

## Understand the input

> Here is a small public example and its format: [example]. Help me trace the parsed records. Check whether order, blank lines, alignment, signs, duplicates, and endpoints matter. Compare simple parsing with available helpers, and explain the clearest choice for this format. Don't silently drop malformed records or expose personal input.

## Find edge cases

> Here is my representation and invariant: [details]. Suggest small adversarial inputs and explain what each tests. Distinguish valid puzzle inputs from malformed input. Don't give me a complete solution.

## Debug my reasoning

> On [small input], I expect [result] but get [result]. Here is my trace/code: [details]. Help locate the first divergent state. Start with a hint; don't replace my implementation.

## Check understanding before coding

> Use validation mode in docs/puzzle-teacher.md. Ask one question at a time about my representation, correctness invariant, or an important boundary. Have me trace a concrete case. Explain gaps honestly, then let me decide whether to practice further or ask for direct help.

## Implement when requested

> I understand and choose [approach]. Implement only AoC 2023 Day [N], Part [P] and focused tests using the existing package conventions. Preserve other days. Explain the key choices and report actual test results, including skips. Do not commit or push.

## Review my solution

> Review only Day [N], Part [P], using the supplied rules and my code: [details]. Check correctness, state/cache completeness, boundaries, and complexity. Distinguish a demonstrated bug from a possible concern. Point to a small counterexample where possible. Don't reveal a later part or rewrite the code unless I ask.

## Investigate performance

> My solution has verified answers but takes [time] on [input size] in [debug/release]. The timer includes [scope]. Use docs/debugging.md to help identify the dominant work. Propose one change and a fair measurement, including initialization if work moves there. Don't claim a speedup until measured or assume a coding style is always faster.

## Practice one skill

> Use docs/practice.md. Give me one small exercise on [skill] using a toy example or a completed puzzle. Let me predict the output and explain the invariant before coding. Ask one question at a time, offer hints as requested, and withhold the worked solution until I ask. Finish with one variation for later recall.

## Capture the lesson

> Summarize what we actually learned today: problem cues, chosen representation, invariant, approach, complexity, failed ideas, and verified checks. Draft docs/learnings/day[NN].md in my voice. Separate verified results from open questions; do not include private puzzle input or claim unearned stars. Do not commit or push.

Use the [note template](learnings/TEMPLATE.md) if a starting structure helps. For navigation see the [learning guide](README.md).

## Provenance

Adapted from [AOC-AGENT-PROMPTS.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/AOC-AGENT-PROMPTS.md) at AoC2025 commit `e277e770319fcdd342f178e44cc37f06ae644c58`. These are curated 2023 adaptations, not synchronized copies. The original documents retain the longer worked examples and historical context.

Expanded using the shared agent-stack review perspectives and both years' day-note lessons; see [adoption notes](adoption-notes.md).
