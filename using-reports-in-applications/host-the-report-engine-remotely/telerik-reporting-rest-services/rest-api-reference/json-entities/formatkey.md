---
title: FormatKey
page_title: FormatKey | for Telerik Reporting Documentation
description: FormatKey
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/formatkey
tags: formatkey
published: True
position: 3
---

# FormatKey



The document format and settings forming a key:       

## 

    
          {
            ‘format’: ‘HTML5’,
            ‘deviceInfo’: { ‘UseSVG’: true }
          }
        

>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`format`|`String`|`true`|PDF, XLSX, etc. A full list can be found at:[Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%})|
|`deviceInfo`|`Object`|`false`|[Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%}).             Each property of the object represents a single setting. The name of the property is the name of the setting and the value of the property is the setting value|


