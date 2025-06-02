---
title: Resolving "Cannot redefine property" Error in Telerik Reporting Version 19.1.25.521
description: Learn how to resolve the "Cannot redefine property: __COMPONENT__" error when opening multiple report viewers in Telerik Reporting version 19.1.25.521.
type: how-to
page_title: Fixing Report Viewer Component Error in Telerik Reporting
slug: resolving-cannot-redefine-property-error-telerik-reporting
tags: telerik-reporting, component-error, report-viewer, javascript-error, configurable-property
res_type: kb
ticketid: 1688659
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Progress® Telerik® Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>19.1.25.521</td>
</tr>
</tbody>
</table>

## Description

When using Telerik Reporting version 19.1.25.521, the error "Cannot redefine property: __COMPONENT__" occurs when attempting to open multiple report viewers simultaneously. This issue arises due to improper scoping of toolbar elements, such as `pageNumberInput` and `pageCountLabel`, which globally target elements across all report viewers instead of scoping them to specific instances.

When multiple report viewers are initialized, subsequent viewer instances can overwrite or interfere with the settings of the initial report viewer, causing unintended behavior such as improperly bound toolbar elements or disabled export functionality.

This knowledge base article also answers the following questions:
- How to resolve the 'Cannot redefine property' error in Telerik Report Viewer?
- How to fix toolbar element initialization for multiple report viewers?
- How to enable export functionality in multiple Telerik Reporting viewers?

## Solution

To resolve this issue, modify the JavaScript code to scope element selection to each report viewer's parent container. Use the `$element.find` method to ensure that each toolbar element is properly scoped within its specific report viewer instance. Additionally, fix the export functionality to avoid it being disabled across multiple viewers.

### Fixing Toolbar Element Initialization

Use the following updated code snippet to properly scope `pageNumberInput` and `pageCountLabel` within each report viewer:

```javascript
const pageNumberInputEl = $element.find(ToolBarConstants.PageNumberInputDataRoleSelector).get(0);
if (pageNumberInputEl) {
    new PageNumberInput(pageNumberInputEl, this._options);
}

const pageCountLabelEl = $element.find(ToolBarConstants.PageCountLabelDataRoleSelector).get(0);
if (pageCountLabelEl) {
    new PageCountLabel(pageCountLabelEl, this._options);
}
```

### Fixing Export Functionality

Modify the code in the `Toolbar` class to ensure that export functionality works correctly for multiple report viewers.

1. **Begin Load Report**

Update the `beginLoadReport` event handler:

```javascript
.on('beginLoadReport', () => {
    const $element = $(this._element);
    const kendoExportDropDown = $element.find(`#${ToolBarConstants.ExportDropdownId}`).data("kendoDropDownButton");
    kendoExportDropDown?.enable(false);
})
```

2. **Update Export Dropdown Items**

Update the `updateExportDropdownItems` method:

```javascript
const $element = $(this._element);
const kendoExportDropDown = $element.find(`#${ToolBarConstants.ExportDropdownId}`).data("kendoDropDownButton");
if (!kendoExportDropDown) {
    return;
}
```

### Summary

These modifications ensure that each report viewer instance operates independently without interference. Toolbar elements such as `pageNumberInput`, `pageCountLabel`, and export dropdown are correctly scoped within their respective viewer contexts.

## See Also

- [2025 Q2 19.1.25.521 Release Overview - Telerik Reporting](https://docs.telerik.com/reporting/upgrade/2025/2025-q2-19-1-25-521#html5-report-viewer)
- [Why can't I redefine a property in a Javascript object? - Stack Overflow](https://stackoverflow.com/questions/25517989/why-cant-i-redefine-a-property-in-a-javascript-object)
- [TypeError: Cannot redefine property: X in JavaScript [Fixed] | bobbyhadz](https://bobbyhadz.com/blog/typeerror-cannot-redefine-property-in-javascript)
- [Fiddler Everywhere](https://www.telerik.com/download/fiddler-everywhere)
