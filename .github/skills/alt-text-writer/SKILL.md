---
name: alt-text-writer
description: "Writes or improves alt text for documentation screenshots and images. Use when: adding new images to articles, auditing existing images for accessibility, reviewing alt text quality, fixing empty alt text placeholders. Generates descriptive alt text following the Progress Style Guide rule that alt text must be a sentence, not a file name."
---

# Alt Text Writer

Generate and improve alt text for Telerik Reporting documentation images following the Progress DevTools Style Guide.

> Alt text is a descriptive sentence, not the file name.

## Writing Alt Text

1. View the image.
2. Write a single sentence: **[UI element/area] [showing/displaying/with] [specific detail or action context]**.
3. Insert into markdown: `![Alt text sentence here.](images/filename.png)`

**Do:** Start with the most important noun. Include product/tool name when not obvious. Mention specific UI labels, property names, wizard steps. Use present tense. Keep 10-30 words. End with a period.

**Don't:** Use the file name. Start with "Image of..." / "Screenshot of...". Repeat surrounding text. Describe decorative elements. Use markdown formatting inside alt text.

## Flagging Bad Alt Text

Flag images with: empty alt text `![](...)`, filename-only alt text, fewer than 4 words, or missing verb/context. View the image and rewrite.

## Examples

| Context | Bad | Good |
|---------|-----|------|
| SQL wizard | `![](images/3.PNG)` | `![The Data Connection step of the SqlDataSource Wizard with AdventureWorks selected.](images/3.PNG)` |
| Install wizard | `![Finish Step](images/installWizard5.png)` | `![The final step of the Telerik Reporting Installation Wizard confirming successful setup.](images/installWizard5.png)` |
| Report preview | `![DemoReportInViewer](images/DemoReportInViewer.PNG)` | `![The Demo Report rendered in the HTML5 Report Viewer showing the product catalog layout.](images/DemoReportInViewer.PNG)` |

## Special Cases

- **Annotated screenshots**: describe what the annotation points to, not the annotation itself.
- **Charts/graphs**: describe chart type, data shown, and visible trend.
- **Error dialogs**: include the error text or key phrase.
- **Before/after**: use "before" or "after" to clarify which state is shown.

## `><` Convention

Many articles append `><` inside alt text — this is a **docs-builder display convention** (sets `img-max-width: 80%`). When present, keep it. When writing alt text for images that have it, place `><` at the end:
```markdown
![Alt text sentence here. ><](images/filename.png)
```

## Limitations

- If an image file is missing or corrupted, use `TODO(author): add alt text after verifying image`.
- For dense diagrams, describe overall structure and purpose, not every label.
