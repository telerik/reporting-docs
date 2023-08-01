---
title: Setting up and Creating Report
page_title: Embedding the Web Report Designer in .NET 6 and Creating Your First Report
description: "Learn how to set up the Telerik Web Report Designer in .NET 6 applications via the Visual Studio Item Templates and how to create a report with Logo and Graph in this step by step tutorial."
slug: telerikreporting/getting-started/web-designer/set-up-and-create-basic-report
tags: how,configure,.net,applications,web,designer,report
published: True
position: 1
---

This is a step-by-step tutorial that shows how to integrate the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) in `.NET 6` ASP.NET Core application in Visual Studio 2022.

* First, you will create a Web Application and add Telerik Web Report Designer through its Visual Studio Item Template.
* Next, you'll create and style a new report.
* Then, you will add a remote DataSource and connect it to a new Graph in the report.
* At the end you will have a web application with embedded Telerik Web Report Designer with the default `SampleReport.trdp` and the newly created `ProductSales.trdp` reports in its storage that you may preview and edit.

The entire process is described in the YouTube video tutorial [Getting Started with the Web Report Designer: Part 1](https://www.youtube.com/watch?v=L-utkcB8-5c).

# Setting up the Web Report Designer in .NET 6

Lets create an ASP.NET Core application in Visual Studio and embed the Telerik Web Report Designer in it:

1. Open Visual Studio 2022 and create a new project through the project template `ASP.NET Core Web App`. Name the project and select `.NET 6.0` as a Target Framework.
1. Right-click on the project and select `Add New Item`. You may search for "telerik reporting" to list the available Reporting item templates. Add `Telerik Web Report Designer HTML5 Page {{site.suiteversion}}`. The version may vary, depending on the last Reporting version installed. Name the new page `webReportDesigner.html` (this is the default name), and build the project when prompted by Visual Studio.
1. In the popped-up Web Designer Wizard, select `Create new REST service` as we don't have an existing one.
1. On the next step the wizard will ask for the initial report to load. Select the `Sample report definition` option to create a new sample report if you don't have any. When you click `Finish` you should see a status page confirming that everything was set up correctly.
1. (optional) Add to the file `launchSetting.json` in folder `Properties` the property, setting the opening project page `"launchUrl": "webReportDesigner.html"`.
1. Run the project. If everything is fine, you should see the web page with the designer with the Sample Report opened, and the onboarding guide to walk you through the main tools in the designer. We recommend to get familiar with them by clicking on the `Next` button. You may skip the guide at any step through the button `End Tour`.

# Creating Your First Report

Data Source URL https://demos.telerik.com/reporting/api/data/ProductSales.min


## See Also

* [Web Report Designer](%{slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Setting up the Web Report Designer in .NET and .NET Core 3.1 applications]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-5-and-.net-core-3.1-applications%})
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [Telerik Reporting Homepage](https://www.telerik.com/products/reporting)
* [Reporting Forums](https://www.telerik.com/forums/reporting)
* [Reporting Blog](https://www.telerik.com/blogs/tag/reporting)
* [Reporting Videos](https://www.telerik.com/videos/reporting)
* [Reporting Roadmap](https://www.telerik.com/support/whats-new/reporting/roadmap)
* [Reporting Pricing](https://www.telerik.com/purchase/individual/reporting)
* [Reporting Training](https://learn.telerik.com/learn/course/external/view/elearning/19/reporting-report-server-training)
