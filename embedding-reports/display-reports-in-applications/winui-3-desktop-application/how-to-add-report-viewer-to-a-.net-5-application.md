---
title: Using in a .NET 8 application
page_title: Integrating the WinUI Report Viewer in a .NET 8 application
description: "Learn how to start using the Telerik Reporting WinUI Report Viewer in .NET 8 applications with this tutorial."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/how-to-add-report-viewer-to-a-.net-5-application
tags: how,to,add,winui,report,viewer,to,a,.net,5,application
published: True
position: 1
previous_url: /winui-report-viewer-how-to-add-in-net5-app
---

# Integrating the WinUI Report Viewer in .NET 8

This article explains the steps needed to integrate the WinUI report viewer to a `.NET 8` project.

## Prerequisites:

* Visual Studio 2022 or newer
* Windows 10 SDK 10.0.18362 or newer
* .NET 8 project

## Use the example projects as a reference

Since __R1 2023__, the examples we distribute along with our product contain two new projects: `CSharp.Net8.WinUIIntegrationDemo` and `CSharp.Net8.WinUIIntegrationDemo (Package)`. These projects are designed as a showcase of our WinUI report viewer and can be used as a reference when configuring the viewer in your own WinUI application.

The project `CSharp.Net8.WinUIIntegrationDemo.csproj` targets .NET 8 and contains the references to the necessary Nuget packages. This project also contains the XAML files that configure the application and the window that will host the ReportViewer control. The project `CSharp.Net8.WinUIIntegrationDemo.wapproj` is a Windows Application Packaging Project and specifies which project will be packed as `.appx` and loaded for execution.

These projects are not included in our `CSharp.ReportExamples.sln` file as the rest of the example projects, because building a WinUI application would require a specific configuration of the development machine and that might ruin the smooth "getting started" experience we want to deliver to our users. In order to run the WinUI example projects, make sure the prerequisites above are met and follow the steps below:

* Open Visual Studio and create a new solution.
* Add both projects __CSharp.Net8.WinUIIntegrationDemo__ and __CSharp.Net8.WinUIIntegrationDemo (Package)__ to the solution.
* Mark the __CSharp.Net8.WinUIIntegrationDemo (Package)__ as a startup project.
* Right-click on the __CSharp.Net8.WinUIIntegrationDemo (Package)__ and select __Deploy__ from the context menu.
* Once the deployment process has finished successfully, start the project. The hosting application should show a window containing the WinUI report viewer. By default, the report viewer will try to load the __Report Catalog__ report, located in the *{installation-directory}\Report Designer\Examples* folder.
