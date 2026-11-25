---
title: Hiding Print and Export Buttons in the Angular Report Viewer
description: Learn how to hide the Print and Export buttons in the Angular Report Viewer with CSS.
type: how-to
page_title: Hide Print and Export Buttons in the Angular Report Viewer
slug: hiding-print-and-export-buttons-in-angular-report-viewer
tags: angular,report viewer,print,export,toolbar
res_type: kb
ticketid: 1718837
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 20.3.26.1110 | Angular Report Viewer |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

The Angular Report Viewer does not provide an option to hide the Print and Export toolbar buttons per report. You can hide these commands with CSS selectors that target the viewer toolbar.

## Solution

Add the following rules to the Angular application's global stylesheet, such as `styles.scss`:

```css
[data-command='export'],
[data-command='print'],
#export-dropdown {
	display: none !important;
}
```

The rules hide the Export command, the Print command, and the Export Dropdown. To apply the workaround only to selected reports, load or toggle these rules when the report source changes.

## Notes

This workaround targets the command names rendered by the Angular Report Viewer. Verify the selectors after upgrading the viewer because toolbar markup and command attributes can change between versions.

## See Also

- [Selective export of Angular Report Viewer reports]({%slug how-to-customize-export-options-of-angular-report-viewer%})
- [Hide/Change HTML5 Report Viewer toolbar buttons]({%slug hide-or-change-html5-report-viewer-toolbar-buttons%})
