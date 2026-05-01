---
name: blog-style-markdown-editor
description: Edit Markdown files into clear, reader-friendly blog posts by fixing typos, grammar, flow, headings, and formatting while preserving the original meaning. Use when the user asks to polish, organize, proofread, rewrite lightly, or make an .md file blog-style without changing the underlying content.
---

# Blog-Style Markdown Editor

## Core Rule

Preserve the author's meaning. Do not introduce new claims, remove important nuance, change technical intent, or make the writing say something the source did not say.

## Workflow

1. Read the full target Markdown file before editing.
2. Identify the document's audience, topic, tone, and current structure.
3. Edit for blog readability:
   - Fix typos, spelling, punctuation, grammar, and awkward phrasing.
   - Improve paragraph flow and sentence clarity.
   - Organize sections with clear headings and logical progression.
   - Smooth transitions between ideas.
   - Normalize Markdown formatting for headings, lists, code blocks, links, and emphasis.
4. Preserve content boundaries:
   - Keep technical facts, examples, commands, code, and definitions semantically unchanged.
   - Do not add new technical explanations unless the user explicitly asks.
   - Do not delete uncertain or rough ideas just because they are imperfect; clarify them instead.
   - If a sentence is ambiguous, retain the ambiguity or ask the user rather than guessing.
5. After editing, re-read the changed file and check for meaning drift.

## Editing Guidance

Prefer light to moderate edits. The result should read like a polished version of the same author, not a new article with a different voice.

When reorganizing, move existing content into a more readable order only when the relationship between ideas is clear. If the source structure is unclear, make minimal local improvements and note any unresolved ambiguity.

For technical Markdown:
- Preserve code block contents unless fixing obvious comments, prose, or formatting around the code.
- Keep identifiers, API names, flags, commands, file paths, and error messages exact.
- Do not "correct" domain-specific terms without clear evidence.

## Final Response

Summarize the edit briefly:
- What kind of cleanup was done.
- Whether any ambiguous content was left unchanged.
- Any files edited.
