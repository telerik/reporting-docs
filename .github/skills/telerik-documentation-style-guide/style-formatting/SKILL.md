---
name: style-formatting
description: "Use this skill when formatting documentation elements such as UI labels, code references, keyboard shortcuts, file paths, menu sequences, notes, tips, cautions, code blocks, screenshots, and command-line instructions. Covers bold for UI elements, monospace for code and keys, italic for new terms, note/tip/important admonition syntax, screenshot guidelines, and code comment rules. Read this skill whenever formatting inline elements in documentation, adding admonitions (notes/tips/cautions), formatting code examples, inserting screenshots, or reviewing element formatting consistency. Also use when asked to 'format the article', 'fix formatting', 'add a note', 'add a screenshot', or 'check code blocks'."
---

# Element Formatting, Admonitions, and Visual Content

This skill defines how to format inline elements, admonitions (notes, tips, cautions), code blocks, screenshots, and command-line instructions in Progress DevTools documentation.

## Why Consistent Formatting Matters

Consistent formatting acts as a visual language — readers learn to recognize bold as a UI element, monospace as code, and italic as a new term. Breaking these conventions forces readers to re-evaluate what each piece of text means.

## Inline Element Formatting

### UI Elements — Bold

Format all **user interface element names** in bold. This includes button labels, menu names, dialog box titles, tab names, checkbox labels, field names, and window titles.

```markdown
Click **Export** to save the document.
In the **Format Options** dialog box, select **PDF**.
On the **General** tab, clear the **Enable Logging** checkbox.
```

**Bold syntax**: Always use asterisks to format bold text (`**bold text**`). Do not use the underscore syntax (`__bold text__`), which renders identically but reduces source readability and is inconsistent with the rest of the codebase.

| ❌ Wrong | ✅ Correct |
|---|---|
| `__Export__` | `**Export**` |
| `__Format Options__` | `**Format Options**` |

### Code References — Monospace

Format code elements in `monospace` (backticks). This includes **any mention of an API type, method, property, or member**, as well as enum values, parameters, file names, file extensions, XML/HTML tags, API endpoints, namespaces, and inline code expressions. Every API reference — no matter how brief — must appear in monospace.

```markdown
Call the `Export()` method to generate the output.
Set the `IsReadOnly` property to `true`.
The `RadFixedDocument` class represents a PDF document.
Open the `appsettings.json` file.
Use `TableCell` to access individual cells in a table.
```

| ❌ Wrong | ✅ Correct |
|---|---|
| The TableCell object stores cell content. | The `TableCell` object stores cell content. |
| Call GetValue() to retrieve the result. | Call `GetValue()` to retrieve the result. |
| The RadFlowDocument class is the root object. | The `RadFlowDocument` class is the root object. |

### New Terms — Italic

Format a term in *italic* on its first occurrence in an article when introducing it as a concept. Do not italicize the term on subsequent occurrences.

```markdown
A *content stream* defines the visual content of a PDF page. The content stream
contains drawing operators that render text, images, and shapes.
```

### Keyboard Keys — Monospace

Format individual keyboard keys in monospace. Use `+` to combine keys in a keyboard shortcut. Do not add spaces around `+`.

```markdown
Press `Enter` to confirm.
Press `Ctrl`+`S` to save the document.
Press `Ctrl`+`Shift`+`P` to open the command palette.
```

### File Paths — Monospace

Format file paths in monospace:

```markdown
Navigate to `C:\Program Files\Telerik\`.
The configuration file is located at `/etc/app/config.json`.
```

### Menu Sequences — Bold with Angle Brackets

Format menu navigation sequences with bold for each element and `>` as separator:

```markdown
Go to **File** > **Export** > **PDF**.
Select **Tools** > **Options** > **General**.
```

### Parameter Names in Instructions

When documenting command-line tools, use **bold** for literal parts (type exactly as shown) and *italic* for placeholders (user-supplied values):

```markdown
**dotnet** **add** **package** *package-name* **--version** *version-number*
```

## Admonitions (Notes, Tips, Cautions)

Admonitions highlight important information that stands apart from the main text. Use the blockquote-based syntax specific to this documentation platform.

### Note

Use for supplementary information the reader should be aware of:

```markdown
> A note provides additional context that may be useful but is not critical to the task.
```

Renders with a blue "Note" label.

### Tip

Use for helpful suggestions that improve the reader's experience:

```markdown
>tip A tip provides a useful suggestion or shortcut.
```

Renders with a green "Tip" label.

### Important / Caution

