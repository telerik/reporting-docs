---
title: Best Practices
page_title: Best Security Practices when Embedding Telerik Reporting
description: "Check the recommended security practices when embedding Telerik Reporting and working with its reports, services, and viewers."
slug: security-best-practices
tags: telerik, reporting, security, best, practices
published: True
position: 4
reportingArea: General
---

# Security Best Practices

The article discusses general and reporting-specific security practices. While the recommendations may be necessary to keep your applications embedding Telerik Reporting secure, they may not be sufficient. The article should not be regarded as complete and comprehensive security guidance.

## General Security Considerations

### Configuration Settings

The suggestions in this section are the responsibility of the developer embedding Telerik Reporting in a custom application.

* Run your applications hosting the [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) and [Web Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}) under [HTTPS protocol](https://developer.mozilla.org/en-US/docs/Glossary/HTTPS) and with the [CORS](https://developer.mozilla.org/en-US/docs/Glossary/CORS) enabled at the minimum required level.
* Avoid the [Unsafe Code](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/language-specification/unsafe-code) in your projects and their references.
* Consider implementing [Rate Limiting](https://learn.microsoft.com/en-us/aspnet/core/performance/rate-limit?view=aspnetcore-8.0) in your Reporting Services to limit network traffic and prevent bad agents from exhausting system resources.

## Reporting Specific Considerations

### Report Definitions

* The [Report Definitions]({%slug on-telerik-reporting%}#report-definition) gets instantiated by the Reporting Engine in runtime. The developer should ensure they come from trusted sources and don't contain malicious code.
* The _Type_ report definitions are instantiated with reflection from the provided assembly. The advice from the section [Extending Telerik Reporting](#extending-telerik-reporting) is valid for these reports. Note that the assemblies with _Type_ reports don't require registration in the _assemblyReference_ of the configuration. It is the responsibility of the developer to ensure they don't threaten the environment.
* The declarative report definitions (_TRDP_, _TRDX_, and _TRBP_ files) describe the report layout with XML code. The Reporting Engine [unpackages]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}) or [deserializes]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}) them to make the required [Telerik.Reporting.Report](/api/telerik.reporting.report) instance. The developer should ensure that no content is included that could result in malicious executable code, which may lead to a security breach.

 	Starting with 2025 Q1, only report source paths within the application base folder can be resolved by default. This is determined by the `validateReportPaths` (optional, boolean, __enabled__ by default) attribute of the configuration [processing Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/processing-element%}). We recommend keeping the `true` value of `validateReportPaths`. To resolve report paths outside the application folder, set the attribute to _false_ and ensure no malicious agents may access your report definitions.
  
* The Reporting Engine fetches the data from the [DataSource components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) based on its properties. For example, the [SqlDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) provides a connection string, data provider, and a command, which may be an inline query or stored procedure name. The connection is delegated entirely to the specified provider and relies on the connection string. Our recommendation:

	- use data connections with the __least necessary permissions__: Data is fetched by the data provider by executing the command. Ensure the user doesn't have permission, for example, to delete information from the data tables.
	- __do not include connection strings and credentials in report files__: Use [named/shared](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/connection-strings-and-configuration-files) rather than embedded connection strings. The Reporting Engine will resolve them from the application configuration.

#### WebServiceDataSource Security Best Practices

When using reports that contain [WebServiceDataSource components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/overview%}), follow these recommendations to ensure secure operation:

* __Review Reports from External Sources__:	Before deploying reports from third parties or external sources, review their WebServiceDataSource configurations to verify that they access only the expected API endpoints. Reports can be configured to make HTTP requests to various destinations, so it's important to confirm these align with your security policies.
* __Inspect Service URLs__:	Check that Service URLs in WebServiceDataSource components point to approved API endpoints. Pay attention to reports that use parameter placeholders in URLs (indicated by {@parameterName} syntax) combined with user-editable Report Parameters, as this pattern allows the URL to be modified at runtime based on user input.
* __Validate Before Deployment__: Deploy only reports from trusted sources into production environments. If using reports from external parties, review all data source configurations and test them in isolated environments first. Consider implementing network-level controls to limit which external services your reporting server can access.

### Reporting Services

