---
name: progress-style-guide
description: Progress DevTools Style Guide rules for Telerik/Kendo UI end-user documentation. Load when authoring, reviewing, or editing markdown documentation articles to enforce tone and voice, grammar, titles and headings, lists, tables, notes, cross-references, metadata, captions, screenshots, and formatting conventions. Source — https://www.telerik.com/documentation/style-guide/introduction.
---

# Progress DevTools Style Guide

Condensed, enforceable rules for Progress DevTools (Telerik Reporting, Kendo UI, etc.) end-user documentation. Apply every rule below when writing or editing markdown articles. When this skill conflicts with the Microsoft Style Guide, follow this skill. When this skill is silent, fall back to the [Microsoft Style Guide](https://learn.microsoft.com/en-us/style-guide).

Canonical source: https://www.telerik.com/documentation/style-guide/introduction (cheat sheet: https://www.telerik.com/documentation/style-guide/cheat-sheet).

## Tone and Voice

### Basic things to avoid
- Do not denigrate or insult any group of people.
- Do not use jokes at the expense of the users.
- Do not use "simply", "It's that simple", or "It's easy".
- Do not use "let's …" constructions.
- Do not use "please", "please note", or "at this time".
- Do not use third-person singular gendered pronouns ("he", "she"). Use "they" instead.
- Do not use metaphors, slang, jargon, humor, sarcasm, colloquialisms, idioms, emoticons, or emojis.
- Do not use Latin abbreviations such as "e.g." or "i.e." — write "for example" or "that is".
- Do not use culture-specific references (holidays, currencies, phone/address formats).
- Do not use qualifiers such as "good", "best", "worst".
- Do not create new terms.
- Do not use generic "there is" / "there are" openers.
- Do not use symbols in place of words in running text.

### Writing for global audiences
- Use simple, objective, non-ambiguous language.
- Keep sentences and paragraphs short. Split anything too long.
- Prefer common en-US vocabulary and very specific words.

## General Writing Rules

### American English
Use en-US spelling. Examples: behavior, color, organize, license, center, canceled.

### Active voice
- Prefer active voice; reserve passive voice for cases where the agent is unknown or irrelevant.
- If you must use passive voice, use it consistently within the sentence.
- Avoid: "the results that are returned by the query" → Prefer: "the results that the query returns".

### Directly address the user
- Use the imperative mood: "Click **Save**.", "Select the **Inspectors** tab."
- Drop "please". Drop "please note".
- Avoid: "After reading this tutorial, the roadmap should be created." → Prefer: "After reading this tutorial, create the roadmap."
- Avoid: "If you want to enable filtering, you can set `filterable` to `true`." → Prefer: "To enable filtering, set `filterable` to `true`."

### Gender-neutral language
- Use they / their / theirs instead of he/she/his/her.
- If "their" does not fit, rephrase to eliminate the pronoun.
- Avoid unnecessarily gendered nouns ("man-hours" → "person-hours").

### Avoid gerunds and -ing forms in running text
- Minimize gerunds and "-ing" forms in body text.
- Rewrite "-ing" adjectives that follow a noun: "a server running on …" → "a server that is running on …".
- Eliminate dangling "-ing" phrases: "When using a hot spot, …" → "When you use a hot spot, …".
- Exception: "-ing" forms are **encouraged** in titles and headings that describe a process ("Installing the Plugin", "Getting Started").

### Simple tenses
- Prefer the present simple tense.
- Avoid "would" where "will" fits; avoid perfect tenses where past simple fits.
- Avoid: "…which would be rendered as the popup header." → Prefer: "…which is rendered as the popup header."

### Simple language
- Use specific, concrete words. Prefer short words and short phrases.
- Avoid generalizations and vague phrases.
- Avoid space-saving symbols in running prose.

### Short sentences and paragraphs
- Keep sentences up to ~25 words.
- Two to four sentences per paragraph.
- Keep a paragraph up to six lines.
- Split long compound sentences into two or more short sentences.

### Modal verbs — should, could, would, must, have to, need to
- Use "have to", "has to", "need to", or "must" for obligation.
- Avoid "should" (ambiguous).
- Replace "could"/"would" with "can"/"will" where possible.
- For recommendations, use the imperative mood directly.
- Avoid: "the + indicates that you should add one or more arguments" → Prefer: "…you have to add one or more arguments".

### Logic, precision, verbs and actions
- Use nouns as nouns and verbs as verbs. Do not verbify nouns or acronyms.
- Keep phrasal verbs together: "Turn off the zoom tool…" not "Turn the zoom tool off…".
- Use simple verb phrases; prefer action-centered writing.

### Noun phrases
- Avoid noun phrases longer than two words. Rephrase with prepositions or relative clauses.
- Avoid: "the default column pointer location" → Prefer: "the default location of the column pointer".

### Prepositional phrases
- Place each prepositional phrase next to what it modifies.
- Move prepositional phrases that modify the whole sentence to the start: "On a standard tape label, only 17 characters are available for the table name."

### Pronouns
- Make every pronoun's antecedent unambiguous.
- Do not use "this", "that", "these", "those" as bare pronouns — pair them with the noun they refer to.
- Avoid: "Apply all manual adjustments. These are listed on the Rules tab." → Prefer: "Apply all manual adjustments that are listed on the Rules tab."

### Modifiers
- Place "only" and "not" as close as possible to what they modify.
- Hyphenate "-ing" adjectives and nouns in compound modifiers ("load-sharing facility", not "load sharing facility").

### Prefixes
- Check Merriam-Webster for the established spelling of prefixed words.
- Do not hyphenate if the established form is closed ("noncritical", not "non-critical").
- Hyphenate only when needed to avoid ambiguity ("re-create" vs. "recreate").

### Contractions
- Avoid contractions in documentation. Spell out "do not", "cannot", "will not", "it is", "you are".
- Use the uncontracted form for emphasis.

## Words for User Interaction
- Desktop: click, double-click, right-click, press, select, deselect.
- Mobile: tap, double-tap, swipe, tap and hold, spread, pinch, drag; for Apple 3D Touch use "touch".
- Mixed devices: select, double-tap, or double-click.

## Titles, Headings, and Subheadings

### Structure
- The article's `#` (level-one) heading matches the `title` and appears exactly once.
- The `meta_title` / `page_title` may differ from the `#` heading for SEO (and may omit the product name).
- Use `##` and `###` for sections and subsections. Use `####`+ only when necessary.
- If a section has subheadings, include at least two; do not create a single lone subheading.
- Place introductory text between a heading and its first subheading.

### Capitalization (Title Case for titles and headings)
Always capitalize:
- First and last words.
- Nouns, pronouns, verbs (including "Is"), adjectives, adverbs.
- Subordinating conjunctions ("If", "Because", "That").
- All words in phrasal verbs ("Take Off", "Turn Up").
- Prepositions used as UI element names ("The On Button").
- First and last word of a hyphenated expression ("How-To Guide", "Out-of-the-Box").

Never capitalize:
- Coordinating conjunctions ("and", "but", "or").
- Articles ("a", "an", "the") — except when first or last.
- Prepositions in general usage ("at", "on", "between").
- "to" in an infinitive ("Widgets to Beautify Your App").

### -ing forms
- Use "-ing" forms in titles and headings for processes ("Getting Started", "Configuring the Grid", "Handing Off Projects to Developers").

### Style
- Make same-level headings grammatically parallel.
- Do not repeat the parent heading's wording in subheadings ("Local Data Binding" → "Binding to Local Arrays").
- Drop articles where the meaning stays clear ("Preserving the State in Cookies").
- Do not use metaphors in headings ("The Right Way to…" → "Proper Approaches to…").
- Do not cite object types, methods, or events in headings (except API articles). Describe the user's goal.
- No ending punctuation in headings. No exclamation marks.
- Preserve original capitalization inside quoted fragments in a heading.

## Lists
- Numbered lists for procedures; bulleted lists for same-priority items.
- Introduce every list with a sentence ending in a colon.
- Move repeating wording from the bullets into the introductory sentence.
- Start each list item with a capital letter.
- End each list item with a period only if it is a complete sentence. If any one item needs a period, give all items periods.
- Avoid starting list items with "a", "an", "the".
- Do not create single-item lists.
- Keep list items grammatically parallel (all imperatives, all nouns, all full sentences).
- Nest no deeper than three levels; restructure instead.
- Place longer explanations in a separate paragraph aligned with the parent list item.

## Metadata (YAML Front Matter)
Always include, at minimum: `title`, `meta_title` (or `page_title` in earlier versions), `description`, and `slug`. The `slug` prevents 404s when the article moves.

Example:

```yaml
---
title: Data Binding
position: 1
meta_title: Data Binding | {Component or Suite Name}
description: "Bind the Kendo UI Grid to a local array or a remote data source."
slug: data-binding-autocomplete
previous_url: /data-management/grid/introduction
---
```

Repository-specific overrides (for example, Telerik Reporting uses `page_title` instead of `meta_title`, a `telerikreporting/` slug prefix, and fields like `tags`, `published`, `reportingArea`) take precedence over this generic shape.

## Notes — Alert Blockquotes
Use the repository's alert prefix convention (`>note`, `>tip`, `>important`, `>caution`, `>warning`) to convey:
- **note** — neutral or positive supplementary information; memory limits, equipment configs, version-specific details.
- **tip** — alternative methods and benefits; not essential to understanding the main text.
- **important** (`caution` prefix in some repos) — essential information for task completion; must not be skipped.
- **warning** — risk of data loss, security issues, or irreversible actions.

Keep each note short and focused. One alert per idea.

## Cross-References
- Cross-link related articles generously.
- Use descriptive anchor text. Never "click here", "go here", or "this link".
- Make the link text clearly identify the linked content ("refer to the article on [binding the Scheduler to data](…)").
- When quoting an external resource, cite its exact name and author.
- Always include a `See Also`, `Suggested Links`, or `Next Steps` section near the end of the article for navigation.
- Use `Next Steps` in tutorials and in feature areas that span multiple articles.

## Prepositions (Common Phrases)
- **in** — a command mode, a dialog box, a pane, a window, a class, a code snippet, a container, a file, a filename, a property, a method, an object, the example.
- **on** — a page, the desktop, a worksheet, a control, the screen.
- **at** — a command line, a prompt.

## Comments in Code Snippets
- Write comments in English.
- Keep each comment line up to 80 characters so it fits the viewport.
- Do not over-comment self-explanatory code.

## Captions for Figures, Tables, and Code Snippets
- Introduce every table, figure, screenshot, code snippet, or demo with either a descriptive sentence or a bold caption.
  - Descriptive sentence example: "The following table lists the configuration options of the TreeList."
  - Caption example: "**Available Configuration Options of the TreeList**".
- Place the caption before the element.
- Render captions in bold.
- No ending punctuation unless the caption is a complete sentence.
- Do not number captions manually.

## Screenshots and Images
- Use the product's default appearance. Avoid 3D effects.
- Use arrows to point to the element being explained.
- Minimize empty space; crop tightly.
- Maximum width ~1000 px.
- For labels, use Arial 16 pt.
- Alt text is a descriptive sentence, not the file name.

## Tables

### Headers
- Sentence case for the table title and column headings.
- No ending punctuation in headers.
- Unformatted text only — no bold, italic, or code formatting in headers.

### Content
- Follow general capitalization and semantic-marking rules in body cells.
- Every cell has content. If data does not apply, write "N/A", "Not applicable", or "None" — never a dash.

## Element Formatting
- **Bold** — UI labels, menu items, buttons, dialog box names, window titles. Example: "To submit the form, click **Save**."
- `Code formatting` — HTML tags, methods, events, variables, class names, CLI commands, file names, property names. Example: "To trigger the `save` event, click **Save**."
- `Code formatting` — keyboard keys and shortcuts. Example: "To save the form, press `Ctrl+S`."
- *Italics* — sparingly, for genuine emphasis or the first appearance of a new term.

## Company and Product Brand Names
- Follow the official [Progress trademark list](https://www.progress.com/legal/trademarks) and the [Progress brand guidelines](http://brand.progress.com/).
- Use "Telerik Reporting", "KendoReact", "Kendo UI for Angular", "Telerik UI for Blazor" exactly as branded.
- Use "Progress® Telerik® Reporting" only in formal or legal contexts; "Telerik Reporting" in running prose.
- Respect third-party trademarks when referenced.

## Pre-Publish Self-Check
Before submitting an article, verify:
1. American English spelling throughout.
2. Active voice used wherever practical; no bare "is/are …ed" passives where the agent is known.
3. Imperative mood in instructions; no "please", no "let's".
4. No contractions.
5. No "should"; modal verbs chosen intentionally.
6. Sentences ≤ 25 words; paragraphs ≤ 6 lines.
7. Every heading uses Title Case with correct capitalization rules; no ending punctuation.
8. Same-level headings are parallel; no single-item lists; no lone subheadings.
9. Every list has a colon-ending introductory sentence and parallel items.
10. YAML front matter includes `title`, `meta_title`/`page_title`, `description`, `slug`.
11. Every table, figure, and code block has a caption or introductory sentence.
12. Every cross-reference has descriptive anchor text.
13. A `See Also` or `Next Steps` section exists near the end.
14. Alt text is a sentence, not a file name.
15. No emojis, culture-specific references, Latin abbreviations, or gendered pronouns.
