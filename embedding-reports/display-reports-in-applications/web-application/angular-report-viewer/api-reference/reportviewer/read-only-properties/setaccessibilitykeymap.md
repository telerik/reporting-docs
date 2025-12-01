---
title: setAccessibilityKeyMap
page_title: setAccessibilityKeyMap property
description: "Sets the shortcut keys used when the report viewer is in accessible mode. Recommended to set when report rendering is complete. The keys in the key map are: - CONFIRM_KEY: Key used to trigger actions (default: 13, Enter) - MENU_AREA_KEY: Key to focus the menu area, if visible (default: 77, 'm') - CONTENT_AREA_KEY: Key to focus the content area, if visible (default: 67, 'c') - PARAMETERS_AREA_KEY: Key to focus the parameters area, if visible (default: 80, 'p') - DOCUMENT_MAP_AREA_KEY: Key to focus the map area, if visible (default: 68, 'd')"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/read-only-properties/setaccessibilitykeymap
published: True
reportingArea: AngularWrapper
---

# setAccessibilityKeyMap

Sets the shortcut keys used when the report viewer is in accessible mode.
Recommended to set when report rendering is complete.
The keys in the key map are:

- CONFIRM_KEY: Key used to trigger actions (default: 13, Enter)
- MENU_AREA_KEY: Key to focus the menu area, if visible (default: 77, 'm')
- CONTENT_AREA_KEY: Key to focus the content area, if visible (default: 67, 'c')
- PARAMETERS_AREA_KEY: Key to focus the parameters area, if visible (default: 80, 'p')
- DOCUMENT_MAP_AREA_KEY: Key to focus the map area, if visible (default: 68, 'd')

## Type

`any`

## Examples

````typescript
viewer.setAccessibilityKeyMap({
  CONFIRM_KEY: 13,
  MENU_AREA_KEY: 77,
  CONTENT_AREA_KEY: 67
});
````

## See Also

* [Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/angular-report-viewer-overview%})
