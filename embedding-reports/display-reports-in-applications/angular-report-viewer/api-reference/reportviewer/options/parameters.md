---
title: parameters
page_title: parameters property
description: "Allows defining parameter options for report parameters. Available properties: - editors (object, optional) - Defines the editor type for single and multi-select parameters. The 'editors' object has two properties for the two parameter types:  - singleSelect (string, optional) - Editor type for single-select parameters. Possible values: \"COMBO_BOX\" (Kendo UI ComboBox) or \"LIST_VIEW\" (Kendo UI ListView). Default: \"LIST_VIEW\".  - multiSelect (string, optional) - Editor type for multi-select parameters. Possible values: \"COMBO_BOX\" (Kendo UI ComboBox) or \"LIST_VIEW\" (Kendo UI ListView). Default: \"LIST_VIEW\"."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/parameters
published: True
reportingArea: AngularWrapper
---

# The `parameters` option of the Angular Report Viewer

Allows defining parameter options for report parameters.
Available properties:

- editors (object, optional) - Defines the editor type for single and multi-select parameters.
The 'editors' object has two properties for the two parameter types:
 - singleSelect (string, optional) - Editor type for single-select parameters. Possible values: "COMBO_BOX" (Kendo UI ComboBox) or "LIST_VIEW" (Kendo UI ListView). Default: "LIST_VIEW".
 - multiSelect (string, optional) - Editor type for multi-select parameters. Possible values: "COMBO_BOX" (Kendo UI ComboBox) or "LIST_VIEW" (Kendo UI ListView). Default: "LIST_VIEW".

## Type

`any`

## Examples

````html
<tr-viewer
  [parameters]="parameters">
</tr-viewer>
````

````typescript
parameters: any = {
  editors: {
    singleSelect: 'COMBO_BOX',
    multiSelect: 'COMBO_BOX'
  }
}
````

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
