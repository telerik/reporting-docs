---
title: JsonDataSource Wizard
page_title: JsonDataSource Wizard Tutorial 
description: "Learn how to use JSON data in Telerik Reports through the dedicated Web Report Designer's JsonDataSource Wizard."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/tools/jsondatasource-wizard
tags: jsondatasource,wizard
published: True
reportingArea: WRDHTML5, WRDBlazorWrapper
position: 2
---

# JsonDataSource Wizard Overview

The Json Data Source Wizard allows you to create a new or edit an existing [`JsonDataSource`]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/jsondatasource-component%}) component in the Telerik Web Report Designer. This article describes the steps you can follow when the wizard appears, after being invoked from the Report Designer toolbox. 

1. __Choose a JSON source__ Select how the json source should be retrieved for the component. 

   + __Upload JSON file__ from the local computer                 

   + __Use existing JSON file__ that previously has been uploaded and/or exists in the [IResourceStorage](/api/Telerik.WebReportDesigner.Services.IResourceStorage) The default implementation of the [IResourceStorage](/api/Telerik.WebReportDesigner.Services.IResourceStorage) interface - [ResourceStorage](/api/Telerik.WebReportDesigner.Services.ResourceStorage) stores resources like json files to the location provided as a string parameter in the constructor [#constructor](/api/Telerik.WebReportDesigner.Services.ResourceStorage#Telerik_WebReportDesigner_Services_ResourceStorage_#ctor_System_String_). When choosing the option __"Use existing json file"__, any existing json files found in this directory will populate the dropdown list. 

   + __Use JSON inline__ to paste in a string in the text area 

Optionally, you can use the [__Data selector__](https://goessner.net/articles/JsonPath/) to query and filter the JSON data. The data selector is a JSONPath string which will be used to query the data. 
 
2. If you have chosen to __"Upload json file"__ or __"Use existing json file"__ you have the option to store this inside the report definition by checking __"Embed json file in report definition"__ option. This way, the json data can be directly edited in the text area, and will no longer be dependent on having the json file available in [ResourceStorage](/api/Telerik.WebReportDesigner.Services.ResourceStorage). 

3. __Preview Data Source Results__ Preview the data-set and see that it returns the expected data. Click __Finish__ to Exit the Wizard and save the data source component. 
