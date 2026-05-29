---
title: Using with Report Server for .NET
page_title: Using Native Blazor Report Viewer with Telerik Report Server for .NET
description: "Learn how to configure and use the Telerik Reporting Native Blazor Report Viewer with a Telerik Report Server for .NET instance."
slug: telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-with-report-server-net
tags: how, to, use, native, blazor, report, viewer, server, webassembly, hybrid, report, server, net
published: True
reportingArea: NativeBlazor
position: 2
---

# Using the Native Blazor Report Viewer with the Report Server for .NET

This article explains how to configure the Native Blazor Report Viewer to connect to Telerik Report Server for .NET using token-based authentication.

[Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview) is a server-based reporting solution that stores and manages reports centrally. Token authentication is the recommended security approach, as it provides better protection than username/password credentials and allows for token rotation without code changes.

Any user account can authenticate with the Report Server, including the Guest User, provided there is an enabled token in the user's [token collection](https://docs.telerik.com/report-server/dotnet-docs/token-authentication). Personal tokens follow the JWT structure and are managed through the Report Server interface.

## Prerequisites

- Existing .NET {{site.mindotnetversion}} and higher Blazor Server App or .NET {{site.mindotnetversion}} and higher hosted Blazor WebAssembly App.
- Review the Native Blazor Report Viewer [Requirements](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview#Requirements).
- Installed and running [Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview).
- Report Server for .NET's User that will connect from the viewer should have at least one enabled Token.
- Report Server for .NET should contain at least one report that can be accessed by the User account.

## Configuring the Native Blazor Report Viewer to work with the Report Server for .NET

1. Add NuGet package reference to the **Telerik.ReportViewer.BlazorNative** package hosted on the Progress Telerik proprietary NuGet feed. Ensure that the Telerik NuGet feed is added to the NuGet Package Sources by following [How to add the Telerik private NuGet feed to Visual Studio](slug:telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio).
1. (Optional) The [Native Blazor Report Viewer](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview) depends on version **{{site.blazoruiversion}}** of the [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) product. If [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) is already used in your Blazor application, this step can be skipped. Otherwise, add the [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) JS and its [Kendo theme](https://www.telerik.com/design-system/docs/themes/get-started/introduction/) dependencies to the **head** element of the **Pages/\_Layout.cshtml** (Blazor Server) or **wwwroot/index.html** (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App):

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeBlazorViewerUseWithReportServerNet.html region=NativeBlazorViewerConfiguringForRSNET}}

1. Add the [Native Blazor Report Viewer's](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview) JS and CSS dependencies to the **head** element of the **Pages/\_Layout.cshtml** (Blazor Server) or **wwwroot/index.html** (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App).

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeBlazorViewerUseNativeBlazorReportViewer.html region=NativeBlazorViewerAddingTheNativeBlazorReportViewerComponentManually2}}

1. Configure the project to recognize all Telerik components without explicit **@using** statements on every **.razor** file by adding the following code to your **~/\_Imports.razor**:

	{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\TelerikLayout.razor region=NativeViewerUsingsInImports}}

1. Wrap the content of the main layout file(by default, the **~/Shared/MainLayout.razor** file in the Blazor project) with a razor component called **TelerikLayout.razor**:

	{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\TelerikLayout.razor region=NativeViewerTelerikLayout}}

1. Set up an endpoint on the server that will securely return the token used by the Report Server for .NET to authorize. For example, create an environment variable in the `launchSettings.json` file named **RS_NET_TOKEN** and store the token in it. Then, the endpoint can be configured to read and return the value of the environment variable:

	{{source=CodeSnippets\BlazorNative\Docs\Program.cs region=Get_RS_NET_TOKEN}}

	For Blazor WebAssembly applications where the server is not available, the token can be injected on the `.RAZOR` page at build-time. Use `appsettings.{Environment}.json` files (they are bundled at build time) and read the token from the configuration.

	> important Never hardcode tokens directly in client-side code. Always retrieve them from a secure server endpoint or build-time configuration. Store tokens as environment variables or in secure configuration stores, and ensure the token endpoint is properly secured with authentication and authorization.

1. Configure an `HttpClient` in the `Program.cs` file that will be injected on the `.RAZOR` page on the next step when we make an HTTP request to get the token from the server.

	{{source=CodeSnippets\BlazorNative\Docs\Program.cs region=AddHttpClient}}

