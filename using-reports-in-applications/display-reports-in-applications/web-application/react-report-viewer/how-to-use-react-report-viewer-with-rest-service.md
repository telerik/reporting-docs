---
title: How to Use React Report Viewer with REST Service
page_title: How to Use React Report Viewer with REST Service 
description: How to Use React Report Viewer with REST Service
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-rest-service
tags: how,to,use,react,report,viewer,with,rest,service
published: True
position: 1
---

# How to Use React Report Viewer with REST Service

This tutorial demonstrates how to add the React Report Viewer component to a new React application and display a report coming from the Telerik Reporting REST Service. 

## Prerequisites

The following list describes the prerequisites for this tutorial: 

* Review the React Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%}#requirements). 

* A running application that hosts a Reporting REST service at address /api/reports. For more information, see [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}). 

* Copy of the "Product Catalog.trdp" report file from __[TelerikReporting_InstallDir]\Report Designer\Examples__ placed in the folder used by the  [UriReportSourceResolver](/reporting/api/Telerik.Reporting.Services.UriReportSourceResolver) in the Reporting REST service project. 

* Entry with the default connection string used by Telerik Reporting sample reports in the configuration file of the project hosting the Reporting REST service. For example: __web.config__ file: 

    
      ````xml
<connectionStrings>
     <add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
                connectionString="Data Source=(local);Initial Catalog=AdventureWorks;Integrated Security=SSPI"
                providerName="System.Data.SqlClient" />
</connectionStrings>
````

__appsettings.json__ file:             

    
      ````html
{
...
  "ConnectionStrings": [
    {
      "name": "Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString",
      "connectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true",
      "providerName": "System.Data.SqlClient"
    }
]
}
````

## Using React Report Viewer in React application

> All paths and url links in the described steps must be adapted according to your project setup. 

###Steps:

1. Create new React application using the [React](https://reactjs.org/docs/create-a-new-react-app.html) tutorial. 

    
    ````powershell
npx create-react-app my-app-with-viewer
cd my-app-with-viewer
````

1. Install  [jQuery](https://www.npmjs.com/package/jquery) by using the following command: 

    
    ````powershell
npm install jquery
````

1. Install the Telerik React Report Viewer NPM package by running: 

    
    ````powershell
npm install @progress/telerik-react-report-viewer
````

1. Once installed, import the TelerikReportViewer in the index.js file: 

    
    ````js
import { TelerikReportViewer } from '@progress/telerik-react-report-viewer'
````

1. Add the report viewer to the page:

    
    ````js
let viewer;
ReactDOM.render(
    <div>
      <TelerikReportViewer
          ref={ el => viewer = el }
          serviceUrl="http://localhost:[portnumber]/api/reports/"
          reportSource={{
              report: 'ProductCatalog.trdp',
              parameters: {}
          }}
          viewerContainerStyle = {{
              position: 'absolute',
              left: '5px',
              right: '5px',
              top: '40px',
              bottom: '5px',
              overflow: 'hidden',
              clear: 'both',
              fontFamily: 'ms sans serif'
          }}
          viewMode="INTERACTIVE"
          scaleMode="SPECIFIC"
          scale={1.0}
          enableAccessibility={false} />
    </div>,
  document.getElementById('root')
);
````

1. Style the viewer using the desired Kendo UI theme (еither using [Less-Based Themes](http://docs.telerik.com/kendo-ui/styles-and-layout/appearance-styling)  or  [Sass-Based Themes](http://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes)): Add references to the Less-based CSS files in the ```<head>``` element of index.html:
    
    ````html
<!-- The required Less-based styles -->
<link href="https://kendo.cdn.telerik.com/2020.3.1118/styles/kendo.common.min.css" rel="stylesheet" />
<link href="https://kendo.cdn.telerik.com/2020.3.1118/styles/kendo.blueopal.min.css" rel="stylesheet" />
````

    >To get the Sass-based Kendo UI themes, you can use either the pre-build CSS files or the NPM packages ([Getting the Sass-Based Themes](http://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes#getting-the-themes)). 

1. Run the application:
    
    ````powershell
npm start
````

## Demo project

A sample project can be found in the installation folder of Telerik Reporting __[TelerikReporting_InstallDir]\Examples\React__.         

# See Also

* [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%})

* [React Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})

* [How to Use React Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-report-server%})

