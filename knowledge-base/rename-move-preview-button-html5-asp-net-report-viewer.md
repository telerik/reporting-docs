---
title: Renaming and Repositioning Preview Button in HTML5 ASP.NET Web Forms Report Viewer
description: Learn how to rename and move the Preview button in the parameters section of the HTML5 ASP.NET Web Forms Report Viewer.
type: how-to
page_title: Changing and Moving the Preview Button in HTML5 ASP.NET Report Viewer
meta_title: Changing and Moving the Preview Button in HTML5 ASP.NET Report Viewer
slug: rename-move-preview-button-html5-asp-net-report-viewer
tags: html5, reportviewer, preview-button, parameters, localization
res_type: kb
ticketid: 1690422
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td> Progress® Telerik® Reporting </td>
</tr>
<tr>
<td> Version </td>
<td> 16.2.22.1109 </td>
</tr>
</tbody>
</table>

## Description

I want to rename the Preview button in the HTML5 ASP.NET Web Forms Report Viewer to match my custom requirements. Additionally, I want to reposition the Preview button to the top of the parameters area instead of its default position at the bottom.

This knowledge base article also answers the following questions:
- How to change the Preview button text in Telerik Reporting?
- How to move the Preview button to the top of the parameters section?
- How to customize the Preview button in HTML5 ASP.NET Report Viewer?

## Solution

### Renaming the Preview Button

1. Locate the `telerikReportViewer.stringResources-16.2.22.1109.js` file in the installation folder:  
   `C:\Program Files (x86)\Progress\Telerik Reporting <Release>\Html5\ReportViewer\js`.

2. Open the file and replace the `parametersAreaPreviewButton: "Preview"` value with your desired button name.

3. Copy the updated `.js` file to your project's `Scripts` folder. If the folder doesn't exist, create one.

4. Reference the updated script in the `.aspx` file before the `telerikReportViewer` script. For example:
    ```html
    <script src="/Scripts/telerikReportViewer.stringResources-16.2.22.1109.js"></script>
    <script src="/api/reports/resources/js/telerikReportViewer"></script>
    ```

5. If the changes don't reflect, replace the entire content of the `stringResources` file with the localization snippet from [Localization of the HTML5 ReportViewer](https://docs.telerik.com/reporting/embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization).

6. Compile and run your project to verify the updated button name.

### Moving the Preview Button to the Top

1. Follow the instructions provided in [Move Preview Button at the Top of Parameters Area](https://docs.telerik.com/reporting/knowledge-base/how-to-move-preview-button-at-the-top-of-parameters-area).

2. Implement the required changes to reposition the Preview button within your project.

## See Also

- [Localization of the HTML5 ReportViewer](https://docs.telerik.com/reporting/embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization)
- [Move Preview Button at the Top of Parameters Area](https://docs.telerik.com/reporting/knowledge-base/how-to-move-preview-button-at-the-top-of-parameters-area)
- [HTML5 ReportViewer Overview](https://docs.telerik.com/reporting/embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/overview)