1. Create a method in the `RAZOR` or `RAZOR.CS` file of the Blazor component that returns a `Task<string>` with the token retrieved from the Report Server:

	{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\NativeBlazorViewerWithRsNet.razor region=GetRsNetAccessToken}}

1. Use the `ReportServerSettings` fragment to provide the URL to the Report Server for .NET, and the `GetRsNetAccessToken` function that the Native Blazor Report Viewer will execute internally to retrieve the token.

	{{source=CodeSnippets\BlazorNative\Docs\ReportViewers\NativeBlazorViewerWithRsNet.razor region=UseReportServerSettings}}

1. Finally, run the project to see the rendered report.

## Token Management Best Practices

The token storage approach shown in step 6 (using `launchSettings.json` and environment variables) is suitable for development, but requires additional considerations for production environments.

### Development

For local development, store the token in `launchSettings.json`:

{{source=CodeSnippets\Blazor\Docs\JSON\launchSettings.json region=Set_RS_NET_TOKEN}}

### Production

> important **Do NOT use `launchSettings.json` in production.** This file is excluded from deployments and is intended for development only.

Choose one of these approaches for production:

1. **Environment Variables** (Azure App Service, IIS, Linux hosting):

	- Set the `RS_NET_TOKEN` environment variable through your hosting platform's configuration UI
	- Restart the application after changing the value
	- Environment variables are read automatically by .NET configuration system

1. **Azure Key Vault** (Recommended for Azure deployments):

	{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=Add_RS_NET_TOKEN_AzureKeyVault}}

1. **AWS Secrets Manager** (for AWS hosting):

	{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=Add_RS_NET_TOKEN_AwsSecretsManager}}

	Create the secret using AWS CLI:
	```bash
	aws secretsmanager create-secret \
		--name RS_NET_TOKEN \
		--secret-string "your-report-server-token-here"
	```

1. **User Secrets** (Development alternative to launchSettings.json):

	```bash
	dotnet user-secrets set "RS_NET_TOKEN" "your-token-here"
	```

### Token Rotation

Report Server for .NET tokens should be rotated periodically:

1. Create a new token in Report Server for .NET
1. Update the environment variable or secret store with the new token
1. Restart the application to load the new token
1. Disable the old token in Report Server after confirming the new one works

> note Multiple tokens can be enabled simultaneously for a single user account, allowing zero-downtime rotation. Enable the new token before disabling the old one.

## Troubleshooting

### Token Not Retrieved

If the viewer cannot retrieve the token, verify:
- The token endpoint is accessible from the client
- The `HttpClient` is properly configured and injected
- The environment variable `RS_NET_TOKEN` is set correctly
- The token has not expired

### CORS Issues

If you encounter CORS errors when accessing the token endpoint:
- Ensure CORS is properly configured in `Program.cs`
- Verify the endpoint allows requests from your Blazor application's origin
- Check browser console for specific CORS error messages

### Guest User Access

The Guest User can only authenticate using tokens. It does not have a password and cannot use username/password authentication. Ensure at least one enabled token is added to the Guest User account by an administrator: [Guest User Administration](https://www.telerik.com/report-server/documentation/implementer-guide/user-management/guest-user).

## See Also

- [Configuring the Report Server for .NET for Authentication with Personal Tokens](https://docs.telerik.com/report-server/dotnet-docs/token-authentication)
- [Integration with Telerik Reporting](https://docs.telerik.com/blazor-ui/integrations/reporting)
- [Native Blazor Report Viewer Overview](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview)
- [Native Blazor Report Viewer Requirements](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview#Requirements)
- [Using Native Blazor Report Viewer in .NET](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-native-blazor-report-viewer)
- [Native Blazor Report Viewer Options](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/options)
- [Report Server for .NET Overview](https://docs.telerik.com/report-server/dotnet-docs/overview)
- [Guest User Administration](https://docs.telerik.com/report-server/dotnet-docs/implementer-guide/user-management/guest-user)
- [Azure Key Vault Configuration Provider](https://learn.microsoft.com/en-us/aspnet/core/security/key-vault-configuration)
- [Safe Storage of App Secrets in Development](https://learn.microsoft.com/en-us/aspnet/core/security/app-secrets)
