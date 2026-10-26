---
name: style-grammar-words
description: "Use this skill when checking or correcting grammar, word choice, contractions, pronouns, numbers, punctuation, or vocabulary in documentation articles. Covers modal verbs (must/can/will vs should/could/would), acceptable and unacceptable contractions, singular vs plural usage, number formatting, Oxford comma, en dash ranges, prepositional phrases, prefix hyphenation, and the full word-replacement table for simpler alternatives. Read this skill whenever editing text for grammar compliance, replacing complex words with simpler ones, checking contraction usage, formatting numbers, or reviewing punctuation. Also use when asked to 'fix grammar', 'simplify vocabulary', 'check word choice', or 'review punctuation' in any markdown article."
---

# Grammar, Word Choice, and Punctuation

This skill defines the grammar, vocabulary, and punctuation rules for Progress DevTools documentation. Apply these rules to every article you write, edit, or review.

## Modal Verbs

Modal verb choice matters because it controls the strength of recommendations and the reader's sense of obligation.

| Use | Instead of | Reason |
|-----|-----------|--------|
| **must**, **have to**, **need to** | should | "Should" implies optional; "must" is unambiguous |
| **can** | could, may | "Can" states capability directly |
| **will** | would | "Will" is definite; "would" is conditional |

- Use **"must"** or **"have to"** for requirements.
- Use **"can"** for capabilities or permissions.
- Use **"will"** for outcomes that definitely happen.

## Contractions

Contractions make documentation feel conversational but some forms sound awkward in technical writing.

### Acceptable Contractions

Use these freely: **aren't**, **can't**, **didn't**, **don't**, **doesn't**, **haven't**, **hasn't**, **hadn't**, **isn't**, **wasn't**, **weren't**, **shouldn't**, **couldn't**, **wouldn't**, **I'm**

### Unacceptable Contractions

Do not use these — they sound too informal or create ambiguity:

**you'll**, **you're**, **you'd**, **you've**, **what's**, **where's**, **when's**, **how's**, **won't**, **I'll**, **I've**, **I'd**, **it's**, **that's**, **there's**, **here's**, **they'll**, **they've**, **they'd**, **we'll**, **we're**, **we've**, **we'd**

Write the expanded form instead: "you will" not "you'll", "it is" not "it's", "they have" not "they've".

## Singular vs. Plural

Use **plural nouns** when describing general actions or capabilities. Plural sounds more natural and avoids awkward "a/an" constructions.

| ❌ Singular | ✅ Plural |
|---|---|
| Export a document to a PDF file. | Export documents to PDF files. |
| Add a tag to the element. | Add tags to elements. |
| Create a bookmark in the page. | Create bookmarks in pages. |

Use singular when referring to a specific, single instance: "The document contains a cover page."

## Numbers

### Spell Out 0–9, Use Digits for 10+

| ❌ Wrong | ✅ Correct |
|---|---|
| The method accepts 3 parameters. | The method accepts three parameters. |
| There are fifteen columns. | There are 15 columns. |
| Add 1 row to the table. | Add one row to the table. |

### Exceptions — Always Use Digits For:

- Measurements and units: 5 px, 8 MB, 3 seconds
- Version numbers: version 2.0, .NET 8
- Code-adjacent values: set the value to 0, index 5
- Percentages: 5%, 99%
- Negative numbers: -1, -5

### Ranges

Use an **en dash** (–) without spaces for number ranges: pages 10–25, versions 2.0–3.0

## Punctuation

### Oxford Comma (Serial Comma)

Always use the Oxford comma — place a comma before "and" or "or" in a list of three or more items.

| ❌ No Oxford comma | ✅ With Oxford comma |
|---|---|
| The API supports PDF, DOCX and XLSX. | The API supports PDF, DOCX, and XLSX. |
| You can export, print or save. | You can export, print, or save. |

### Periods

