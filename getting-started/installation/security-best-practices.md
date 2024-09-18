https://github.com/telerik/reporting-docs/issues/1475

https://supportcenter.devexpress.com/ticket/details/t190349/false-positive-vulnerabilities-known-alerts-detected-by-various-security-scanners-and

https://docs.devexpress.com/GeneralInformation/403365/security/security

https://docs.devexpress.com/XtraReports/119146/reporting-security

---
title: Security
page_title: Best Security Practices when Embedding Telerik Reporting
description: "Check the recommended security practices when embedding Telerik Reporting and working with its reports, services, and viewers."
slug: security-best-practices
tags: telerik, reporting, security, best, practices
published: True
position: 4
---

# Security Best Practices

In this article, we provide security practices, both general and reporting-specific, that we recommend to comply with when embedding Telerik Reporting in your projects. It may be regarded as necessary but not sufficient for keeping your applications secure. It doesn't claim to be a complete and comprehensive security guidance.

## General Security Considerations



## Configuration Settings

The suggestions in this section are the responsibility of the developer embedding Telerik Reporting in a custom application.

Run your applications hosting the [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) and [Web Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}) under [HTTPS protocol](https://developer.mozilla.org/en-US/docs/Glossary/HTTPS) and with the [CORS](https://developer.mozilla.org/en-US/docs/Glossary/CORS) enabled at the minimum required level.

Avoid the [Unsafe Code](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/unsafe-code#c-language-specification) in your projects and their references.

Consider implementing [Rate Limiting](https://learn.microsoft.com/en-us/aspnet/core/performance/rate-limit?view=aspnetcore-8.0) in your Reporting Services to limit network traffic and prevent bad agents from exhausting system resources.

## Extending Telerik Reporting

Telerik Reporting lets you extend its built-in functionality with custom code, for example by introducing [Custom User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}), [Custom Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%}) and [ObjectDataSources]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}). The Reporting Engine invokes the custom functionality with reflection. The allowed assemblies should be whitelisted in the configuration of the application hosting the Reporting Engine as explained in the article [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}). The entire responsibility for registering the custom assemblies and the security of their code is delegated to the developer.

>tip Use only trusted assemblies that are signed with a public key token (see [Assembly (CLI)](https://en.wikipedia.org/wiki/Assembly_(CLI))) and cannot be replaced when extending the Reporting functionality in your projects, avoiding remote code execution and other malicious actions.

## Report Definitions

The [Report Definitions]({%slug on-telerik-reporting%}#report-definition) gets instantiated by the Reporting Engine in runtime. The developer should ensure they come from trusted sources and don't contain malicious code.

The _Type_ report definitions are instantiated with reflection from the provided assembly. The advice from the section [Extending Telerik Reporting](#extending-telerik-reporting) is valid for these reports. Note that the assemblies with _Type_ reports don't require registration in the _assemblyReference_ of the configuration. It is the responsibility of the developer to ensure they don't threaten the environment.

The declarative report definitions (_TRDP_, _TRDX_, and _TRBP_ files) describe the report layout with XML code. The Reporting Engine [unpackages]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}) or [deserializes]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}) them to make the required [Telerik.Reporting.Report](/api/telerik.reporting.report) instance. The developer should ensure no content may result in malicious executable code that may result in a security breach.

The Reporting Engine fetches the data from the DataSource components based on its properties. For example, the SqlDataSource provides a connection string, data provider and a command, which may be an inline query or stored procedure name. The connection is delegated entirely to the specified provider and relies on the connection string. Our recommendation:

* use data connections with the least necessary permissions

	Data is fetched by the data provider by executing the command. Ensure the user doesn't have permissions, for example, to delete information from the data tables.

* do not include connection strings and credentials in report files

	Use named rather than embedded connection strings. The Reporting Engine will resolve them from the application configuration.

## Reporting Services

The Telerik Reporting REST Service is a Web API application. Use the Microsoft recommendations [ASP.NET Core security topics](https://learn.microsoft.com/en-us/aspnet/core/security/?view=aspnetcore-8.0) to ensure it is secure.

The service is represented by the [abstract ReportsControllerBase class](/api/telerik.reporting.services.webapi.reportscontrollerbase). Its methods are not authorized. They are virtual and it is your responsibility to authorize the Reporting REST API defined in the custom ReportsController inheriting the ReportsControllerBase.

The requests for resources are marked with the [AllowAnonymous attribute](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.authorization.allowanonymousattribute?view=aspnetcore-8.0) by design. For that reason, the [Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}) won't add [authenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/authenticationtoken(token)%}) to these requests. If you need to authenticate the whole Web API of the Reporting REST Service, you need to add the header with a custom approach, for example, as explained in the following resources:

* [Request to '/api/reports/.../{documentId}' Is Not Authorized]({%slug why-get-document-request-is-unauthorized%})
* [Authorization in REST Service Controller]({%slug reporting-rest-service-authorization%})


## Report Viewers

Don't expose sensitive information when working with the Report Viewers. Consider the following:

* URL taking the user to the Report Viewer

	Don't pass the report identifier, parameter values, or other sensitive information as inline or query parameters as they become part of the URL.

* Viewer's [reportSource]({%telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}), etc.

	The viewer's/client-side _reportSource_ is sent to the service with the request. Avoid sending sensitive information with it. For example, you may pass the connection string to the report as a Report Parameter Value as explained in the KB article [Change Connection String dynamically through a report parameter]({%slug how-to-pass-connectionstring-to-report-dynamically-through-report-parameter%}). The value will be sent in the body of the request, which may be insecure, especially when the application runs under HTTP.
	
	When using HTTPS, the requests are encrypted and generally considered as secure. If you want an additional level of security, consider the [ReportSource Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}) that resolves the client-side reportSource to a server-side one. For example, use as _reportSource.report_ insensitive identifiers that may be resolved to the actual ones in the resolver.

## Web Report Designer

Use https://docs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/customize-web-designer#fine-tune-the-customization-in-the-web-report-designer



## See Also

* [Introduction to Telerik Reporting]({%slug telerikreporting/welcome-to-telerik-reporting!%})
* [System Requirements](https://www.telerik.com/products/reporting/system-requirements)
