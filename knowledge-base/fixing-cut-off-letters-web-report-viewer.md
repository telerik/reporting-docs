---
title: Resolving Letters Being Cut Off in Web Report Viewers
description: "Learn how to resolve the issue of letters being cut off in the Web Report Viewers, which does not occur in the Standalone Report Designer or printed reports."
type: troubleshooting
page_title: Fixing Cut-Off Letters in HTML5 Report Viewers
meta_title: Fixing Cut-Off Letters in HTML5 Report Viewers
slug: fixing-cut-off-letters-web-report-viewer
tags: reporting, textbox, web-report-viewer, text-cut-off, properties, can-shrink, measurement-units
res_type: kb
ticketid: 1693245
---

## Environment

<table>
    <tbody>
        <tr>
            <td> Product </td>
            <td> Reporting </td>
        </tr>
        <tr>
            <td> Viewer</td>
            <td> Web Report Viewers </td>
        </tr>
    </tbody>
</table>

## Description

I noticed that some letters are cut off when viewing reports in the Web Report Viewers. The report displays correctly in the Standalone Report Designer and when printed. For example:

- Web Report Viewer:

    ![Cut-Off Letters in Web Report Viewers](images/CutLettersWebViewer.png)

- Standalone Report Designer:

    ![Cut-Off Letters in Standalone Designer](images/CutLettersStandaloneDesigner.png)

## Solution

To resolve the issue, adjust the size and properties of the [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%}) controls in your report:

1. Switch the measurement units for your report to pixels (`px`). Using pixels minimizes inaccuracies that can occur when switching between units at runtime.
1. Increase the size of each `TextBox` element to ensure adequate space for text rendering.
1. Set the `CanShrink` property of each `TextBox` to `False`. This prevents the control from shrinking beyond the required dimensions for proper text display.
   
## See Also

* [TextBox Documentation]({%slug telerikreporting/designing-reports/report-structure/textbox%})
* [HTML5 Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
