---
title: Accessibility Audit Report – Telerik Reporting Documentation
description: Baseline static-source accessibility audit of the Telerik Reporting documentation.
published: false
---

# Accessibility Audit Report – Telerik Reporting Documentation

**Audit date:** 2026-10-21
**Repository:** [telerik/reporting-docs](https://github.com/telerik/reporting-docs)
**Documentation site:** [Telerik Reporting documentation](https://www.telerik.com/documentation/reporting)

## Executive Summary

The repository contains useful accessibility information for the HTML5-based, Windows Forms, and WPF report viewers, and explains accessible report-item descriptions and tagged PDF output. It also includes practical keyboard shortcuts, known limitations, and accessibility-related APIs.

The overall assessment is **mixed, with important documentation and product-coverage gaps**. The most significant risks are that the Native Blazor viewer is explicitly documented as lacking accessibility functionality; customer guidance for authoring and validating accessible reports is spread across several articles; and one getting-started tutorial prescribes a text/background color combination with insufficient contrast. The general web accessibility article cites WCAG 2.0, while the repository's audit guidance uses WCAG 2.1 Level AA.

This is a **static-source baseline, not a conformance assessment**. The audit did not test the live documentation site, viewer behavior, generated PDFs, or assistive-technology/browser combinations. No WCAG conformance or legal compliance claim should be inferred from this report.

### Method and scope

At the start of the audit, the repository contained 1,538 Markdown files. A broad pattern scan covered 1,501 editorial Markdown files after excluding `_assetsApi`, `doc-output`, translation resources, and skill reference Markdown; manual review sampled getting-started, report authoring, report viewers, export, designer, knowledge-base, and accessibility articles. The review followed the eight criteria in [the repository accessibility audit skill](.github/skills/accessibility-doc-optimization/SKILL.md): headings, alternative text, links, tables, plain language, formatting independence, callouts, and code blocks.

The findings below distinguish documentation defects from product limitations and missing product guidance. Counts from pattern scans are indicators for triage, not a substitute for reviewing each rendered page.

## Documentation Accessibility Findings

### 1. The Native Blazor viewer is documented as lacking accessibility functionality

**Severity:** High

**Description:** The Native Blazor viewer overview states that it is missing the accessibility functionality available in the Blazor wrapper and that the functionality is planned for a future release. This is an explicit product limitation, not merely an omission in the docs.


**Affected Files/Pages**

- [Native Blazor Report Viewer overview](embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview.md#L68-L72)
- [Web application accessibility overview](embedding-reports/display-reports-in-applications/web-application/accessibility.md)

**Impact:** Customers may select the Native Blazor viewer without realizing that the wrapper and native viewer have different accessibility support. Users of assistive technology may consequently encounter a viewer that does not provide the documented accessibility functionality.


**Recommendation:** Keep the limitation prominent and current, link it from Native Blazor setup and viewer-comparison pages, and document an accessible alternative for customers who require those features. Update the statement when product support changes; do not imply the wrapper guidance applies to the native component unless verified.


**Examples:** The overview says the Native Blazor component is missing the `Accessibility` functionality and that it will be added in a future release (lines 68–72).


### 2. Accessibility guidance is outdated and some viewer workarounds need revalidation

**Severity:** Medium

**Description:** The web accessibility overview identifies WCAG 2.0 as its guideline reference. The Axe knowledge-base article also describes WCAG 2.0 and screen-reader testing, but its examples and reported browser/screen-reader issues are dated. It instructs readers to change every page `tabindex` to `0` and suggests removing the document map's `navigation` role; these broad workarounds should be revalidated so they do not change focus order or remove useful semantics. The documentation does not give readers a current, versioned matrix of supported browsers, assistive technologies, and tested viewer versions. The web overview also says accessibility should be enabled conditionally according to users' needs, although the setting defaults to `false`.


**Affected Files/Pages**

- [Web application accessibility overview](embedding-reports/display-reports-in-applications/web-application/accessibility.md#L20-L24)
- [Web accessibility setup and opt-in guidance](embedding-reports/display-reports-in-applications/web-application/accessibility.md#L26-L38)
- [Axe accessibility troubleshooting article](knowledge-base/how-to-fix-axe-errors-for-html5-viewer.md#L28-L37)
- [Axe article's proposed focus and landmark workarounds](knowledge-base/how-to-fix-axe-errors-for-html5-viewer.md#L67-L96)
- [Web viewer overview's known-issues table](embedding-reports/display-reports-in-applications/web-application/accessibility.md#L73-L86)
- [Windows Forms accessibility](embedding-reports/display-reports-in-applications/windows-forms-application/accessibility.md#L22-L24)
- [WPF accessibility](embedding-reports/display-reports-in-applications/wpf-application/accessibility.md#L22-L24)

**Impact:** Readers cannot tell which accessibility target or current combinations of browsers and assistive technologies informed the support claims. Old test results may be mistaken for current guarantees; blanket remediation instructions can also create new keyboard or landmark problems. Conditional enablement may leave users without the feature unless they know to request it.


**Recommendation:** State the WCAG version and conformance target the product documentation intends to address, and review references against current policy. Maintain a dated test matrix with viewer/product versions, browsers, assistive technologies, and known limitations. Re-test the Axe workarounds against current markup and explain any side effects; do not advise broad DOM changes without documenting their focus and landmark consequences. Explain the default-off setting and performance trade-off without implying that accessibility should be enabled only for users who disclose a need. Keep product capability statements separate from a VPAT or a claim of full conformance; the existing web article's VPAT disclaimer is a useful model.


**Examples:** The web overview links to WCAG 2.0; the Axe article cites a 2017 introduction and recommends changing all `[tabindex]` attributes to `0` or removing a navigation role. It says Narrator and JAWS were used but does not state their versions or a current browser matrix.


### 3. The getting-started tutorial recommends a low-contrast text/background pairing

**Severity:** Medium

**Description:** The first-report tutorial sets the table background and border color to RGB `34, 181, 115`, then instructs readers to set the table-header text to white. The contrast ratio for white against `#22b573` is approximately **2.65:1**, below the WCAG AA 4.5:1 minimum for normal text.


**Affected Files/Pages**

- [Designing Your First Telerik Report](getting-started/first-steps-designing.md#L99-L117)

**Impact:** Readers following the tutorial may create report headers that are difficult to read for users with low vision or color-vision differences. This is an example in beginner content and can be copied into production reports.


**Recommendation:** Replace the color pair with one that meets the applicable contrast target, or show how to select and verify a compliant pair. Add a brief report-authoring note explaining that contrast needs to be checked for the final foreground/background combination rather than inferred from color names.


**Examples:** Lines 105–109 specify the RGB background and white header text. The ratio above was calculated from those documented sRGB values using the WCAG relative-luminance contrast formula.


### 4. Viewer accessibility feature tables have no meaningful column headers

**Severity:** Medium

**Description:** The feature-summary tables in the web, Windows Forms, and WPF accessibility pages begin with empty header cells. The web page also places extensive lists and explanations inside individual table cells. In the knowledge base, an Environment table uses data cells for both labels and values without header cells or row-header semantics.


**Affected Files/Pages**

- [Web application accessibility overview](embedding-reports/display-reports-in-applications/web-application/accessibility.md#L40-L48)
- [Windows Forms accessibility](embedding-reports/display-reports-in-applications/windows-forms-application/accessibility.md#L39-L47)
- [WPF accessibility](embedding-reports/display-reports-in-applications/wpf-application/accessibility.md#L44-L52)
- [Axe accessibility troubleshooting article](knowledge-base/how-to-fix-axe-errors-for-html5-viewer.md#L13-L25)

**Impact:** Assistive technologies may announce blank or unhelpful column headings, making it harder to understand which feature a cell describes. Label/value tables without header semantics can also lose their relationships in screen-reader table navigation.


**Recommendation:** Give each data table concise, descriptive headers (for example, “Feature” and “How it works”), or replace prose-heavy feature tables with headings and lists. Use row headers for label/value tables, or convert them to labeled lists. Verify the rendered HTML exposes the intended table headers.


**Examples:** The three viewer feature tables start with `|   |   |` or equivalent blank header text. The Axe article's Environment table uses `<td>` for “Product Version” and “Product” rather than header cells.


### 5. Accessible-report authoring and testing advice is fragmented

**Severity:** Medium

**Description:** The documentation explains `AccessibleDescription`, `AccessibleRole`, viewer keyboard shortcuts, and some PDF structure behavior, but the guidance is distributed across viewer, rendering, API, and report-item pages. No single task-oriented guide brings together accessible report structure, meaningful descriptions for charts and images, tables/crosstabs, keyboard-accessible interactions, contrast, export, and verification.


**Affected Files/Pages**

- [Web application accessibility overview](embedding-reports/display-reports-in-applications/web-application/accessibility.md#L50-L71)
- [PDF rendering design considerations](styling/rendering-and-paging/design-considerations-for-report-rendering/pdf-rendering-design-considerations.md#L123-L141)
- [Exclude report items from accessibility trees](designing-reports/exclude-report-items-from-accessibility-tree.md)
- [Report item documentation](report-items/)
- [Report designer documentation](designing-reports/report-designer-tools/)

**Impact:** Report authors may learn how a particular property is emitted without learning how to create a coherent, usable reading order or how to test the complete report. Users may receive chart, map, image, or interactive content without an equivalent description or usable interaction path.


**Recommendation:** Create a discoverable “Create accessible reports” guide and link it from report design, report-item, viewer, and export overviews. Include practical examples for report titles and language, reading order, accessible descriptions for non-text content, table/crosstab headers, interactive actions, color contrast, and checking representative output with keyboard and screen-reader workflows. Identify supported behavior versus author responsibility and known limits.


**Examples:** The web overview describes generated labels and roles for rendered content, while the PDF page discusses descriptions for PictureBox, Graph, and Map items. These are useful building blocks, but they are not an end-to-end authoring and testing workflow.


### 6. PDF/UA guidance explains output features but not how to verify the resulting document

**Severity:** Medium

**Description:** PDF rendering documentation describes enabling accessibility, tagged contents, non-text descriptions, annotations, document title and language, and ignored items. It also notes a warning about merged table cells. However, the guidance does not provide a step-by-step accessible PDF workflow or explain how customers should validate the generated document, interpret checker results, or distinguish an enabled tagging option from verified conformance.


**Affected Files/Pages**

- [PDF rendering design considerations](styling/rendering-and-paging/design-considerations-for-report-rendering/pdf-rendering-design-considerations.md#L123-L141)
- [PDF device information settings](doc-output/configure-the-export-formats/pdf-device-information-settings.md)
- [Web application accessibility overview](embedding-reports/display-reports-in-applications/web-application/accessibility.md#L26-L38)

**Impact:** Customers may treat enabling `EnableAccessibility` as proof that each report is fully accessible, even when content descriptions or structure need author attention. The warning about merged cells does not tell users how to assess or address the resulting output.


**Recommendation:** Add a task-based PDF/UA guide that covers the relevant setting, report metadata and language, author-provided descriptions, known limitations, and a repeatable validation workflow using appropriate PDF accessibility tools and manual review. Describe the scope of product output precisely and avoid a blanket conformance claim unless supported by current evidence. Clarify which other export formats have accessibility support and which have known limitations.


**Examples:** The PDF page lists document title and natural language fallbacks and calls out merged-cell warnings, but it does not link to a validation procedure.


### 7. Untagged fenced blocks recur in knowledge-base content

**Severity:** Low

**Description:** A repository-wide pattern scan found 133 fenced-block openings without a language tag in 106 of the 1,501 editorial Markdown files scanned. This includes both code/command examples and literal error output. The skill recommends annotating every fenced block so its content type is identifiable.


**Affected Files/Pages**

- [Install libgdiplus on CentOS/Amazon Linux](knowledge-base/how-to-install-libgdiplus-centos-amazon-linux.md#L34-L55)
- [Custom error messages for web-based viewers](knowledge-base/display-custom-error-messages-on-web-based-viewer.md#L28-L40)
- Other knowledge-base and setup articles identified by the scan

**Impact:** Language-aware tools cannot identify code reliably, and screen-reader users may receive less helpful pronunciation or navigation. Readers may also have difficulty distinguishing shell commands from output.


**Recommendation:** Add an appropriate language tag such as `bash`, `text`, or `csharp` to each opening fence. Use `text` for literal output and explain placeholders and expected results where relevant. Add a Markdown check for untagged opening fences, with an explicit exception mechanism only if the documentation platform requires it.


**Examples:** The libgdiplus article uses untagged fences around `yum` commands and exception output; the custom-error article fences literal error messages without a `text` tag.


### 8. Several links use “here” as their only link text

**Severity:** Low

**Description:** Generic link text occurs in knowledge-base examples and API reference tables. The destination may be understandable from surrounding prose, but the link itself does not identify its purpose when encountered in a links list.


**Affected Files/Pages**

- [Move the Parameters Area](knowledge-base/how-to-move-parameters-area.md#L81-L83)
- [Custom NumericTextBox parameter editor](knowledge-base/use-kendonumerictextbox-widget-to-create-custom-parameter-editor.md#L73)
- [Angular viewer options](embedding-reports/display-reports-in-applications/web-application/angular-report-viewer/api-reference/options.md#L54-L57)
- Other knowledge-base articles with generic “here” links

**Impact:** Screen-reader users navigating links out of context hear repeated, non-distinct “here” links and must return to the surrounding sentence to infer each destination.


**Recommendation:** Make the linked text describe the resource or action: for example, “download the sample application” or “read the accessibility overview.” Search for generic link labels such as “here,” “click here,” and “more” during content reviews.


### 9. Some screenshot alternative text includes non-descriptive UI marker characters

**Severity:** Low

**Description:** Most sampled Markdown images have non-empty alt text, and many describe the screenshot's purpose. A recurring template suffix, `><`, appears in some screenshot alt values and adds punctuation without explaining the visual state or action.


**Affected Files/Pages**

- [Configure report templates](designing-reports/report-designer-tools/web-report-designer/configuring-report-templates.md#L56-L74)
- [Web Report Designer user guide](wrd-user-guide/report-templates.md)
- Other Web Report Designer screenshot pages using the same suffix pattern

**Impact:** Screen-reader users may hear unexplained punctuation, and the alt text may still fail to convey the important difference shown in the screenshot. A caption such as “Restricted User” does not necessarily describe the visible controls or state.


**Recommendation:** Replace the marker with concise descriptions of the relevant UI state or action. Where the adjacent caption already identifies the screenshot, ensure the alt text adds useful visual information rather than repeating it. Preserve empty alt only for images confirmed to be decorative.


**Examples:** The report-template page uses alt values such as “Restricted User From Template ><” and “Allowed User Assets Manager ><”.


### 10. Video articles do not point to a transcript or describe caption availability

**Severity:** Low

**Description:** The onboarding article embeds videos with descriptive iframe titles, which is helpful, but the page does not provide a transcript or state how users can access captions or an equivalent text version. This audit did not inspect the videos themselves or verify their caption tracks.


**Affected Files/Pages**

- [Video onboarding](getting-started/video-onboarding.md#L19-L27)
- [HTML5 Report Viewer overview](embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/overview.md)

**Impact:** People who are deaf or hard of hearing, cannot play embedded media, or need to search/review material as text may not have an equivalent learning path.


**Recommendation:** Verify captions on each embedded video and link to a transcript or equivalent step-by-step written instructions. Keep the iframe title and ensure the media can be operated by keyboard.


## Accessibility Documentation Coverage Assessment

| Area | Current coverage | Gap and recommendation |
|---|---|---|
| HTML5 viewer and wrappers | A shared accessibility overview documents `enableAccessibility`, keyboard shortcuts, labels/roles, and known issues. Angular options link to the overview. | Add a current browser/assistive-technology support matrix, verify wrapper-specific instructions, and make the opt-in behavior and limitations easy to find in each relevant setup path. |
| Native Blazor viewer | Its overview explicitly states that accessibility functionality is missing. | Maintain a prominent limitation and accessible alternative until product support is delivered. |
| Native Angular and other integrations | Framework documentation exists, but the shared overview does not establish framework-by-framework coverage or testing. | Publish a per-integration support table. Confirm status before asserting support or lack of support for Native Angular, React, MVC, Web Forms, or other integrations. |
| Windows Forms and WPF | Dedicated articles describe keyboard shortcuts, accessible descriptions, viewer areas, and known issues. | Refresh standards and tested AT/browser/platform versions, and link a consistent report-authoring and output-testing guide. |
| Report designers | Designer documentation is extensive, but no dedicated screen-reader/keyboard accessibility guide for the standalone, Visual Studio, or Web Report Designer was found in the reviewed sources. | Document supported keyboard and assistive-technology workflows, known limitations, and accessible ways to perform common authoring tasks—or state the support status clearly. |
| PDF export | PDF documentation describes `EnableAccessibility`, tagged content, document metadata, and some limitations. | Add a practical PDF/UA generation and validation workflow. |
| Other export formats | Export documentation lists multiple formats; the reviewed accessibility material focuses on HTML and PDF. | Clarify accessibility behavior and limitations for each supported export format rather than implying PDF guidance applies to all outputs. |
| Report items and interactions | General accessible-description guidance mentions images, maps, charts, tables, crosstabs, and interactive actions. | Add item-specific advice for charts, tables/crosstabs, maps, barcodes, images, and interactive actions, including examples and accessible alternatives. |
| Compliance material | The web overview says it may support VPAT reviews and correctly states that it is not itself a VPAT or legal compliance statement. | Link current, product-version-specific compliance material where available and keep support claims evidence-based. |

## Accessible Reporting Guidance Review

The documentation has useful components: it explains how `AccessibleDescription` contributes to labels; describes keyboard navigation in several viewers; documents roles and ignored content; and identifies document title, language, and tagged content in PDF output.

The gap is the lack of a single end-to-end workflow for authors. The reviewed content does not bring together how to establish a logical reading order, provide useful chart and image descriptions, structure tables/crosstabs, make interactive report actions usable without a mouse, check contrast, select export settings, and test the rendered result. The first-report tutorial is a concrete example where color selection should be validated rather than prescribed without a contrast check.

Prioritize a report-authoring guide that:

- Explains how authors control reading order, titles, document language, and accessible descriptions.
- Provides examples for charts, maps, images, tables, crosstabs, and interactive report items.
- Covers visual contrast and avoiding color-only distinctions.
- Separates HTML viewer and exported-document behavior, including PDF/UA limitations.
- Provides a repeatable keyboard, screen-reader, and output-validation checklist and links to known issues.

## Repository-Wide Improvement Opportunities

1. **Add an accessibility authoring checklist to contributor guidance.** The [README contribution instructions](README.md#L32-L57) ask authors to use standard Markdown and preview changes, but do not mention alt text, heading order, descriptive links, table headers, code-fence languages, callouts, or video alternatives.
2. **Add automated source checks.** The scan found 133 untagged fenced-block openings in 106 editorial files and recurring generic link labels and screenshot marker suffixes. Checks should flag these patterns and guide authors to review, not automatically rewrite, context-sensitive content.
3. **Check rendered HTML as well as Markdown.** In particular, confirm table headers and row headers, image alternatives, heading structure, iframe titles, and callout semantics survive the documentation build.
4. **Add accessibility review checkpoints to documentation pull requests.** Require authors to check descriptive image text, link purpose, table semantics, keyboard-operable demos/media, color-dependent instructions, and non-HTML exports when relevant.
5. **Create reusable templates.** Provide report/viewer feature pages with sections for keyboard use, screen-reader behavior, settings, supported combinations, known issues, and verification steps; provide a separate accessible-report authoring template.
6. **Maintain versioned product guidance.** Assign an owner to refresh WCAG references, viewer support matrices, screen-reader limitations, and PDF/UA statements when product behavior changes.

## Positive Findings

- Dedicated accessibility articles exist for HTML5-based viewers, Windows Forms, and WPF.
- The web accessibility overview explains keyboard shortcuts, accessible labels/roles, localization, and known limitations.
- The PDF rendering article describes tagged content, descriptions for non-text items, annotations, title/language metadata, and an important merged-cell caveat.
- The documentation explicitly warns that the web accessibility overview is not a VPAT or legal compliance statement.
- The Native Blazor overview is transparent about its current accessibility limitation rather than implying unsupported parity.
- In the sampled getting-started and design articles, many image alternatives describe the screenshot's task or content. The static scan found no empty Markdown image alt values in the scanned editorial files; qualitative usefulness still requires human review.
- Report Viewer overview pages use descriptive iframe titles for the sampled embedded videos.

## Prioritized Remediation Plan

### Immediate Actions

1. Correct the low-contrast white-on-green styling in the first-report tutorial and add contrast-selection guidance.
2. Keep the Native Blazor viewer's accessibility limitation prominent and point users to an accessible alternative.
3. Fix blank feature-table headers in the web, WPF, and Windows Forms accessibility pages.
4. Review the Axe troubleshooting article's recommendations and known-issue details for current accuracy before directing customers to use them.

### Short-Term Improvements

1. Publish a practical accessible-report authoring guide and link it from designer, viewer, report-item, and export pages.
2. Add a PDF/UA generation and validation workflow, including the scope and limitations of generated tags.
3. Refresh WCAG references and document a dated viewer/browser/assistive-technology test matrix.
4. Replace generic “here” links, remove unexplained `><` alt-text suffixes, and add language tags to untagged fenced blocks.
5. Provide transcripts or equivalent written content for embedded training videos and verify captions.

### Long-Term Improvements

1. Establish accessibility support documentation for each viewer and designer integration, with explicit distinctions between HTML5 wrappers and native viewers.
2. Document accessibility behavior and known limitations across all export formats and report-item categories.
3. Add rendered-site accessibility testing and an authoring checklist to the documentation contribution workflow.
4. Re-audit representative pages and product outputs with keyboard-only use, screen readers, contrast checks, and PDF accessibility tools; track the results by product version.
