---
title: Cannot Read execCommand property Error on Print
description: "This article provides troubleshooting steps for resolving the JavaScript error in Edge/Chrome that occurs when printing with HTML5 Report Viewers."
type: troubleshooting
page_title: Troubleshooting TelerikReportViewer execCommand JavaScript Error in Edge
slug: troubleshooting-telerikreportviewer-execcommand-javascript-error-edge
tags: Edge, Chrome, Print, Printing
res_type: kb
---

## Environment

| Product                    | Report Viewer        |
| -------------------------- | -------------------- |
| Progress Telerik Reporting | HTML5 Report Viewers |

## Description

When I try to print a report using any of the [HTML5-based Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}), the print dialog does not open and instead, errors are displayed in the browser console.

## Error Message

`TypeError: Cannot read properties of null (reading 'execCommand')`

## Solution

- For the Edge browser, navigate to `edge://settings/content/pdfDocuments`
- For the Google Chrome browser, navigate to `chrome://settings/content/pdfDocuments`

Then, disable the `Download PDFs` setting so that the PDF documents are not automatically downloaded. This is required since the printing functionality of the web viewers is based on rendering the report in PDF format with special settings so when the PDF file opens in a browser, the PDF plug-in's `Print dialog` is directly invoked.

![Image displaying the PDF Document settings view in the Microsoft Edge browser](images/browser-pdfsettings.png)

## See Also

* [Printing Reports from the HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports%})
