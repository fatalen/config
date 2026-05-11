---
name: markdown-summary
description: Generates structured summaries from markdown files. Auto-detects source language, scales length to document size, and supports configurable detail levels (brief, standard, detailed). Extracts mentioned people and media entities. Filters out ads and promotional content. Saves output to a markdown file. Use when summarizing notes, articles, transcripts, or any markdown content.
---

# Markdown Summary

Generates a structured summary of a markdown file with adaptive length, configurable detail level, entity extraction, and automatic file saving.

## Usage

The user provides:
1. **File path** — the markdown file to summarize (required)
2. **Language** — target language for the summary (optional, defaults to source document language). Example flags: `--lang en`, `--lang ru`
3. **Detail level** — `brief`, `standard`, or `detailed` (default: `standard`). Example flag: `--detail brief`

## Language Rule

The summary language is determined by exactly one of these rules, in order:

1. **If the user provided `--lang <code>`** → write the summary in that language.
2. **If the user did NOT provide `--lang`** → write the summary in the **same language as the source document**. Do not translate. Do not switch languages. The output language must match the detected source language exactly.

**Common mistake to avoid:** Never carry over a language preference from a previous invocation or conversation context. Each `/skill:markdown-summary` call is independent. If `--lang` is absent, the summary language = source document language — always, without exception.

---

## Workflow

### Step 1: Read the input file

Use `read` to load the full content of the provided markdown file. If the file is large, read in chunks with `offset`/`limit`.

### Step 2: Detect source language

Analyze the prose in the document to determine its primary language (Russian, English, etc.). Check frontmatter fields like `lang` if present. Record this as `source_language`.

**Determine target language:**
- If the user provided `--lang <code>` → `target_language = <user-specified code>`
- If the user did **NOT** provide `--lang` → `target_language = source_language` (no translation)
- Do not carry over language preferences from previous skill invocations or conversation context. Each call is independent.

### Step 3: Filter noise and promotional content

Before summarizing, identify and **exclude** from processing:
- Advertisements and sponsor reads ("этот эпизод спонсирует…", "supported by…")
- Calls to action: subscribe, like, share, comment, follow ("подпишитесь", "ставьте лайк", "don't forget to subscribe")
- Channel/show branding intros and outros
- Timestamp markers from transcripts (e.g. `[01:23:45]`, `00:15:32`)
- Stage directions in transcripts (e.g. `[музыка]`, `[смех]`, `[applause]`)

These elements are recognized by common patterns and skipped during summarization — they never appear in the output.

### Step 4: Measure document size

Count approximate word count of the cleaned prose content (excluding code blocks, YAML frontmatter, structural markup, and filtered noise). Classify:

| Document size | Word range |
|---|---|
| Short | < 500 words |
| Medium | 500–2,000 words |
| Long | 2,000–10,000 words |
| Very long | > 10,000 words |

### Step 5: Determine target summary length

Apply the detail level multiplier to get approximate target word count for the summary:

| Detail level | Multiplier of source | Output style |
|---|---|---|
| `brief` | ~3–5% or max 150 words | TLDR-style, key takeaways only (3–7 bullet points) |
| `standard` | ~8–12% | Structured summary with sections mirroring source headings |
| `detailed` | ~15–25% | Comprehensive summary preserving structure, examples, and nuanced arguments |

For very long documents (> 10,000 words), cap the multiplier at the upper bound to keep output manageable.

### Step 6: Extract entities

While reading the document, collect two entity lists:

**People** — every named person mentioned (authors, researchers, guests, historical figures, characters):
- Full name as it appears in the source
- Brief role/description from context (e.g., "neuroscientist", "host of…")

**Media** — every referenced creative work:
- Books (title + author if available)
- Films and movies
- TV series
- Podcasts
- Articles, papers, essays
- Albums, songs
- Other media (games, exhibitions, etc.)

### Step 7: Generate the summary with hierarchical structure

Write the summary in the target language following these rules:

**Heading hierarchy:**
- `#` — document title (source filename or detected title)
- `##` — top-level chapters (major sections of the source)
- `###` — subchapters (subsections within a chapter)
- `####` — deeper nesting if the source has more levels

**Content rules:**
- Write the summary **entirely in `target_language`** (determined in Step 2). Every sentence, every heading label, every entity description must be in that language.
- If `source_language == target_language`: write directly, no translation needed.
- If `source_language != target_language`: translate all prose to the target language. Translate proper names only if they have established equivalents in that language.
- Mirror the source document's heading hierarchy, adapting to the detail level:
  - `brief`: single section with bullet points only (no chapter breakdown needed)
  - `standard`: one paragraph per `##` chapter; use `###` for notable subtopics
  - `detailed`: full chapter/subchapter structure (`##`, `###`, `####`) with examples, quotes (translated), and nuanced reasoning preserved
- Extract key ideas: main arguments, conclusions, notable facts — skip filler and repetition

### Step 8: Save the summary

Use `write` to save the complete summary file.

**Default output path:** same directory as source, with prefix `summary_` before original filename (e.g., `source.md` → `summary_source.md`). If user specifies an output path via `--output`, use that instead.

## Examples

### Brief English summary of a Russian transcript
```
User: /skill:markdown-summary ./transcripts/interview.md --lang en --detail brief
```
→ English TLDR with 3–7 bullet points, ~100 words max. Entity lists included. Saved to `summary_interview.md`.

### Standard summary (auto-detect language)
```
User: /skill:markdown-summary ./notes/article.md
```
→ Same language as source, structured chapters and subchapters, ~8–12% of original length. People and media extracted. Promotional content filtered out.

### Detailed Russian summary with custom output path
```
User: /skill:markdown-summary ./docs/research.md --lang ru --detail detailed --output ./summaries/final.md
```
→ Full Russian summary preserving structure, examples, and nuances (~15–25% length). Complete entity lists included. Saved to specified path.
