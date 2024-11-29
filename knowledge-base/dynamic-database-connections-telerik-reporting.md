---
title: Handling Multi-User Database Connections in Telerik Reporting
description: Learn how to configure multi-user database connections dynamically in Telerik Reporting to accommodate different users and databases.
type: how-to
page_title: Configuring Dynamic Database Connections for Multiple Users in Telerik Reporting
slug: dynamic-database-connections-telerik-reporting
tags: reporting, multi-user, database, connection, dynamic, c#
res_type: kb
ticketid: 1669311
---

## Environment
| Version | Product | Author |  
| --- | --- | ---- |  
| 18.2.24.806| TelerikReporting |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 


## Description
When developing an application with Telerik Reporting that involves multiple users connecting to different databases, it becomes essential to dynamically set the connection strings based on the user. This KB article also answers the following questions:
- How can I set connection strings dynamically for each user in Telerik Reporting?
- What is the best practice for handling multiple database connections in a multi-user environment with Telerik Reporting?
- How to implement custom connection string settings in the Telerik Web Report Designer?

## Solution

To handle multiple users connecting to different databases in Telerik Reporting, follow the steps below:

1. **Store Common Connections**: For connections that should be available to all users, store them in the `appsettings.json` file. Telerik Reporting resolves connection strings using the alias(name) of the connection by reading from the configuration file loaded by the application.

2. **Implement Custom ISettingsStorage**: For user-specific connections, implement a custom version of the [ISettingsStorage](https://docs.telerik.com/reporting/api/telerik.webreportdesigner.services.isettingsstorage) interface. Override the `GetConnections()` method to dynamically set the connection string based on the current user. Create a list of `ConnectionInfo` objects where the `Name` remains the same, and only the `ConnectionString` is set dynamically.

    A sample implementation can be found in the article [Implementing Encrypted Connection Strings with Telerik Reporting]({%slug use-encrypted-connection-strings-telerik-reporting%}). Although it focuses on decrypting connection strings, it provides a clear example of how to dynamically adjust connection strings.

3. **Adjust Connection String at Preview**: When a report is previewed in the Web Report Designer, use the `ReportSourceResolver` of the `ReportServiceConfiguration` object to dynamically change the connection string. The process for changing connection strings during report preview is detailed in [Decrypting Connection Strings for SqlDataSource Components - HTML5 Report Viewers]({%slug use-encrypted-connection-strings-telerik-reporting%}).

By following these steps, you can efficiently manage multiple users connecting to different databases in your Telerik Reporting application.

## See Also

- [ISettingsStorage Interface](https://docs.telerik.com/reporting/api/telerik.webreportdesigner.services.isettingsstorage)
- [FileSettingsStorage Class](https://docs.telerik.com/reporting/api/telerik.webreportdesigner.services.filesettingsstorage)
- [ReportServiceConfiguration Object](https://docs.telerik.com/reporting/api/telerik.reporting.services.reportserviceconfiguration)
