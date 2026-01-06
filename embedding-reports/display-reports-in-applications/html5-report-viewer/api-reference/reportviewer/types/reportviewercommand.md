---
title: ReportViewerCommand
page_title: ReportViewerCommand Type
description: "Represents a command that can be executed on the report viewer. Each command is an object with the following methods: - exec(): Executes the command (optionally with parameters). - enabled(): Returns a boolean indicating if the command is currently enabled. - checked(): Returns a boolean indicating if the command is in a checked state (for toggle commands)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/reportviewercommand
published: True
reportingArea: HTML5
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }
</style>

# The `ReportViewerCommand` type of the HTML5 Report Viewer

Represents a command that can be executed on the report viewer.
Each command is an object with the following methods:

- exec(): Executes the command (optionally with parameters).
- enabled(): Returns a boolean indicating if the command is currently enabled.
- checked(): Returns a boolean indicating if the command is in a checked state (for toggle commands).

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| exec | `function` | Executes the command. Some commands accept parameters (e.g., export format). |
| enabled | `function` | Returns true if the command can currently be executed. |
| checked | `function` | Returns true if the command is in a checked/active state. |

