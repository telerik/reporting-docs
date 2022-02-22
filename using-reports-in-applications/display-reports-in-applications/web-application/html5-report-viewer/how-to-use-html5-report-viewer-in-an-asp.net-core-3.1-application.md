---
title: How to Use HTML5 Report Viewer in an ASP.NET Core 3.1 application
page_title: How to Use HTML5 Report Viewer in an ASP.NET Core 3.1 application 
description: How to Use HTML5 Report Viewer in an ASP.NET Core 3.1 application
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-in-an-asp.net-core-3.1-application
tags: how,to,use,html5,report,viewer,in,an,asp.net,core,3.1,application
published: True
position: 7
---

# How to Use HTML5 Report Viewer in an ASP.NET Core 3.1 application

This article guides you on how to add an HTML5 Report Viewer in an [ASP.NET Core 3.1](https://docs.microsoft.com/en-us/aspnet/core/?view=aspnetcore-3.1) web application. 

## Prerequisites

The report viewer requires a reference to a running Reports Web Service. The report viewer can consume reports generated and served by any of the following Reports Web Service implementations: 

* A service that runs in another application.

* A service that runs in a Telerik Report Server instance.

* A service that is hosted locally in the same application.

In case you need to host it locally, follow the article [How to Host Reports Service in ASP.NET Core 3.1]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1%}). 


## Adding the HTML5 Report Viewer

1. This tutorial uses the __Barcodes Report.trdp__ report definitions file that must be located in a __Reports__ folder inside the project. Follow  [these steps](https://docs.telerik.com/reporting/telerik-reporting-rest-service-aspnetcore-mvc-core3#add-report-definitions) to    make the __Barcodes Report.trdp__ file available in your project. 

1. Make sure that the app configuration inside the __Configure__ method of the __Startup.cs__ can serve static files: 
    
      ````c#
app.UseStaticFiles();
````

1. Add an HTML Page for the HTML5 Report Viewer by right-clicking on *wwwroot* and __Add > New Item... > HTML Page__. Name the file __index.html__ and add the HTML5 Report Viewer's initialization. For a detailed explanation, check the HTML5 Report Viewer [Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/manual-setup%}) help article. The required references to jQuery and Telerik Kendo UI CSS and JS files are listed in the example below. By default, the necessary Report Viewer scripts and styles are served by the REST Service. The complete report viewer page should look like this:
    
      ````html
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>Telerik HTML5 Report Viewer Demo in ASP.NET Core</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js" /script>
  <link href="https://kendo.cdn.telerik.com/2020.3.1118/styles/kendo.common.min.css" rel="stylesheet" />
  <link href="https://kendo.cdn.telerik.com/2020.3.1118/styles/kendo.blueopal.min.css" rel="stylesheet" />
  <script src="/api/reports/resources/js/telerikReportViewer" /script>
  <style>
      #reportViewer1 {
          position: absolute;
          left: 5px;
          right: 5px;
          top: 50px;
          bottom: 5px;
          overflow: hidden;
          font-family: Verdana, Arial;
      }
  </style>
</head>
<body>
  <div id="reportViewer1">
      loading...
  </div>
  <script>
      $(document).ready(function () {
          $("#reportViewer1")
           .telerik_ReportViewer({
                  serviceUrl: "api/reports/",
                  reportSource: {
                      report: "Barcodes Report.trdp",
                      parameters: {}
                  },
                  viewMode: telerikReportViewer.ViewModes.INTERACTIVE,
                  scaleMode: telerikReportViewer.ScaleModes.SPECIFIC,
                  scale: 1.0,
                  enableAccessibility: false,
                  sendEmail: { enabled: true }
              });
      });
  </script>
</body>
</html>
````

1. Set the *launchSettings.json* launchUrl to the new HTML page. 

1. Finally, run the project to see the report. 


# See Also

* [.NET Core Support]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%})