- End all complete sentences with a period, including list items that are complete sentences.
- Do not use a period after sentence fragments, headings, or UI labels.

### Colons

- Use a colon to introduce a list, code block, or explanation.
- The introductory sentence before a list must end with a colon.
- Capitalize the first word after a colon only if it starts a complete sentence.

### Semicolons

Avoid semicolons in documentation. Split into two sentences instead.

### Hyphens and Dashes

| Symbol | Name | Usage |
|--------|------|-------|
| `-` | Hyphen | Compound modifiers before a noun: "well-known method", "read-only property" |
| `–` | En dash | Number ranges: "pages 10–25". Use `&ndash;` in HTML |
| `—` | Em dash | Parenthetical statements — use sparingly |

### Quotation Marks

- Use **straight double quotes** (`"`) for UI strings and direct quotes.
- Place periods and commas **inside** closing quotation marks (US English style).
- Place colons and semicolons **outside** closing quotation marks.

## Prepositional Phrases

Use the correct preposition for each context:

| Context | Correct preposition | Example |
|---------|---------------------|---------|
| Dialog boxes | **in** | In the Export dialog box |
| Pages, screens | **on** | On the Settings page |
| Menus | **on** | On the File menu |
| Tabs | **on** | On the General tab |
| Command line | **at** | At the command line |
| Lists, panels | **in** | In the Properties panel |
| Toolbars | **on** | On the toolbar |
| Applications | **in** | In the application |

## Prefixes

Most prefixes do **not** require a hyphen. Attach them directly to the root word:

| ❌ Hyphenated | ✅ No hyphen |
|---|---|
| non-zero | nonzero |
| pre-defined | predefined |
| re-use | reuse |
| co-exist | coexist |
| multi-threaded | multithreaded |

**Exceptions — use a hyphen when:**
- The prefix ends with the same letter the root word starts with: re-enter, co-opt
- The root word is capitalized: non-English, pre-Windows
- The root word is a number: pre-2020
- Omitting the hyphen causes confusion: re-cover (cover again) vs. recover

## Word Replacement Table

Replace complex, formal, or verbose words with their simpler alternatives. For the full table, read the reference file at `references/word-replacements.md`.

Key replacements (most common):

| ❌ Avoid | ✅ Use instead |
|---|---|
| utilize, utilization | use |
| via | through, with, by using |
| leverage | use |
| in order to | to |
| prior to | before |
| subsequent, subsequently | next, after, later |
| commence | start, begin |
| terminate | stop, end |
| facilitate | help, enable |
| indicate | show, display, point to |
| functionality | feature, capability |
| upon | on, after |
| whereas | but, while |
| whilst | while |
| furthermore | also |
| however | but (at sentence start, "However," is acceptable) |
| therefore | so |
| additional | more, extra |
| regarding | about |
| numerous | many |
| sufficient | enough |
| obtain | get |
| provide | give |
| perform | do, run, carry out |
| demonstrate | show |
| currently | now |
| previously | before |
| subsequently | then, next |
| ensure | make sure, verify |
| enable | let, allow |
| disable | turn off |
| specify | enter, type, set |
| select | choose, pick (except for UI actions — see brand-terms skill) |
| component | part |

## Quick Checklist

When reviewing an article for grammar and word choice, verify:

- [ ] Modal verbs: "must/can/will" instead of "should/could/would"
- [ ] No unacceptable contractions (you'll, it's, won't, etc.)
- [ ] Plural nouns for general descriptions; singular only for specific instances
- [ ] Numbers 0–9 spelled out; 10+ as digits
- [ ] Oxford comma in all lists of three or more items
- [ ] En dash for ranges, hyphens for compound modifiers
- [ ] Correct prepositions (in a dialog, on a page, at the command line)
- [ ] No unnecessary hyphens with prefixes
- [ ] Complex words replaced with simpler alternatives
- [ ] Periods and commas inside quotation marks
