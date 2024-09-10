https://github.com/telerik/reporting-docs/issues/1475

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

This article explains the recommended practices related to Security when working with Telerik Reporting.


## Configuration Settings

app configuration settings (assembly and types whitelisting, unsafe mode)

rate-limiting in Reporting - responsibility of the client.

## Extending Telerik Reporting

Telerik Reporting lets you extend its built-in functionality with custom code, for example by introducing [Custom User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}), [Custom Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%}) and [ObjectDataSources]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}). The Reporting Engine invokes the custom functionality with reflection. The allowed assemblies should be whitelisted in the configuration of the application hosting the Reporting Engine as explained in the article [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}). The entire responsibility for registering the custom assemblies and the security of their code is delegated to the developer.

>tip Use only trusted assemblies that are signed with a public key token (see [Assembly (CLI)](https://en.wikipedia.org/wiki/Assembly_(CLI))) and cannot be replaced when extending the Reporting functionality in your projects, avoiding remote code execution and other malicious actions.

## Report Definitions

The [Report Definitions]({%slug on-telerik-reporting%}#report-definition) get instantiated by the Reporting Engine in runtime. The developer should ensure they come from trusted sources and don't contain malicious code.

The _Type_ report definitions are instantiated with reflection from the provided assembly. The advice from the section [Extending Telerik Reporting](#extending-telerik-reporting) is valid for these reports. Note that the assemblies with _Type_ reports don't require registration in the _assemblyReference_ of the configuration. It is the responsibility of the developer to ensure they don't threaten the environment.

The declarative report definitions (_TRDP_, _TRDX_, and _TRBP_ files) describe the report layout with XML code. The Reporting Engine [unpackages]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}) or [deserializes]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}) them to make the required [Telerik.Reporting.Report](/api/telerik.reporting.report) instance. The developer should ensure no content may result in malicious executable code that may result in a security breach.





data connections must be with the least permissions.

data fetching can delete info from tables.

do not include connection strings and credentials in report files


## Reporting Services

The [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) is represented by the [abstract ReportsControllerBase class](/api/telerik.reporting.services.webapi.reportscontrollerbase). Its methods are not authorized. They are virtual and it is your responsibility to authorize the Reporting REST API defined in the custom ReportsController inheriting the ReportsControllerBase.

The requests for resources are marked with the [AllowAnonymous attribute](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.authorization.allowanonymousattribute?view=aspnetcore-8.0) by design. For that reason, the [Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/overview%}) won't add [authenticationToken]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/authenticationtoken(token)%}) to these requests. If you need to authenticate the whole Web API of the Reporting REST Service, you need to add the header with custom approach, for example, as explained in the following resources:

* [Request to '/api/reports/.../{documentId}' Is Not Authorized]({%slug why-get-document-request-is-unauthorized%})
* [Authorization in REST Service Controller]({%slug reporting-rest-service-authorization%})

## Web Report Designer

Use https://docs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/customize-web-designer#fine-tune-the-customization-in-the-web-report-designer



## See Also

* [Introduction to Telerik Reporting]({%slug telerikreporting/welcome-to-telerik-reporting!%})
* [System Requirements](https://www.telerik.com/products/reporting/system-requirements)
