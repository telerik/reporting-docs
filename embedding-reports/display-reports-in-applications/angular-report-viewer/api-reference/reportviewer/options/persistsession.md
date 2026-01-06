---
title: persistSession
page_title: persistSession property
description: "Sets whether the viewer's client session should be persisted between page refreshes. Session is stored in browser's sessionStorage and lasts for the page session duration."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/options/persistsession
published: True
reportingArea: AngularWrapper
---

# The `persistSession` option of the Angular Report Viewer

Sets whether the viewer's client session should be persisted between page refreshes. Session is stored in browser's sessionStorage and lasts for the page session duration.

## Type

`boolean`

## Examples

````html
<tr-viewer
  [persistSession]="persistSession">
</tr-viewer>
````

````typescript
persistSession: boolean = true;
````



