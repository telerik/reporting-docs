---
name: style-kb-faq
description: "Use this skill when writing, editing, or reviewing Knowledge Base (KB) articles or FAQ sections in documentation. Covers the three KB article types (how-to, troubleshooting, CVE/security), their title conventions (-ing form for how-to, problem statement for troubleshooting), required sections, customer context handling, content quality rules, and FAQ formatting (question headings, self-sufficient answers). Read this skill whenever creating a new KB article, converting customer support content into documentation, writing FAQ sections, or reviewing KB quality. Also use when asked to 'write a KB article', 'create a troubleshooting guide', 'add FAQ questions', 'write a how-to', or 'document a workaround'."
---

# Knowledge Base and FAQ Articles

This skill defines how to write Knowledge Base (KB) articles and FAQ sections in Progress DevTools documentation. KB articles address specific user problems or tasks; FAQs answer common questions concisely.

## KB Article Types

There are three types of KB articles, each with a distinct purpose and structure.

### 1. How-To Articles

How-to articles guide the reader through accomplishing a specific task.

**Title format**: Use an **-ing form** (gerund) that describes the task:
- ✅ "Exporting a Document to PDF with Custom Page Settings"
- ✅ "Merging Multiple DOCX Files into a Single Document"
- ❌ "How to Export a Document to PDF" (avoid "How to" in the title)
- ❌ "Export to PDF" (too terse; use -ing form)

**Required sections**:

```markdown
---
title: Exporting a Document to PDF with Custom Page Settings
description: Learn how to export a RadFixedDocument to PDF format with custom page sizes and margins using PdfFormatProvider.
type: how-to
page_title: Export Document to PDF with Custom Settings | Telerik Document Processing
slug: kb-export-pdf-custom-settings
tags: pdf, export, page-settings
---

# Exporting a Document to PDF with Custom Page Settings

## Environment

| Property | Value |
|----------|-------|
| Product | Telerik Document Processing |
| Version | 2024.1+ |

## Description

Brief description of the task and why a user might need to do it (1–3 sentences).

## Solution

Step-by-step instructions to accomplish the task. Include code examples.

1. First step with explanation.
2. Second step with explanation.

```csharp
// Complete, runnable code example.
```

## Notes

Optional section for caveats, limitations, or additional context.

## See Also

* [Related Article]({%slug related-slug%})
```

### 2. Troubleshooting Articles

Troubleshooting articles help readers diagnose and fix a specific problem.

**Title format**: Use a **sentence that states the problem**:
- ✅ "PdfFormatProvider Throws OutOfMemoryException for Large Documents"
- ✅ "Exported DOCX File Shows Incorrect Font Styles"
- ❌ "Fixing PDF Export Issues" (too vague; state the specific problem)
- ❌ "OutOfMemoryException" (too terse; describe the context)

**Required sections**:

```markdown
---
title: PdfFormatProvider Throws OutOfMemoryException for Large Documents
description: Resolve the OutOfMemoryException that occurs when exporting large documents to PDF using PdfFormatProvider.
type: troubleshooting
page_title: Fix OutOfMemoryException in PDF Export | Telerik Document Processing
slug: kb-pdf-export-oom-exception
tags: pdf, export, outofmemoryexception, troubleshooting
---

# PdfFormatProvider Throws OutOfMemoryException for Large Documents

## Environment

| Property | Value |
|----------|-------|
| Product | Telerik Document Processing |
| Version | 2024.1+ |

## Description

Describe the problem clearly. Include the error message, the conditions that trigger it, and what the user observes (2–4 sentences).

## Cause

Explain why the problem occurs. Be specific about the root cause (1–3 sentences).

## Solution

Step-by-step instructions to fix the problem. Include code examples.

## Notes

Optional section for workarounds, known limitations, or related issues.

## See Also

* [Related Article]({%slug related-slug%})
```

### 3. CVE / Security Articles

CVE articles document security vulnerabilities and their fixes. These follow a template provided by the security team. Key rules:

