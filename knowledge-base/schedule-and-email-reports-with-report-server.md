---
title: Schedule and Email Telerik Reports with Report Server
description: "Learn how to schedule recurring report rendering and email generated documents as attachments by using Telerik Report Server."
type: how-to
page_title: Schedule Report Rendering and Email Delivery with Report Server
slug: schedule-and-email-reports-with-report-server
tags: scheduling, email, reports, report-server
res_type: kb
---

## Environment

| Property | Value |
| --- | --- |
| Product | Progress Telerik Reporting |
| Related Product | Progress Telerik Report Server |
| Author |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)|

## Description

How can I render Telerik reports regularly and email the generated documents automatically?

## Solution

Use [Telerik Report Server](https://www.telerik.com/report-server), a separate product that provides built-in report scheduling, rendering, document storage, and email delivery. You can manage scheduled tasks and subscribers through its web interface.

Scheduled tasks can run once or recur daily, weekly, monthly, or yearly. You can select an export format such as PDF, XLSX, DOCX, PPTX, or CSV and send the generated documents as email attachments to subscribers.

### Configure Scheduled Rendering and Email Delivery

1. Make the reports available in your Report Server instance.
2. Configure the [Mail Server settings](https://docs.telerik.com/report-server/implementer-guide/configuration/mail-server) with your SMTP server's host address, port, and credentials.
3. In **Scheduling**, create a scheduled task. On the **Reports** tab, select the reports from their categories, the document format for each report, and any report parameter values.
4. On the **General** tab, enter a task name, set the start date, and configure the **Repeat** pattern.
5. Configure **Mail Template (Local)** and **Mail Template (External)** as needed for the recipients.
6. In the task's **Subscribers** view, add existing Report Server users or external email addresses that should receive the generated documents.
7. Save the task with **Enabled** selected.

For the complete task configuration options, see [Scheduled Tasks Management](https://docs.telerik.com/report-server/user-guide/scheduled-tasks-management).

The Report Server [Service Agent](https://docs.telerik.com/report-server/implementer-guide/configuration/service-agent) is responsible for executing scheduled tasks and sending email messages. Ensure that it is running for the scheduled workflow to execute.

After a scheduled run, use the task's **Activity** view to review the execution history and download the generated documents. Confirm that subscribers receive the expected email attachments.

## See Also

* [Send Telerik Report in an E-Mail](slug:send-telerik-report-in-an-e-mail)