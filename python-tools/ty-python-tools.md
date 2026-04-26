# Ty - Astral

**Date:** 2025-12-28  
**Category:** python-tools

## Introduction
ty is basically python type-checker tool and a language server. Similar to mypy [if you have heard/used it], but faster due to its
implementation in Rust.

## Why
If you have worked with large python codebases, you must have definitely felt the pain of waiting for mypy checks. This hits developer producitivity where time taken in code checks > time taken in code change [may be I am exaggerating, LOL]

## Digging Deep

Below are directly taken from [python handbook](https://pydevtools.com/blog/tys-breakthrough-why-incremental-analysis-matters-for-python/#incrementality-at-the-core)
> The most significant technical innovation in ty is its incremental analysis system. Unlike traditional type checkers that reanalyze entire codebases when files change, ty tracks dependencies between code elements and only recomputes what’s actually affected by changes.

> “If we already understand the state of the program and you change something that doesn’t affect what you’re looking at, we should only have to redo work that is impacted by what you change,” Marsh noted. “It’s not like we have to run mypy over your full codebase every single time you change a file.”

> This incrementality operates at multiple levels, from file-level changes down to function-level modifications. When you modify a function’s local annotation, ty only needs to recompute that specific function rather than analyzing the entire project.

## How to use
Apart from incorporating in your own python project. We can use the ty language server with VS code / cursor; which is fast and useful. Ref: [ty-VS Code extension](https://marketplace.visualstudio.com/items?itemName=astral-sh.ty)


## Migrating from mypy to ty
Will update further, when I do the migration. Ref: [How to migrate from mypy to ty](https://pydevtools.com/handbook/how-to/how-to-migrate-from-mypy-to-ty/)

## References

- [ty - Official docs](https://docs.astral.sh/ty/)
- [ty - Python developer handbook](https://pydevtools.com/handbook/reference/ty/)
- [ty's Breakthrough: Why Incremental Analysis Matters for Python](https://pydevtools.com/blog/tys-breakthrough-why-incremental-analysis-matters-for-python/)

