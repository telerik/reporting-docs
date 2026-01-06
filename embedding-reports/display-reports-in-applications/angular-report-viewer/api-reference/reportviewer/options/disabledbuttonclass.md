---
title: disabledButtonClass
page_title: disabledButtonClass property
description: "CSS class added to buttons when a command is in a disabled state. Used with data attributes for external command buttons."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/disabledbuttonclass
published: True
reportingArea: AngularWrapper
---

# The `disabledButtonClass` option of the Angular Report Viewer

CSS class added to buttons when a command is in a disabled state. Used with data attributes for external command buttons.

## Type

`string`

## Examples

````html
<tr-viewer
  [disabledButtonClass]="disabledButtonClass">
</tr-viewer>
````

````typescript
disabledButtonClass: string = "my-disabled-button-class";
````



