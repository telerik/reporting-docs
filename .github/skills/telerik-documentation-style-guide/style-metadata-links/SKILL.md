---
name: style-metadata-links
description: "Use this skill when writing or reviewing YAML frontmatter metadata, cross-references, internal links, external links, SEO descriptions, or demo page content in documentation articles. Covers required and optional metadata fields (title, page_title, description, slug, tags, position, previous_url), description length and keyword rules, cross-reference anchor text rules, internal linking with slug syntax, external link behavior, and demo article guidelines. Read this skill whenever creating a new article's frontmatter, reviewing metadata quality, adding links between articles, checking SEO descriptions, or building demo pages. Also use when asked to 'fix metadata', 'add frontmatter', 'check links', 'improve SEO', or 'review descriptions'."
---

# Metadata, Cross-References, and Links

This skill defines how to write YAML frontmatter metadata, create cross-references, format links, and structure demo pages in Progress DevTools documentation.

## YAML Frontmatter Metadata

Every documentation article starts with a YAML frontmatter block delimited by `---`. The metadata controls SEO, navigation, and site generation.

> **Editing restriction**: When optimizing existing articles, only the `description` field may be modified. All other metadata properties (`title`, `page_title`, `slug`, `tags`, `position`, `previous_url`, `published`, and any others) are read-only and must not be changed. The rules below for fields other than `description` are reference guidelines for authoring new articles.

### Required Fields

| Field | Purpose | Rules |
|-------|---------|-------|
| `title` | Display title in navigation and breadcrumbs | Title case; must match the H1 heading in the article body |
| `page_title` | HTML `<title>` tag for SEO (also called `meta_title`) | Include the product name and key topic; may differ from `title` to include more SEO-relevant keywords; typically appended with " \| Product Name" |
| `description` | HTML meta description for search engines | Between 120 and 150 characters; must be a complete, meaningful sentence; include primary keywords naturally |
| `slug` | Unique URL identifier for the article | Lowercase, hyphen-separated; must be unique across the entire documentation site; used in cross-reference links |

### Optional Fields

| Field | Purpose | Rules |
|-------|---------|-------|
| `tags` | Categorization tags for search and filtering | Comma-separated, lowercase |
| `position` | Sort order in navigation (lower = higher in list) | Integer; articles without position appear alphabetically after positioned ones |
| `previous_url` | Redirect from a former URL after article moves | Full path starting with `/`; keeps old bookmarks working |

### Metadata Examples

```yaml
---
title: Exporting to PDF
page_title: Export Documents to PDF | Telerik Document Processing
description: Learn how to export RadFixedDocument instances to PDF files using PdfFormatProvider, including page settings and encryption options.
slug: radpdfprocessing-export-to-pdf
tags: pdf, export, pdfformatprovider
position: 3
---
```

### Description Writing Rules

The `description` field is critical for SEO and search result snippets. Follow these rules:

1. **Minimum 120 characters** — Shorter descriptions do not meet the repository metadata standard.
2. **Optimal ~150 characters** — Fits most search result snippets without truncation.
3. **Complete sentence** — Write a full sentence, not a fragment or keyword list.
4. **Include primary keywords** — Mention the main topic and product name naturally.
5. **Unique per article** — Every article must have a distinct description. Do not reuse descriptions across articles.
6. **No special characters** — Avoid quotes, angle brackets, or other characters that may break HTML meta tags.
7. **Action-oriented** — Start with "Learn how to...", "Discover...", or describe what the reader will accomplish.

| ❌ Bad descriptions | ✅ Good descriptions |
|---|---|
| PDF export | Learn how to export documents to PDF format using PdfFormatProvider with options for page size, encryption, and digital signatures. |
| This article describes export. | Export RadFixedDocument instances to PDF files. Configure page settings, add encryption, and apply digital signatures during the export process. |
| (empty) | Use the PdfFormatProvider class to convert RadFixedDocument objects to PDF files with full control over compression, fonts, and security settings. |

## Cross-References and Links

Links connect articles and help readers navigate the documentation. Well-crafted links improve both usability and SEO.

### Internal Links — Slug Syntax

Use the Jekyll slug syntax for internal links between documentation articles:

```markdown
For more information, see [Exporting to PDF]({%slug radpdfprocessing-export-to-pdf%}).
```

This syntax resolves the slug to the correct URL regardless of the article's file location, making links resilient to file moves.

### Anchor Text Rules

Anchor text (the visible text of a link) must be **descriptive and self-explanatory**. A reader should understand what they will find at the link destination without reading the surrounding text.

| ❌ Bad anchor text | ✅ Good anchor text |
|---|---|
| Click [here](...) for more information. | See [Exporting to PDF](...) for configuration options. |
| Read [this article](...) to learn more. | Read [How to Configure PDF Encryption](...) for details. |
| For details, see [link](...). | For details, see [the PdfFormatProvider API Reference](...). |
| [More info](...) | [PDF Export Configuration Options](...) |

### Paraphrase Article Titles

Do not copy article titles verbatim as anchor text. Paraphrase them to fit the context of the surrounding sentence:

```markdown
❌ See [Exporting to PDF Format Using PdfFormatProvider in Telerik Document Processing]({%slug ...%}).
✅ See [how to export documents to PDF]({%slug ...%}).
```

### Varied Anchor Text

When linking to the same resource from multiple places, vary the anchor text. Identical anchor text across a site hurts SEO and confuses readers.

```markdown
First occurrence: See [PDF export options]({%slug ...%}) for compression settings.
Second occurrence: The [PdfFormatProvider configuration guide]({%slug ...%}) explains all available settings.
```

### External Links

External links (to URLs outside the documentation site) follow additional rules:

1. **Use HTTPS** — Always link to HTTPS URLs. If the target does not support HTTPS, reconsider whether the link is appropriate.

2. **Check for broken links** — Verify that external URLs are live and point to relevant content. External URLs change; review them periodically.

### Link Placement Rules

- Place links inline in the text where they are most relevant.
- Do not cluster multiple links in a single sentence — spread them across the section.
- Collect related links in a "See Also" section at the end of the article.
- Do not place links in headings.

## Demo Articles

Demo articles showcase product features and often appear in navigation as "Demos" or "Examples." They have specific requirements:

### Demo Metadata

- **Unique meta descriptions** — Each demo page must have its own description, different from the feature article description.
- **Keywords** — Include relevant keywords in the description that match how users search for the feature.

### Demo Content

- **Descriptive introduction** — Start with a brief description of what the demo demonstrates.
- **Links to feature documentation** — Include links to the corresponding feature article(s) for readers who want to learn more.
- **Working examples** — Ensure all demo code compiles and runs correctly.

## Quick Checklist

When reviewing an article for metadata and links, verify:

- [ ] All four required metadata fields are present: `title`, `page_title`, `description`, `slug`
- [ ] The `title` matches the H1 heading in the article body (if they differ, adjust the H1 — do not change the `title` metadata)
- [ ] The `description` is between 120 and 150 characters, a complete sentence, and unique
- [ ] The `slug` is lowercase, hyphen-separated, and unique
- [ ] Internal links use the `{%slug ...%}` syntax
- [ ] Anchor text is descriptive (no "click here", "this article", "link")
- [ ] Article titles are paraphrased in anchor text, not copied verbatim
- [ ] Anchor text varies when linking to the same resource multiple times
- [ ] No links inside headings
- [ ] "See Also" section at the end with related links
