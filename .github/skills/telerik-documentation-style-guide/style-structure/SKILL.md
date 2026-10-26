---
name: style-structure
description: "Use this skill when structuring documentation articles, writing headings, creating lists, or organizing content hierarchy. Covers title case capitalization rules, heading levels (single H1, H2-H4 nesting), -ing forms in headings, parallel heading style, list formatting (intro sentences, capitalization, punctuation, parallel structure, nesting limits), and general article structure. Read this skill whenever creating a new article skeleton, reviewing heading hierarchy, formatting lists, checking title capitalization, or organizing article sections. Also use when asked to 'fix headings', 'restructure the article', 'check list formatting', 'fix capitalization', or 'organize the content'."
---

# Article Structure, Headings, and Lists

This skill defines how to structure articles, write headings, and format lists in Progress DevTools documentation.

## Article Structure

Every documentation article follows a predictable structure that helps readers scan and find information quickly.

### Standard Article Skeleton

```markdown
---
title: Document Title
page_title: SEO-Optimized Page Title
slug: unique-slug-identifier
description: A description of 120–150 characters for SEO and meta tags.
tags: tag1, tag2
position: 5
---

# Document Title

Brief introduction (1–2 sentences) explaining what this article covers and why it matters.

## First Major Section

Text between the heading and any subheadings. Never place a subheading directly after a heading with no intervening text.

### Subsection

Content here.

### Another Subsection

Content here.

## Second Major Section

Content here.

## See Also

* [Related Article Title]({%slug related-article-slug%})
* [Another Related Article]({%slug another-slug%})
```

### Structural Rules

1. **One H1 per article** — The H1 (`#`) heading must appear exactly once and match the article's `title` metadata. When they differ, adjust the H1 to match the existing `title` value (do not modify the `title` metadata).
2. **Text between heading and subheadings** — Always write at least one sentence between a heading and its first subheading. This gives readers context before they dive into subsections.
3. **Minimum two subheadings** — If a section has subheadings, it must have at least two. A single subheading under a heading is a sign the content should be merged with the parent.
4. **Heading levels do not skip** — Go from H2 to H3, not from H2 to H4. Every heading level must be one deeper than its parent.
5. **"See Also" section** — Place a "See Also" section at the end of the article with links to related content. This is a convention, not a hard requirement.

## Title Case Capitalization

All headings use **title case**. Title case capitalizes most words but keeps certain short words lowercase.

### Capitalize These Words

- **Nouns**: Document, Page, Stream, Table, Field
- **Verbs** (including short ones): Is, Are, Was, Be, Do, Has, Get, Set, Run, Use
- **Adjectives**: Fixed, Custom, New, Digital, Large
- **Adverbs**: Always, Never, Quickly, Also
- **Pronouns**: You, Your, It, Its, They, Their
- **Subordinating conjunctions**: If, When, Because, Although, While, Since, After, Before, Until

### Keep These Words Lowercase

(unless they are the first or last word of the heading)

- **Articles**: a, an, the
- **Coordinating conjunctions**: and, but, or, nor, for, yet, so
- **Short prepositions** (4 letters or fewer): in, on, at, to, by, for, of, up, off, out, with
- **"to" in infinitives**: How to Export, Getting to Know

### First and Last Words

Always capitalize the **first word** and the **last word** of a heading, regardless of the rules above.

### Examples

| ❌ Wrong | ✅ Correct |
|---|---|
| How to export a document to pdf | How to Export a Document to PDF |
| Working with the fixed document model | Working with the Fixed Document Model |
| Getting started with the api | Getting Started with the API |
| Create And Export a pdf File | Create and Export a PDF File |
| Loading data From A remote Source | Loading Data from a Remote Source |

### Tricky Cases

| Word | Rule | Example |
|------|------|---------|
| is, are, was, be | Verb — capitalize | "What Is a Content Stream" |
| it, its | Pronoun — capitalize | "How It Works" |
| with | Preposition (4 letters) — lowercase | "Working with Documents" |
| from | Preposition (4 letters) — lowercase | "Import Data from a File" |
| into | Preposition (4 letters) — lowercase | "Load Data into a Workbook" |
| through | Preposition (7 letters) — capitalize | "Iterating Through Pages" |
| between | Preposition (7 letters) — capitalize | "Converting Between Formats" |

## Heading Style