- Use the exact CVE identifier in the title.
- Include the severity rating and affected versions.
- Describe the vulnerability and its impact without providing exploit details.
- Link to the fix version and upgrade instructions.
- Do not speculate about attack vectors beyond what the CVE officially describes.

## KB Content Quality Rules

### Self-Sufficient Articles

Every KB article must be **self-sufficient** — a reader should be able to follow the article from start to finish without needing to open another article first. Reference other articles for supplementary context, but do not require them for the core task.

### Technical Accuracy

- All code examples must compile and run correctly.
- All file paths, class names, method names, and parameter names must be accurate.
- Version numbers must be current or explicitly noted as version-specific.
- Test all steps before publishing.

### Short, Simple, Clear

- Write short sentences (25 words or fewer).
- Use simple vocabulary (see the `style-grammar-words` skill).
- Maintain a clear, direct tone (see the `style-writing-tone` skill).
- Get to the solution quickly — readers arrive at KB articles with a problem to solve.

### Working Links

- All internal links must use the `{%slug ...%}` syntax.
- All external links must be verified and open in a new tab.
- No orphaned links — every link must point to a live, relevant destination.

### No Sensitive Information

- Do not include real customer names, email addresses, or company names.
- Redact or replace any personal information in code examples or screenshots.
- Use generic placeholder data: "john.doe@example.com", "Contoso Ltd.", "user123".

## Balancing Customer Context

KB articles often originate from customer support interactions. When converting a support case into a KB article:

1. **Generalize the problem** — Remove customer-specific details. Describe the problem in universal terms.
2. **Keep the scenario realistic** — While generalizing, preserve enough context so readers can recognize their own situation.
3. **Correct grammar and style** — Customer-submitted text may have errors. Fix grammar but preserve the technical meaning.
4. **Verify the solution** — Customer-provided workarounds may be suboptimal. Test and refine the solution before publishing.

| ❌ Too customer-specific | ✅ Generalized |
|---|---|
| John from Acme Corp reported that their PDF export fails when using their custom template with 500+ pages. | The PDF export fails when exporting documents with 500 or more pages that use custom templates. |
| The customer's WPF app was running on .NET Framework 4.5 and they had to upgrade to 4.8 to fix the issue. | Applications that target .NET Framework 4.5 may encounter this issue. Upgrade to .NET Framework 4.8 or later to resolve it. |

## FAQ Sections

FAQ sections answer common questions concisely within a feature article or as standalone FAQ pages.

### FAQ Formatting Rules

1. **Headings as questions** — Each FAQ item uses a heading formatted as a complete question with a question mark.

   ```markdown
   ## How Do I Export a Document to PDF?

   Use the `PdfFormatProvider` class to export...

   ## Can I Merge Multiple DOCX Files?

   Yes. Use the `RadFlowDocument` merge functionality...
   ```

2. **Title case for question headings** — Apply the same title case rules as all other headings (see the `style-structure` skill).

3. **Self-sufficient answers** — Each answer must stand alone. Do not refer to other FAQ items with "see above" or "as mentioned earlier."

4. **Concise answers** — Keep answers to 1–4 sentences. If the answer needs more detail, write a full article and link to it.

5. **Link to detailed articles** — When a full explanation exists elsewhere, give a brief answer and link to the detailed article.

   ```markdown
   ## How Do I Set Custom Page Margins?

   Use the `PageMargins` property of the `RadFixedPage` class. For step-by-step
   instructions, see [Configuring Page Layout]({%slug page-layout-configuration%}).
   ```

## Quick Checklist

When reviewing a KB or FAQ article, verify:

- [ ] Article type matches the content (how-to, troubleshooting, or CVE)
- [ ] Title uses the correct format (-ing form for how-to, problem statement for troubleshooting)
- [ ] All required sections are present (Environment, Description, Solution/Cause)
- [ ] Article is self-sufficient — no mandatory external dependencies
- [ ] Code examples compile and run
- [ ] No sensitive customer information
- [ ] All links work and use correct syntax
- [ ] FAQ headings are questions with question marks
- [ ] FAQ answers are concise and self-sufficient
- [ ] Description metadata is between 120 and 150 characters and unique
