---
name: sum
description: Generates structured summaries from markdown files. Auto-detects source language, scales length to document size, and supports configurable detail levels (brief, standard, detailed). Extracts mentioned people and media entities. Filters out ads and promotional content. Saves output to a markdown file. Use when summarizing notes, articles, transcripts, or any markdown content.
---

# Sum

Generates a structured summary of a markdown file with adaptive length, configurable detail level, entity extraction, and automatic file saving.

## Quick start

```
/sum ./notes/article.md
/sum ./transcripts/interview.md --lang en --detail brief
/sum ./docs/research.md --lang ru --detail detailed --output ./summaries/final.md
```

## Usage

The user provides:
1. **File path** — the markdown file to summarize (required)
2. **Language** — `--lang <code>` target language (optional, defaults to source language)
3. **Detail level** — `--detail brief|standard|detailed` (default: `standard`)
4. **Output path** — `--output <path>` (default: `summary_<filename>.md` in same directory)

## Language Rule

1. If `--lang <code>` provided → use that language.
2. Otherwise → use the **source document language**. No translation, no carry-over from prior calls.

Each `/sum` call is independent. Never carry over language from previous invocations.

## Workflow

1. **Read** the input file (use `offset`/`limit` for large files)
2. **Detect language** of source prose; determine target language per rules above
3. **Filter noise** — skip ads, sponsor reads, CTAs, timestamps, stage directions
4. **Measure size** — classify by word count (short <500, medium 500-2k, long 2k-10k, very long >10k)
5. **Scale summary length** per detail level (see [REFERENCE.md](REFERENCE.md))
6. **Extract entities** — people (name + role) and media (title + type + author)
7. **Generate summary** — hierarchical headings mirroring source structure, entirely in target language
8. **Save** to output path

## Detail Levels

| Level | Length | Style |
|---|---|---|
| `brief` | ~3-5% / max 150 words | Bullet points, key takeaways only |
| `standard` | ~8-12% | Structured sections mirroring source headings |
| `detailed` | ~15-25% | Full structure with examples, quotes, nuanced arguments |

For full workflow details, entity extraction rules, and content formatting rules, see [REFERENCE.md](REFERENCE.md).
