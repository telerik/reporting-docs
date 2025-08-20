---
title: Document Processing Libraries Licensing Warning in Telerik Reporting  
description: Addressing licensing warnings related to Telerik Document Processing Libraries when using Telerik Reporting.  
type: how-to  
page_title: Fixing Telerik Document Processing Libraries Licensing Warning  
meta_title: Fixing Telerik Document Processing Libraries Licensing Warning  
slug: document-processing-libraries-licensing-warning  
tags: reporting, licensing, dpl, document, processing, warning, tkl102, tkl101, tkl004  
res_type: kb  
ticketid: 1696546
---

## Environment  

|Version|Product|Author| 
|----|----|----| 
|19.2.25.813|Telerik Reporting|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description  

After upgrading to **Q3 2025**, a licensing warning, related to [Telerik Document Processing Libraries](https://docs.telerik.com/devtools/document-processing/introduction), occurs while using Telerik Reporting. A valid Telerik Reporting license is available, but the Telerik Document Processing Libraries is not explicitly used in the project.  

Possible warning messages:

`Telerik and Kendo UI Licensing warning TKL101: Telerik Document Processing Libraries is not listed in your current license file.`

`Telerik and Kendo UI Licensing warning TKL102: Your current license has expired and is not valid for Telerik Document Processing Libraries version 2025.2.807.20.`

## Solution  

This unexpected behavior was introduced with the 2025 Q3 release due to newly added DPL code that is being used internally. 

The possible solution is to ignore the warning. If the project treats warnings as errors, add an exception to the rule in the csproj file.

Follow the steps: 

1. Ignore the warning if you are not explicitly using Telerik Document Processing Libraries outside of the Report Viewer.  
1. If your project treats warnings as errors, add an exception to the rule in the `.csproj` file. Use the following configuration:  

````XML  
<PropertyGroup>  
  <TreatWarningsAsErrors>true</TreatWarningsAsErrors>  
  <NoWarn>TKL102;TKL004</NoWarn>  
</PropertyGroup>  
````

>note This configuration suppresses the specific warnings `TKL102` and `TKL004` related to the Telerik Document Processing Libraries license not being found.  

