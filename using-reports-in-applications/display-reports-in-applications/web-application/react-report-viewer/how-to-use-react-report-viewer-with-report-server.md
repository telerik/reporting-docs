---
title: How to Use React Report Viewer with Report Server
page_title: How to Use React Report Viewer with Report Server 
description: How to Use React Report Viewer with Report Server
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-report-server
tags: how,to,use,react,report,viewer,with,report,server
published: True
position: 2
---

# How to Use React Report Viewer with Report Server

This tutorial demonstrates how to add the React Report Viewer component to a new React application and display a report coming from the Telerik Report Server. 

## Prerequisites

The following list describes the prerequisites for this tutorial: 

* Review the React Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%}#requirements). 

* A running intance of the [Telerik Report Server](https://docs.telerik.com/report-server/introduction). 

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
          reportServer={{
            url: 'http://mytelerikreportserver:83/',
            username: 'myusername',
            password: 'mypass'
          }}
          reportSource={{
              report: 'Samples/Dashboard.trdp',
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
      <button id="refresh-button" onClick={ () => viewer.refreshReport() }>Refresh</button>
      <button onClick={ () => viewer.commands.print.exec() }>Print</button>
    </div>,
  document.getElementById('root')
);
````

1. Style the viewer using the desired Kendo UI theme (еither using  [Less-Based Themes](http://docs.telerik.com/kendo-ui/styles-and-layout/appearance-styling)  or  [Sass-Based Themes](http://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes)): Add references to the Less-based CSS files in the ```<head>``` element of index.html:
    
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


# See Also

* [Telerik Report Server](https://docs.telerik.com/report-server/introduction)

* [React Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})

* [How to Use React Report Viewer with REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/how-to-use-react-report-viewer-with-rest-service%})

