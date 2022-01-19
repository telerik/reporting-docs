---
title: ReportSource
page_title: ReportSource | for Telerik Reporting Documentation
description: ReportSource
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/json-entities/reportsource
tags: reportsource
published: True
position: 7
---

# ReportSource



Represents a report document identifier, consisting of a report and values for its parameters.       


    
          {
            ‘report’: ‘Report1.trdp’,
            ‘parameterValues’: { ‘City’: ‘Sofia’ }
          }
        


>caption Fields

| Field | Type | Required | Description |
| ------ | ------ | ------ | ------ |
|`report`|`String`|`true`|A string identifying the report. Might be a report type name, path to a.trdp or.trdx file, or a custom name that will be handled by a custom report source resolver on the server.               See also:[Overview]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%})|
|`parameterValues`|`Object`|`false`|An object holding the parameters' information. Each of its properties represents a report parameter.              The name of the property is the id of the parameter and the value of the property is the parameter's value|