Use for warnings about potential issues, data loss, or breaking changes:

```markdown
>important An important note warns about potential issues or required prerequisites.
```

Renders with an orange/red "Important" label.

### Admonition Rules

- Place admonitions **after** the paragraph they relate to, not before.
- Do not stack multiple admonitions consecutively — separate them with regular text.
- Keep admonition text concise — one to three sentences.
- Do not use admonitions for routine information that belongs in the main text.
- A note that applies to every reader is probably not a note — it is main content.

## Code Blocks

### Fenced Code Blocks with Language

Always specify the language identifier after the opening triple backticks. The repository accepts both `csharp` and `C#` (and both `vb` and `VB.NET`) for the corresponding languages:

````markdown
```csharp
RadFixedDocument document = new RadFixedDocument();
```
````

Common language identifiers: `csharp`, `xml`, `json`, `html`, `css`, `javascript`, `typescript`, `powershell`, `bash`, `sql`

### Code Block Rules

1. **Complete, runnable examples** — Show enough context so the reader can understand the code without guessing the surrounding context.
2. **No line numbers in markdown** — The rendering engine adds line numbers if needed.
3. **No trailing whitespace** — Remove trailing spaces from code lines.
4. **Consistent indentation** — Use 4 spaces for C# code, 2 spaces for XML/JSON/HTML.
5. **Meaningful variable names** — Use descriptive names, not single letters (except loop counters).

### Code Comments in Examples

When code examples include comments:

- Write comments in **English**.
- Keep comments to **80 characters or fewer** per line.
- Use full sentences starting with a capital letter and ending with a period.
- Comment only what is not obvious from the code itself.

```csharp
// Create a new document and add a blank page.
RadFixedDocument document = new RadFixedDocument();
RadFixedPage page = document.Pages.AddPage();

// Set the page size to A4 landscape.
page.Size = new Size(842, 595);
```

## Screenshots

Screenshots complement text but do not replace it. Always describe the action or result in text before or after the screenshot.

### Screenshot Requirements

| Rule | Specification |
|------|--------------|
| Appearance | Default theme, default font size, no custom themes |
| Background | White or the application's default background |
| Size | Maximum 1000 pixels wide |
| Format | PNG for UI screenshots, SVG for diagrams |
| Annotations | Arrows to point, boxes to surround areas of interest |
| Annotation style | Arial 16pt, primary color `#f56147` (Telerik red-orange) |
| Cropping | Show only the relevant portion; remove browser chrome and taskbars unless they are relevant |
| Personal data | Remove or redact any personal information, real email addresses, or real user names |

### Screenshot Placement

```markdown
The **Export** dialog box provides options for the output format and file location.

![Export dialog box with format options highlighted](images/export-dialog.png)
```

- Place screenshots **after** the text that describes them.
- Use descriptive alt text that explains what the screenshot shows.
- Store screenshot files in an `images/` subdirectory relative to the article.

## Tables

### When to Use Tables

Use tables for structured data with two or more columns and three or more rows. Do not use tables for simple lists or single-column data.

### Table Formatting

- Include a header row with descriptive column names.
- Align content to the left (default).
- Keep cell content concise — avoid long paragraphs in table cells.
- Introduce every table with a sentence ending in a colon or period.

```markdown
The following table lists the supported export formats:

| Format | Extension | Description |
|--------|-----------|-------------|
| PDF | `.pdf` | Portable Document Format |
| DOCX | `.docx` | Microsoft Word document |
| XLSX | `.xlsx` | Microsoft Excel workbook |
```

## Quick Checklist

When reviewing an article for formatting, verify:

- [ ] UI elements (buttons, menus, tabs, fields) are in **bold**
- [ ] Bold uses `**` asterisk syntax, not `__` underscore syntax
- [ ] All API mentions (types, methods, properties, members) are in `monospace`
- [ ] Code elements (methods, classes, properties, file names) are in `monospace`
- [ ] New terms are in *italic* on first occurrence only
- [ ] Keyboard shortcuts use `Key`+`Key` format in monospace
- [ ] Menu sequences use **Menu** > **Item** format
- [ ] Notes use `>` syntax, tips use `>tip`, important items use `>important`, cautions use `>caution`, and warnings use `>warning`
- [ ] Admonitions follow related text, are concise, and are not stacked
- [ ] Code blocks specify the language identifier
- [ ] Code comments are English, ≤80 chars, full sentences
- [ ] Screenshots have descriptive alt text and are ≤1000px wide
- [ ] Tables have header rows and introductory text
