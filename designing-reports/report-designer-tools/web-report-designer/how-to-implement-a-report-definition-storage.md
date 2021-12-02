---
title: How to implement a report definition storage
page_title: How to implement a report definition storage | for Telerik Reporting Documentation
description: How to implement a report definition storage
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-implement-a-report-definition-storage
tags: how,to,implement,a,report,definition,storage
published: True
position: 5
---

# How to implement a report definition storage



This article describes how to use the Web Report Designer to design reports that are stored in a custom storage location.       

## Overview

Out-of-the-box we provide a __FileDefinitionStorage__  that is configured to use the file system.           To open reports stored differently, you need to implement the __IDefinitionStorage__  interface.           This will enable the web designer to load reports from a custom location, such as a database, cloud, in-memory, etc.         

>note The Web Report Designer previews the reports in [Html5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}). The latter              utilizes a [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) to render the reports. The             [client-side reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource()%}) sent by the web designer is resolved to a              [server-side ReportSource](ec135f09-4a4d-43df-aa5a-e6bca0190d87#ReportSourcesOptions) by the  *Resolve*  method of the              Reporting REST Service [ReportSource Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}). The ReportSource resolver is supposed to read               report definitions created with the web report designer. For that reason, in the most of the cases when creating custom               *IDefinitionStorage*  it will be necessary to create also a              [custom ReportSource resolver](e5868213f-b3dd-4110-93d8-a8bf0739778b) that is able to read the              report definitions from the storage and return them as valid server-side ReportSources.         


The *byte[]*  returned by the *GetDefinition*  method of the           *IDefinitionStorage*  will be processed by the virtual *GetReport*            method of the *ReportDesignerController* . The default implementation of the           *GetReport*  method utilizes the *definitionId* s returned by the           *ListDefinitions*  method of the *IDefinitionStorage*  to identify           the type of the report definition in the *byte[]* . If the           *definitionId*  contains the extension '.trdp', the report will be treated as a TRDP package.           Otherwise, the *byte[]*  is regarded as an XML report definition, i.e. a TRDX report. For that           reason, by default, if the *GetDefinition*  method returns a report definition packed with the            [ReportPackager](/reporting/api/Telerik.Reporting.ReportPackager) , the corresponding           *definitionId*  must finish with the '.trdp' extension. If a different behavior is required,           it will be necessary to overload the *GetReport*  method of the           *ReportDesignerController* .         

## Implement Custom Storage

The purpose of the report definition storage is to describe how to browse, open, save, and delete reports from           the Web Report Designer. The storage is configured as a setting of the __ReportDesignerController__ .         

The default implementation of the storage is the __FileDefinitionStorage__ . It provides functionality for working with           TRDP/TRDX report files stored on the server-side file system.           To load the reports from a custom storage, change the implementation of the definition storage like this:         

{{source=CodeSnippets\CS\API\Telerik\WebReportDesigner\CustomDefinitionStorage.cs region=CustomDefinitionStorage}}
````c#
	    public class CustomDefinitionStorage : IDefinitionStorage
	    {
	        private string baseDir;
	
	        public string BaseDir
	        {
	            get
	            {
	                return this.baseDir;
	            }
	        }
	
	        public CustomDefinitionStorage(string baseDir)
	        {
	            this.baseDir = baseDir;
	        }
	
	        public IEnumerable<string> ListDefinitions()
	        {
	            // Retrieve all available reports in the database and return their unique identifiers.
	            throw new NotImplementedException();
	        }
	
	        public byte[] GetDefinition(string definitionId)
	        {
	            // Retrieve the report definition bytes from the database.
	            throw new NotImplementedException();
	        }
	
	        public void SaveDefinition(string definitionId, byte[] definition)
	        {
	            // Save the report definiton bytes to the database.
	        }
	
	        public void DeleteDefinition(string definitionId)
	        {
	            // Delete the report definition from the database.
	        }
	    }
````



Then you can set the new definition storage implementation in the __ReportDesignerController__ .         

{{source=CodeSnippets\CS\API\Telerik\WebReportDesigner\ReportDesignerController.cs region=ReportDesignerServiceConfiguration}}
````c#
	        public ReportDesignerController()
	        {
	            //...
	
	            this.ReportDesignerServiceConfiguration = new ReportDesignerServiceConfiguration
	            {
	                DefinitionStorage = new CustomDefinitionStorage(this.reportsDefinitionsPath),
	                SettingsStorage = new FileSettingsStorage(this.reportsSettingsPath)
	            };
	        }
````



The __BaseDir__  property sets the base path for the reports and the resources they reference. For example,       CSV or JSON files used in CsvDataSource and JsonDataSource components.     
