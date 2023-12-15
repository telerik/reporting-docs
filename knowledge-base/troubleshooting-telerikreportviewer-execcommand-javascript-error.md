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

Then, disable the `Download PDFs` setting and enable the other option(name varies per browser) for viewing PDF files in the browser.

![image]()

## See Also

* [Printing Reports from the HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports%})
