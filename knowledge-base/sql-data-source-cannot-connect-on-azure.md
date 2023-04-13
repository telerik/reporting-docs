---
title: SqlDataSource Connects to the Database when Running Locally but Fails on Azure
description: The SqlDataSource Successfully Connects to the Database when Running Locally but Fails when Deployed on Azure as the Connection Strings Defined in Azure Portal Override Those in the Web.config files
type: how-to
page_title: 
slug: sql-data-source-cannot-connect-on-azure
position: 
tags: 
ticketid: 1601143
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


## Description
Scenario is MVC 5 Web app in Azure with system managed identity for password less connections with connection string stored in a key vault additionally. The Web app uses your MVC web viewer embedded and uses web api configuration - all unchanged and was working before with no issues.

The Connection string name has not changed just its content - example below.

Server=tcp:MyAzureServer,1433; Database=MyDB; Authentication=Active Directory Default; TrustServerCertificate=True; Encrypt=true;

The error logged is Unable to get report parameters. An error has occurred. Unable to establish a connection to the database. Please verify that your connection string is valid. In case you use a named connection string from the application configuration file, make sure the name is correct and the connection string settings are present in the configuration file of your application.

The Web App itself of course now uses Microsoft.Data.SqlClient to connect as has been the requirement for Azure since 2019 with managed identity and works without issue for general data connectivity, its only reporting that fails.

The Reporting project App.Config file specifically sets the providerName="Microsoft.Data.SqlClient";

For more information, it is giving the standard error, meaning it is still using system.data.sqlclient as the provider despite the other configuration in the app.config, and the connection string in the web app config in production.

ERROR:
Unable to establish a connection to the database. Please verify that your connection string is valid. In case you use a 
named connection string from the application configuration file, make sure the name is correct and the connection string 
settings are present in the configuration file of your application.
------------- InnerException -------------
Invalid value for key 'authentication'

## Suggested Workarounds
My gut is telling me that there is some kind of issue with the connection where the old data provider is referenced at some point. I have managed a similar problem on the internet - EF6 with AAD auth works locally, but not on deployed app in Azure - Stack Overflow. In the last update from the author in that thread, he mentions that in Azure, his connection string was being configured in the Azure portal which was resulting in the old data provider being used. Please investigate whether that is not also the case here. Regardless of what this investigation results in, I highly recommend checking out the values of the web.config file at runtime somewhere in your application, as shown in the How to: Read application settings - .NET Framework | Microsoft Learn article.



I have discovered something about Azure Web App Settings - they hold the connection strings as environmental variables based on the "type" chosen with the connection string app setting (see https://learn.microsoft.com/en-gb/azure/app-service/configure-common?tabs=portal#configure-connection-strings)

When I changed the type to "custom", it works... This is not documented as far as I can see!
Lets leave the ticket open so I can more fully test - you may want to document this in your docs.



Note that there is another option you may use. It is available in the .NET Standard 2.0 version of the Reporting assembly, where the configuration is provided as an IConfiguration implementation. By default, the code reads from the appsettings.json. However, you may provide it with a custom IConfiguration implementation. I suggest the KB article How to pass configuration settings to ReportProcessor in ASP.NET Core application that does not use REST Service({%slug pass-configuration-to-report-processor-in-asp-dot-net-core-without-rest-service%}) for hints.

## Notes
notes

## See Also