* The [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) is a Web API application. Use the Microsoft recommendations [ASP.NET Core security topics](https://learn.microsoft.com/en-us/aspnet/core/security/?view=aspnetcore-8.0) to ensure it is secure.
* The service is represented by the [abstract ReportsControllerBase class](/api/telerik.reporting.services.webapi.reportscontrollerbase). Its methods are not authorized. They are virtual, and it is your responsibility to authorize the Reporting REST API defined in the custom ReportsController inheriting the ReportsControllerBase.
* The requests for resources are marked with the [AllowAnonymous attribute](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.authorization.allowanonymousattribute?view=aspnetcore-8.0) by design. For that reason, the [Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}) won't add [authenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/authenticationtoken(token)%}) to these requests. If you need to authenticate the whole Web API of the Reporting REST Service, you need to add the header with a custom approach, for example, as explained in the following resources:

	- [Request to '/api/reports/.../{documentId}' Is Not Authorized]({%slug why-get-document-request-is-unauthorized%})
	- [Authorization in REST Service Controller]({%slug reporting-rest-service-authorization%})

### Allowing External Assemblies and Types when Extending the Reporting Engine

Telerik Reporting lets you extend its built-in functionality with custom code, for example by introducing [Custom User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}), [Custom Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%}), [Event Handlers]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/using-event-handlers-in-srd%}) and [ObjectDataSources]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}). The Reporting Engine invokes the custom functionality with reflection. The allowed assemblies should be whitelisted in the configuration of the application hosting the Reporting Engine, as explained in the articles [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}), [typeReferences]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/typeReferences-element%}), and [typeValidation]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/typeValidation-element%}). The entire responsibility for registering the custom assemblies and the security of their code is delegated to the developer.

When providing the Public Key Token, the Reporting Engine will try to match it with the Public Key Token of the found DLL. It will not load an assembly with the same name and a different Public Key Token and will throw an exception instead. If the Public Key Token is omitted in the configuration, the Reporting Engine will load the first DLL whose name matches the provided Assembly Name. Potentially, this may allow bad agents to replace trusted assemblies with malicious ones and constitutes a security vulnerability. Since the Public Key Token provides an extra security layer to your application, we advise always including it in the configuration file.

>tip Use only trusted assemblies that are signed with a public key token (see [Assembly (CLI)](https://en.wikipedia.org/wiki/Assembly_(CLI))) and cannot be replaced when extending the Reporting functionality in your projects, avoiding remote code execution and other malicious actions.

In the `assemblyReferences` element `name` attribute, you may specify the full path to the DLL file, and the Reporting Engine will load it if it finds it there. In this case, the rest of the attributes (`version`, `culture`, and `publicKeyToken`) will be ignored by the target framework (.NET or .NET Frameworks) functionality we use in our code. This may be a security concern, as explained above, so you need to ensure the assembly on the path is a trusted one.

### Report Viewers

Don't expose sensitive information when working with the Report Viewers. Consider the following:

* URL taking the user to the Report Viewer

	Don't pass the report identifier, parameter values, or other sensitive information as inline or query parameters, as they become part of the URL.

* Client-side ReportSource, for example, the [HTML Report Viewer's reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}).

	The viewer's/client-side _reportSource_ is sent to the service with the request. Avoid sending sensitive information with it. For example, you may pass the connection string to the report as a Report Parameter Value as explained in the KB article [Change Connection String dynamically through a report parameter]({%slug how-to-pass-connectionstring-to-report-dynamically-through-report-parameter%}). The value will be sent in the body of the request, which may be insecure, especially when the application runs under HTTP.
	
	When using HTTPS, the requests are encrypted and generally considered secure. If you want an additional level of security, consider the [ReportSource Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) that resolves the client-side reportSource to a server-side one. For example, use as _reportSource.report_ insensitive identifiers that may be resolved to the actual ones in the resolver.

### Web Report Designer

Use [Fine Tune the Customization in the Web Report Designer]({%slug telerikreporting/report-designer-tools/web-report-designer/web-report-designer-customization%}#fine-tune-the-customization-in-the-web-report-designer) to limit the permissions per user.

### Report Converters

When using the [Report Converters]({%slug telerikreporting/designing-reports/converting-reports-from-other-reporting-solutions/overview%}) provided by the Telerik Reporting tool, you need to ensure the imported report definitions are safe and don't contain malicious code.

## See Also

* [Security Overview]({%slug security-overview%})
* [Security FAQ]({%slug security-faq%})
* [Introduction to Telerik Reporting]({%slug telerikreporting/welcome-to-telerik-reporting!%})
* [System Requirements](https://www.telerik.com/products/reporting/system-requirements)


