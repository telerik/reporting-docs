---
title: Connecting to MSSQL database in .NET Core WinForms application
description: Explains how to connect to MSSQL database in .NET Core WinForms application
type: how-to
page_title: Connecting to MSSQL database in .NET Core WinForms application
slug: connecting-to-mssql-database-in-net-core-winforms-application
position: 
tags: 
ticketid: 1509748
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## General information
The report viewer only displays the report, but it doesn't have anything to do with the data retrieval process. The connection strings information is carried in the report, and more specifically - in the data sources that are used in the report definition. The report definitions are .trdx/ .trdp or .cs/ .vb files that describe the items and rules in a report. The .trdx and .trdp report definitions are created and opened with Standalone Report Designer, and .cs. /vb report definitions are created by Visual Studio Report Designer. For .NET Core projects, we highly recommend using the Standalone Report Designer to design your reports.

In the report definition the connection string can be persisted in two ways: 

1) Embed the whole connection string in the report definition. This approach is useful when you do not expect to change database environments, but it's not really versatile and secure, because anyone that has access to the report definition will see the connection string. Still it can be useful for some PoC scenarios. In this case, there is no need to add any connection strings in the application's configuration file.

2) Store only the connection string's name, which is the more versatile way. In this case, the report definition stores only the name of the connection string and the actual connection string is stored elsewhere. While working in the Standalone Report Designer, the connection strings are stored in its user.config file, which is located in a temporary folder under your user account. For example: 
C:\Users\ **username** \AppData\Local\Progress_Software_Corpora\Telerik.ReportDesigner.ex_StrongName_xvg2ahozm2u22wxtsw2egsvlddrzt5hj\15.0.21.224\user.config

Inside that file there is a configuration section that lists all the connection strings used by the reports opened in Standalone Report Designer.

When using this approach, the application configuration file (app.config, web.config or appsettings.json) must contain a **ConnectionStrings** section that must include an entry with the same name that is used in the report. When the report engine starts processing the report definition, it will get the connection string name from the report definition and will try to locate the actual connection string from the configuration section. If it fails for some reason, as in your case, it will show an error message, or a "No Page To Display" message (since [R1 2021 SP1](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2021-sp1-15-0-21-224)).

## Solution
[This muted video](https://github.com/telerik/reporting-samples/tree/master/Connecting%20to%20MSSQL%20in%20.NET%20Core%20WinForms%20app) shows how to create a report in the Standalone Report Designer from scratch, connect it to my local database and open it in a WinForms .NET Core 3.1 application. The sample application that comes with our examples is used. They are installed in Progress\Telerik Reporting R1 2021\Examples\CSharp folder on your PC and include ready-to-run projects for different frameworks and technologies. Below you can see each step briefly described:


1. Start with the WinForms .NET Core project opened and you will see that its app.config contains only the default connection string entry that comes with our examples. This connection string won't be used in the demo.

2. Run the Standalone Report Designer and create a blank report. 

3. Add a new **SqlDataSource** and build the connection string to the local AdventureWorks database. On the second page of the wizard, choose the option "**Use as shared connection**", which will allow selecting an alias (name) of this connection string. As explained above, this way the report definition will contain only the name "MyDemoConnectionString", and the actual connection string will be saved in designer's user.config file. After that the wizard goes through the Query Builder that helps me select a single table and then - preview the results.

4. Once the wizard is closed, drag the fields from the **Data Explorer** onto the designer surface. This creates TextBoxes with the appropriate expression and is a convenient way to databind the TextBox items to the database fields. After that preview the report to make sure the data is fetched correctly from the database - and indeed the report is previewed as expected.

5. Go back to the WinForms application. Set the viewer's Report Source programmatically in the Form1_Load event handler. In this example, **UriReportSource** class is used to point the report viewer to the report that was created with the Standalone Report Designer and run the application.

6. The viewer shows a "No page to display" message. This is actually true, but the actual error message is hidden. The message "No page to display" is shown when no pages with significant contents are produced by the report engine. The error message is not considered as significant content, but in this case it might be useful to display it. So, get back to the Standalone Report Designer, change the value of the property **SkipBlankPages** to False and save the report.

7. When running the WinForms app again, the error message is shown in the viewer- **Format of the initialization string does not conform to specification starting at index 0**. This actually is a message issued by the System.Data.DbConnection class that basically complains that the requested connection string cannot be found. And the connection string cannot be found, because we haven't added it yet to the application configuration file.

8. Go back again to Standalone Report Designer, select the sqlDataSource1 component and copy the name of the connection string it expects to find: MyDemoConnectionString.

9. Add it to the app.config <connectionStrings> section, copying the actual connection string from the already existing entry.

10. When starting the WinForms application again, the connection string is found and the report shows the data from the AdventureWorks database.
