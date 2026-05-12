# Sum — Detailed Reference

## Noise Filtering

Before summarizing, identify and **exclude**:
- Advertisements and sponsor reads ("этот эпизод спонсирует...", "supported by...")
- Calls to action: subscribe, like, share, comment, follow
- Channel/show branding intros and outros
- Timestamp markers (e.g. `[01:23:45]`, `00:15:32`)
- Stage directions (e.g. `[музыка]`, `[смех]`, `[applause]`)

These never appear in the output.

## Document Size Classification

| Size | Word range |
|---|---|
| Short | < 500 words |
| Medium | 500-2,000 words |
| Long | 2,000-10,000 words |
| Very long | > 10,000 words |

Word count excludes code blocks, YAML frontmatter, structural markup, and filtered noise.

## Summary Length Scaling

| Detail level | Multiplier of source | Output style |
|---|---|---|
| `brief` | ~3-5% or max 150 words | TLDR-style, key takeaways only (3-7 bullet points) |
| `standard` | ~8-12% | Structured summary with sections mirroring source headings |
| `detailed` | ~15-25% | Comprehensive summary preserving structure, examples, and nuanced arguments |

For very long documents (> 10,000 words), cap at the upper bound.

## Entity Extraction

### People

Every named person mentioned (authors, researchers, guests, historical figures, characters):
- Full name as it appears in the source
- Brief role/description from context (e.g., "neuroscientist", "host of...")

### Media

Every referenced creative work:
- Books (title + author if available)
- Films and movies
- TV series
- Podcasts
- Articles, papers, essays
- Albums, songs
- Other media (games, exhibitions, etc.)

## Summary Formatting Rules

### Heading hierarchy
- `#` — document title (source filename or detected title)
- `##` — top-level chapters (major sections of the source)
- `###` — subchapters (subsections within a chapter)
- `####` — deeper nesting if the source has more levels

### Content rules
- Write the summary **entirely in `target_language`**. Every sentence, heading, entity description.
- If `source_language == target_language`: write directly, no translation.
- If `source_language != target_language`: translate all prose. Translate proper names only if they have established equivalents.
- Mirror source heading hierarchy, adapting to detail level:
  - `brief`: single section with bullet points only
  - `standard`: one paragraph per `##` chapter; use `###` for notable subtopics
  - `detailed`: full chapter/subchapter structure with examples, quotes (translated), and nuanced reasoning
- Extract key ideas: main arguments, conclusions, notable facts — skip filler and repetition

## Output Path

**Default:** same directory as source, with prefix `summary_` before original filename.
- `source.md` → `summary_source.md`

If user specifies `--output <path>`, use that instead.

## Examples

### Brief English summary of a Russian transcript
```
/sum ./transcripts/interview.md --lang en --detail brief
```
→ English TLDR with 3-7 bullet points, ~100 words max. Entity lists included.

### Standard summary (auto-detect language)
```
/sum ./notes/article.md
```
→ Same language as source, structured chapters, ~8-12% length. Entities extracted. Noise filtered.

### Detailed Russian summary with custom output
```
/sum ./docs/research.md --lang ru --detail detailed --output ./summaries/final.md
```
→ Full Russian summary (~15-25% length). Complete entity lists. Saved to specified path.
