---
title: Searching
page_title: Searching the Report Contents in WPF Report Viewer
description: "Learn how to search in the content of a report displayed in the WPF Report Viewer as well as how to control this behavior in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/search-in-report-contents
tags: search,in,report,contents,wpf,report,viewer
published: True
reporting_area: WPF
position: 13
previous_url: /wpf-report-viewer-search
---

# Search in Report Contents

The WPF Report Viewer provides the capability to search in report contents. The viewer renders the report page as XAML and its text controls use special attributes, which reference a collection of metadata entries, gathered during the report processing. The metadata entries are added per each textual report item and contain text contents and physical bounds, which determine the highlighted areas of the currently found and selected search items. The metadata text contents are used by the search dialog to perform the actual search.

## Controlling Search Behavior

The behavior of the search dialog depends on the [SearchMetadataOnDemand](/api/Telerik.ReportViewer.Wpf#Telerik_ReportViewer_Wpf_SearchMetadataOnDemand) property. Its default value is `false`, which means that by default the processing engine will include search metadata in the rendering result of every report processing. As a result, the search dialog will be able to perform a search in report contents immediately.

> Metadata is stored in the memory and for very huge reports, it could cause a performance drawback.

If the [SearchMetadataOnDemand](/api/Telerik.ReportViewer.Wpf#Telerik_ReportViewer_Wpf_SearchMetadataOnDemand) property is set to `true`, the processing engine will **not** include the search metadata in the rendering result set. This metadata will be fetched "on demand", which will occur when the search dialog is shown. In this case, the currently loaded in the viewer report will be processed once again to obtain the metadata and pass it to the search dialog.

## Search Dialog

The search dialog is a standalone WPF window, toggled either from the report viewer toolbar or with the `Ctrl+F` key combination. The dialog stays on top of the report viewer, but since it's not modal, the viewer remains fully functional even when the search dialog is shown. Initially, the dialog shows in the top-right corner of the report viewer area, but if there is no available space, it will be placed in the top-right corner of the virtual desktop. The dialog persists its position when closed and opens on the same place next time it is opened until the viewer is active. The dialog can be closed with the red close button in the top-right corner, or with the `ESC` key.

The dialog consists of the following components:

* __Search combobox__ - used to enter the search token. The search process is triggered on every keystroke, but its actual start is delayed by one second after the last keystroke.
* __Stop button__ - stops currently running search. The button is enabled only when a search is already started and disables when the search is completed.
* __Match case button__ - this toggle button sets a search criteria that requires to match the casing of the search token and provided metadata.
* __Match whole word__ - this toggle button sets a criteria that searches the metadata for a whole word, equal to the provided search token.
* __Use regular expressions__ - this toggle button allows to perform a search using the regular expression rules in search combobox. In case the entered regular expression is incorrect, a warning red icon next to the button will appear and the exception message will be set as its tooltip.
* __Results list__ - a data grid control used to display the found results and navigate through them. Every match of the metadata entries against the token is displayed on a separate row. If the token is found more than once in a metadata entry, every match will be shown as a new row. The data grid row shows a small excerpt from the metadata text and the page on which the result is found.
* __Navigation buttons__ - these buttons are used to change the currently selected row. The selection can also be changed with the arrow keys.

The dialog relies on search metadata, which is obtained from *every* rendering result. Along with the textual content and physical bounds of a textual item, every metadata entry contains also the **page number** where the item is positioned. Even consecutive renderings of a same report could produce a different number of pages, so when the user navigates to another report, refreshes the current report or changes the report viewer's view mode, the search dialog closes and needs to be opened again.

> The `CheckBox` and `HtmlTextBox` report items render their contents as one or more text lines. The search may return incorrect results, if the token includes text that is contained in more than one text line.
