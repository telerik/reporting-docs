---
title: Methods and Commands
page_title: Methods and Commands of the Blazor Report Viewer
description: "Learn about what the methods and commands exposed by the Telerik Reporting Blazor Report Viewer are and how to use them."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/methods-and-commands
tags: methods,commands,blazor,report,viewer
published: True
position: 3
previous_url: /blazor-report-viewer-methods-and-commands
---

# Methods and Commands Overview

The Blazor Report Viewer exposes methods and commands that allow you to control its behavior from application code.

## Get a report viewer reference to access the API

To call report viewer methods and execute commands, it is required to first get a reference to the report viewer object using the `@ref` attribute. Then use the __reportViewer1__ object to access the report viewer API. For example, a refresh and print of the current report can be triggered like this:

{{source=CodeSnippets\BlazorAppSnippets\Components\Pages\MethodsCommands.razor}}