### -ing Forms in Headings

**-ing forms (gerunds) are acceptable and often preferred in task-oriented headings.** This is an exception to the body-text rule that avoids gerunds.

```markdown
## Configuring the Export Settings     ✅ (heading — gerund OK)
## Loading Data from a Remote Source   ✅ (heading — gerund OK)
## How to Configure Export Settings    ✅ (alternative form)
```

### Parallel Headings

Headings at the same level within a section should follow the same grammatical pattern.

| ❌ Inconsistent | ✅ Parallel |
|---|---|
| ## Installing the Package / ## Configuration / ## How to Run Tests | ## Installing the Package / ## Configuring the Settings / ## Running the Tests |
| ## Create a Document / ## Exporting / ## The Import Process | ## Creating a Document / ## Exporting a Document / ## Importing a Document |

### Heading Content Rules

- **No inline code in headings** — Avoid backtick-formatted code in headings when possible. Use plain text or rephrase.
  - ❌ `## Using the \`Export()\` Method`
  - ✅ `## Using the Export Method`
- **No links in headings** — Do not place hyperlinks inside heading text.
- **No trailing punctuation** — Do not end headings with periods, colons, or question marks (except FAQ headings, which use question marks by design).

## Lists

Lists make information scannable. Use them for sequences of steps, sets of options, or collections of related items.

### Ordered Lists (Numbered)

Use ordered lists for **sequential steps** where order matters:

```markdown
1. Open the document in the editor.
2. Select **File** > **Export**.
3. Choose the output format.
4. Click **Save**.
```

### Unordered Lists (Bulleted)

Use unordered lists for **non-sequential items** where order does not matter:

```markdown
The library supports the following formats:

* PDF
* DOCX
* XLSX
* CSV
```

### List Formatting Rules

1. **Introductory sentence** — Always precede a list with an introductory sentence that ends with a **colon** (`:`).

2. **Capitalize the first word** — Every list item starts with a capital letter.

3. **Punctuation consistency** — If any list item is a complete sentence, **all items** in that list must be complete sentences and end with a period. If all items are fragments, none end with a period.

   ```markdown
   ✅ All fragments (no periods):
   * PDF export
   * DOCX import
   * XLSX conversion

   ✅ All complete sentences (all periods):
   * The library exports documents to PDF.
   * The library imports DOCX files.
   * The library converts XLSX workbooks.

   ❌ Mixed (some periods, some not):
   * The library exports documents to PDF.
   * DOCX import
   * The library converts XLSX workbooks.
   ```

4. **Parallel structure** — All items in a list should follow the same grammatical pattern.

   ```markdown
   ❌ Not parallel:
   * Export the document.
   * Configuration of settings.
   * You can import data.

   ✅ Parallel:
   * Export the document.
   * Configure the settings.
   * Import the data.
   ```

5. **No single-item lists** — A list with one item is not a list. Convert it to a regular sentence.

6. **Nesting depth** — Do not nest lists more than **three levels** deep. If you need more depth, restructure the content into subsections.

7. **List marker consistency** — Use `*` for unordered lists (not `-` or `+`). Use `1.`, `2.`, `3.` for ordered lists.

## Figures and Captions

When inserting figures (images, diagrams, charts):

1. Introduce the figure in the preceding text.
2. Use descriptive alt text in the image tag.
3. If the figure needs additional explanation, add a caption as italic text immediately after the image.

```markdown
The following diagram shows the document processing pipeline:

![Document processing pipeline showing import, transformation, and export stages](images/pipeline-diagram.png)

*Figure 1: The document processing pipeline processes documents through three stages.*
```

## Quick Checklist

When reviewing an article for structure, verify:

- [ ] Exactly one H1 heading that matches the title metadata (adjust the H1 if they differ; do not change the metadata)
- [ ] Text between every heading and its first subheading
- [ ] At least two subheadings per section (or none)
- [ ] Heading levels do not skip (H2→H3, never H2→H4)
- [ ] All headings use title case capitalization
- [ ] Headings at the same level use parallel structure
- [ ] No inline code, links, or trailing punctuation in headings
- [ ] Every list has an introductory sentence ending with a colon
- [ ] List items are capitalized and have consistent punctuation
- [ ] List items use parallel grammatical structure
- [ ] No single-item lists
- [ ] Lists nested no deeper than three levels
