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


## Extending Telerik Reporting

Telerik Reporting lets you extend its built-in functionality with custom code, for example by introducing [Custom User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}), [Custom Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-aggregate-functions%}) and [ObjectDataSources]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}). The Reporting Engine invokes the custom functionality with reflection. The allowed assemblies should be whitelisted in the configuration of the application hosting the Reporting Engine as explained in the article [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}). The entire responsibility for registering the custom assemblies and the security of their code is delegated to the developer.

>tip Use only trusted assemblies that are signed with a public key token (see [Assembly (CLI)](https://en.wikipedia.org/wiki/Assembly_(CLI)) and cannot be replaced when extending the Reporting functionality in your projects.


## Report Definitions

.trdx / .trdp definitions - guidance to ensure that report definitions come from trusted sources

type reports in .dlls - guidance to ensure that the .dll comes from trusted sources. For example, a bad agent may use remote code execution

rate-limiting in Reporting - responsibility of the client.

data connections must be with the least permissions.

data fetching can delete info from tables.

do not include connection strings and credentials in report files


## Reporting Services

It is your responsibility to Authorize Reporting REST API - ReportsController. The requests for resources are not authenticated by design

Web Designer - use https://docs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/customize-web-designer#fine-tune-the-customization-in-the-web-report-designer



## See Also

* [Introduction to Telerik Reporting]({%slug telerikreporting/welcome-to-telerik-reporting!%})
* [System Requirements](https://www.telerik.com/products/reporting/system-requirements)
