---
title: Using with REST Service
page_title: Configuring HTML5 Report Viewer with Telerik Reporting REST Service
description: "Learn what the prerequisites are and how to configure and use the HTML5 Report Viewer with the Telerik Reporting REST Service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service
tags: how,use,html5,report,viewer,rest,service
published: True
position: 2
previous_url: /html5-report-viewer-quick-start
---

# Using the HTML5 Report Viewer with REST Service

The quickest way to add an HTML5 Report Viewer to a web project is with the __Telerik HTML5 Report Viewer__ item template in Visual Studio.

For full control, manually configure the REST service and add HTML5 Report Viewer as elaborated in [Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/manual-setup%}) help article.

## Prerequisites

1. Review the HTML5 Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}).
1. Adapt all path references in the described steps according to the project setup. For more information, please refer to the MSDN article [ASP.NET Web Project Paths](https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140))

## Telerik HTML5 Report Viewer Page Item Template

The item template adds.html page with HTML5 Report Viewer and if needed enables the [Telerik Reporting REST WebAPI Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}). The following describes the item template wizard steps:

* To start the item template wizard, in __Solution Explorer__, select the target project. On the __Project menu__, click __Add -> New Item__. In the [Add New Item](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2010/w0572c5b(v=vs.100)) dialog box, navigate to the __Web__ category and select the __Telerik HTML5 Report Viewer Page__ item.
* Accept the project build prompt. Click 'OK'.
* The item template will open the __'Add new Report Viewer'__ dialog with the following steps:

	1. __'Configure reporting engine'__ will configure the type of reporting engine that will process and render the reports. You have two options - REST service or Report server. Choose __Rest service__ option. This way, the reports will be processed and rendered by the REST service on the specified URL. On the right side of the dialog, there are two options:

		+ __Create new REST service__ - in case there is no REST service project setup in the solution. Choosing this option, the REST Service will be configured within the project.
		+ __Use existing REST service__ - in case there is a REST service already configured. Choosing this option will require to enter a valid REST service URI.

		![The Visual Studio item template Add new Report Viewer on the page Configure reporting engine with Create new REST service selected](images/item-template-reporting-engine-rest.png)

	1. __'Configure report source'__ will choose a report definition for the report viewer. If the __Create new REST service__ option was previously selected, you will have to choose one of the following three options. If, however, the __Use existing REST service__ option was previously selected, you will only have the option to choose an existing report definition.

		+ __Sample report definition__ - this option will create a sample report definition which will be shown in the new report viewer. It will be placed in a newly created folder called Reports at the root of the application. It can be either modified or changed with another.
		+ __New report definition__ - this option will create a new report definition that will be opened for editing in the respective report designer. On the right side of the dialog, there are two possible options:

			+ __TRDP report definition__ - will create a TRDP file with the entered __Report name__.
			+ __Type report definition__ - will create a CS|VB file with the entered __Report name__ either in an existing report library project or in a newly created one.

		+ __Existing report definition__ - this option will prompt you to choose an existing report definition that will be shown in the report viewer. On the right side of the dialog, there are three possible options:

			+ __TRDP, TRBP or TRDX report definition__ - enter the path or browse to the report definition. Also, there is an option to enable adding the report definition to the project. In this case, the report viewer will use a UriReportSource with the provided path to the file.
			+ __Enter type report definition created in Visual Studio__ - enter the Assembly qualified name of the type report definition. In this case the report viewer will use a TypeReportSource with the provided Assembly qualified name.
			+ __Select type report definition created in Visual Studio__ - select the type report definition from the resolved types in the solution. The engine will search for report types in all projects in the solution that have Telerik Reporting reference included. The VS item template will add the required __connection string__ from the reports project configuration file (if it exists). 

		![The Visual Studio item template Add new Report Viewer on the page Configure report source with selected BarcodesReport.cs CLR existing report definition](images/item-template-report-source-rest.png)

	1. __'Configure Report Viewer'__ exposes the option to enable [accessibility]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/accessibility%}) for the report viewer.

		![The Visual Studio item template Add new Report Viewer on the page Configure Report Viewer for Enabling Accessibility](images/item-template-accessibility.png)

After finishing, the item template automatically does the following:

* Configures the NuGet packages, if necessary.
* Registers the service routes in the WebApiConfig.cs.
* Adds a __HTML page with the configured HTML5 Report Viewer__.
* Displays a __summary log__ that lists all of the made changes.

## Examples

You can find the complete example setup in the Telerik Reporting installation path. For example, __C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp\Html5Demo__.

> If there are no examples in the Telerik Reporting installation path, you need to [run the setup]({%slug telerikreporting/installation%}#msi-installation) and enable the *Examples* feature.

## See Also

* [HTML5 Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
* [Using HTML5 Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%})
* [How to: Add New Project Items](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2010/w0572c5b(v=vs.100))
