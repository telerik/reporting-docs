---
title: Working with Report Server Reports
page_title: Working with Reports from the Telerik Report Server
description: "Learn how to create, open, edit, lock, save, publish, and revert reports from the Telerik Report Server in the Standalone Report Designer."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/working-with-report-server-reports
tags: working,with,report,server,reports,edit,create,publish,revert,lock
published: True
position: 5
previous_url: /standalone-report-designer-working-with-server-reports
---

# Working with Reports Stored in the Telerik Report Server

Standalone Report Designer is integrated with Telerik Report Server so you can create, open, lock, save, save as, publish and revert report changes.

## Overview

When you lock a report on a Report Server, you ensure that others cannot make changes to the report while you edit it. While the report is locked, you can edit the report, close it, reopen it, and even work with the report on your hard disk. Other users cannot change the report or see your changes until you publish the report.

Locking reports before working on them helps to avoid conflicts and confusion when multiple people are working on the same set of reports. When a report is locked to you, only you can make changes to it. You can lock any report on a Report Server for which you have permission, and you can lock reports directly from the Standalone Report Designer.

When you make changes to the report, the report is locked automatically and the changes are stored on your hard disk in the Windows temporary folder. When the report is saved the changes are saved on the server but your changes are still not visible to the other users. You must publish the report before others can see your changes.

When you publish a report, you can type comments about the changes that you made to the report. This helps people to understand what has changed in the report from version to version. This is especially helpful if several people work on a report or if the report is likely to go through several revisions. Your comments become a part of the version history of the report, which can be helpful if people need to view or revert to a previous version.

While a report is locked to you, the changes that you make are not visible to others until you publish the report. There may be situations in which you want to publish the report so that others can see your changes, but you want to keep the report locked so that you can continue working on it.

When a report server report is opened, the Server ribbon tab is activated to provide commands to lock, publish and revert changes.

## Create a report to the server

Use this procedure to create a new report on a server.

1. Click on the `File` application button in the top left corner.
1. Click on the `New` option or use the Ctrl+N shortcut to open the backstage `New report` view.
1. Choose a report template.
1. Click on the `Report Servers` tab and select an already added server or add a report server. The `Create report` dialog opens.
1. Select the category and report name from the opened dialog.

## Open a report

Use this procedure to open a report that is already created on the server.

1. Click on the `File` application button in the top left corner.
1. Click on the `Open` option or use the Ctrl+O shortcut to open the backstage `Open report` view.
1. Click on the `Report Servers` option and select an already added server or add a report server.
1. Select _Category_ and _Report_ from the open report dialog.

## Lock a report

Use this procedure to lock a report that is already opened in the designer. The report is locked if any changes is made to the opened report definition. Still to lock it manually follow the steps:

1. Click on the `Server` ribbon tab.
1. Click on the `Lock` button.

## Save a report to the server

Use this procedure to save a report to the server.

1. Click on the `File` application button in the top left corner.
1. Click on the `Save` option or use the Ctrl+S shortcut to save the report.

> When the report is saved the changes are saved on the server but your changes are still not visible to the other users. You must publish the report before others can see your changes.

## Publish a report

Use this procedure to publish a report that is already locked in the designer.

1. Click on the `Server` ribbon tab.
1. Click on the `Publish` button. The `Publish report` dialog opens.
1. Optionally enter a comment.
1. Click `Publish`.

## Revert report changes

Use this procedure to revert a report that is already locked in the designer.

The revert option is only available after the first publish operation on the target report.

1. Click on the `Server` ribbon tab.
1. Click on the `Revert` button.

## Save as a report to a server

Use this procedure to save a report that is already opened from another location to a server.

1. Click on the `File` application button on the top left corner or use the F12 shortcut to open the backstage `Save as` report view.
1. Click on the `Save as` option or use the F12 shortcut to open the backstage `Save as` report view.
1. Click on the `Report Servers` option and select an already added server or add a report server. The `Save as` report dialog opens.
1. Select the category and report name from the opened dialog.

> When the report is saved the changes are saved on the server but your changes are still not visible to the other users. You must publish the report before others can see your changes.

## Reference another report stored in the server

Another report from the server can be referenced using the *[CategoryName]/[ReportName]* path for the URI. Do not include the extension, i.e. _trdp_. For example: `Samples/Product Sales`. If the report's category is omitted then the category from the master report is inferred.

A reference to another report can be used by the [ReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}) passed to the:

* [SubReport item]({%slug telerikreporting/designing-reports/report-structure/subreport%})
* [NavigateToReport action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%})
* [ReportBook]({%slug telerikreporting/designing-reports/report-book/overview%})
