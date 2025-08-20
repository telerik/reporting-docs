---
title: TKL102 Document Processing Libraries Licensing Warning in Telerik Reporting  
description: Addressing licensing warnings related to Telerik Document Processing Libraries when using Telerik Reporting.  
type: how-to  
page_title: Fixing Telerik Document Processing Libraries Licensing Warning  
meta_title: Fixing Telerik Document Processing Libraries Licensing Warning  
slug: document-processing-libraries-licensing-warning  
tags: reporting, licensing, document-processing-libraries, warnings, tkl102  
res_type: kb  
ticketid: 1696546
---

## Environment  

| Version | Product | Author | 
| ---- | ---- | ---- | 

| 19.2.25.813 | Telerik Reporting|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description  

I am encountering a licensing warning related to Telerik Document Processing Libraries while using Telerik Reporting. I have a valid Telerik Reporting license and use the MVC Report Viewer and standalone report editor for rendering reports. I am not using Telerik Document Processing Libraries explicitly except for the export options provided by the Report Viewer MVC.  

This knowledge base article also answers the following questions:  
- How do I handle Telerik Document Processing Libraries licensing warnings?  
- Do I need Telerik Document Processing Libraries for Telerik Reporting?  
- How can I suppress Telerik Reporting licensing warnings?  

## Solution  

To resolve the warning, follow these steps:  

1. Ignore the warning if you are not explicitly using Telerik Document Processing Libraries outside of the Report Viewer MVC's export options.  
2. If your project treats warnings as errors, add an exception to the rule in the `.csproj` file. Use the following configuration:  

```xml  
<PropertyGroup>  
  <TreatWarningsAsErrors>true</TreatWarningsAsErrors>  
  <NoWarn>TKL102</NoWarn>  
</PropertyGroup>  
```  

This configuration suppresses the specific warning `TKL102` related to the Telerik Document Processing Libraries license.  

## See Also  

- [Feedback Portal: Telerik and Kendo UI Licensing Warning TKL102](https://feedback.telerik.com/reporting/1696592-telerik-and-kendo-ui-licensing-warning-tkl102-your-current-license-has-expired-and-is-not-valid-for-telerik-document-processing-libraries-version-2025-2-807-20)  
- [Telerik Reporting Overview](https://docs.telerik.com/reporting/)  
- [Telerik Reporting MVC Report Viewer Documentation](https://docs.telerik.com/reporting/html5-report-viewer-mvc)  
