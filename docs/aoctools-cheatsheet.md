# AoCTools reference for AoC2023

Use this to discover utilities, not to force every puzzle into a library abstraction. Prefer the clearest correct representation.

## Version and dependency boundary

Checked against the locally resolved AoCTools **0.1.11**, revision `1e7804d0a72ec5a74ab86f89826843010a2a9dbe`, on November 8, 2026. [Browse that source](https://codeberg.org/gereon/AoCTools/src/commit/1e7804d0a72ec5a74ab86f89826843010a2a9dbe/Sources).

The root manifest requests `.upToNextMinor(from: "0.1.11")` from Codeberg. Package.resolved is currently ignored, so another checkout may resolve differently. Recheck APIs in the resolved source after dependency changes. Do not silently upgrade dependencies to match an example.

The inspected dependency manifest requires Swift **6.4** and macOS **26** even though the root manifest's tools version is 6.2. Use a toolchain compatible with the actual resolved dependency. No `.swift-version` pin is introduced by these docs.

## Verified utilities

Import `AoCTools` to use these APIs. This table describes signatures and behavior, not complete standalone programs.

| Need | API | Important detail |
| --- | --- | --- |
| Coordinates | `Point(x, y)`, `Point.zero` | Hashable; supports point arithmetic |
| Orthogonal neighbors | `point.neighbors(adjacency: .cardinal)` | Does not restrict results to puzzle bounds |
| Diagonal/all neighbors | `.ordinal` / `.all` adjacency | Choose from the actual movement rules |
| Distance | `point.distance(to: other)` | Manhattan distance; default target is zero |
| Movement | `point.moved(to: .e, steps: n)` | Check coordinate conventions |
| Direction | `Direction.n`, `.s`, `.e`, `.w`; `.opposite` | Cardinal ordering is not a clockwise sequence |
| Turning | `direction.turned(.clockwise, by: 90)` | Use supported angles |
| Grid parsing | `Grid<Value>.parse(text)` or `.parse(lines)` | `Value` must conform to `Drawable`; validate nonempty rectangular input |
| Grid storage | `grid.points`, `.xRange`, `.yRange` | Points dictionary and closed coordinate ranges |
| Extract numbers | `string.integers()` | Extracts signed integers; does not validate the whole record format |
| Preserve line separators | `string.lines` | Preserves empty lines; normalize only when puzzle semantics allow |
| Adjacent grouping | `array.chunked(by: predicate)` | Predicate receives adjacent elements; a false result starts a new chunk |
| Separator grouping | `array.grouped(by: predicate)` | Matching separator elements are omitted |
| Aggregate integers | `sequence.sum()`, `.product()` | Check overflow and empty-sequence meaning |
| GCD/LCM | `gcd(m, n)`, `lcm(m, n)` | Use positive arguments; implementation does not guard a zero second operand; LCM can overflow |

## Search and caching

`AStarPathfinder(map: map).shortestPath(from: start, to: goal)` requires a map conforming to `Pathfinding`: define neighbors, movement cost, distance estimate, and goal behavior as needed. The Point/Int defaults use unit cost and Manhattan distance; they may be wrong for diagonal moves, teleports, or weighted puzzles. Check admissibility and consistency before relying on shortest-path behavior.

`memoize` is main-actor isolated. `Memoized<In, Out>` supports recursive caching through the closure's supplied recursive helper. Include all relevant state in the hashable input key, establish a terminating recurrence, and do not assume the mutable cache is safe to share between concurrent tasks.

## Avoid misleading shortcuts

- The integer `pow` helper internally uses floating-point exponentiation. Do not assume exact results for large integers; use checked integer arithmetic when exactness matters.
- Integer String subscripts are convenience APIs, not constant-time random access.
- Do not assume `Collections`, `Algorithms`, or `Parsing` are directly available because another year's project used them. This target declares only AoCTools; explicitly review package dependencies before introducing a new import.

For algorithm selection, return to [problem-solving](problem-solving.md).

## Provenance

Adapted from [AoCTools-Cheatsheet.md](https://github.com/JeffESchmitz/AoC2025/blob/e277e770319fcdd342f178e44cc37f06ae644c58/AoCTools-Cheatsheet.md) at AoC2025 commit `e277e770319fcdd342f178e44cc37f06ae644c58`. These are curated 2023 adaptations, not synchronized copies. The original documents retain the longer worked examples and historical context.
