---
title: Changing the connection string dynamically according to runtime data - Telerik Reporting - KB
description: Changing the connection string dynamically according to runtime data.
page_title: Changing the connection string dynamically according to runtime data
type: troubleshooting
tags: telerik reporting, report items, export reports, deliver reports to any application, creating reports, accessing and managing data
res_type: kb
---

# Changing the connection string dynamically according to runtime data

## Important Notes

The recommended approach for modifying the connection string dynamically is through dedicated Report Parameter - check <a href="/how-to-pass-connectionstring-to-report-dynamically-through-report-parameter" target="_blank">Change Connection String dynamically through a report parameter</a> KB article.

The approach in the current article is suitable for viewers using embedded Reporting engine, e.g. Desktop Viewers and the obsolete ASP.NET Web Forms Report Viewer.

For the viewers using the Telerik Reporting REST Service check the Action NavigateToReport does not work after updating the <a href="/knowledge-base/navigate-to-report-not-working-when-custom-report-resolver-changes-connectionstring-dynamically" target="_blank">Connection String dynamically in a Custom Report Resolver</a> KB article.

## Description

Telerik Reporting can resolve and work with named connection strings provided in the application configuration file (web.config or app.config). Thus providing the required connection string with the same name in the application configuration file should be enough for most of the scenarios. Still if this is not applicable for your scenario and you have to provide the connection strings in runtime you can use the following example:

```C#
class ReportConnectionStringManager
    {
        readonly string connectionString;
  
        public ReportConnectionStringManager(string connectionString)
        {
            this.connectionString = connectionString;
        }
  
        public ReportSource UpdateReportSource(ReportSource sourceReportSource)
        {
            if (sourceReportSource is UriReportSource)
            {
                var uriReportSource = (UriReportSource)sourceReportSource;
                // unpackage TRDP report
                // http://docs.telerik.com/reporting/report-packaging-trdp#unpackaging
                var reportInstance = UnpackageReport(uriReportSource);
                // or deserialize TRDX report(legacy format)
                // http://docs.telerik.com/reporting/programmatic-xml-serialization#deserialize-report-definition-from-xml-file
                // var reportInstance = DeserializeReport(uriReportSource);
                ValidateReportSource(uriReportSource.Uri);
                this.SetConnectionString(reportInstance);
                return CreateInstanceReportSource(reportInstance, uriReportSource);
            }
  
            if (sourceReportSource is XmlReportSource)
            {
                var xml = (XmlReportSource)sourceReportSource;
                ValidateReportSource(xml.Xml);
                var reportInstance = this.DeserializeReport(xml);
                this.SetConnectionString(reportInstance);
                return CreateInstanceReportSource(reportInstance, xml);
            }
  
            if (sourceReportSource is InstanceReportSource)
            {
                var instanceReportSource = (InstanceReportSource)sourceReportSource;
                this.SetConnectionString((ReportItemBase)instanceReportSource.ReportDocument);
                return instanceReportSource;
            }
  
            if (sourceReportSource is TypeReportSource)
            {
                var typeReportSource = (TypeReportSource)sourceReportSource;
                var typeName = typeReportSource.TypeName;
                ValidateReportSource(typeName);
                var reportType = Type.GetType(typeName);
                var reportInstance = (Report)Activator.CreateInstance(reportType);
                this.SetConnectionString((ReportItemBase)reportInstance);
                return CreateInstanceReportSource(reportInstance, typeReportSource);
            }
  
            throw new NotImplementedException("Handler for the used ReportSource type is not implemented.");
        }
  
        ReportSource CreateInstanceReportSource(IReportDocument report, ReportSource originalReportSource)
        {
            var instanceReportSource = new InstanceReportSource { ReportDocument = report };
            instanceReportSource.Parameters.AddRange(originalReportSource.Parameters);
            return instanceReportSource;
        }
  
        void ValidateReportSource(string value)
        {
            if (value.Trim().StartsWith("="))
            {
                throw new InvalidOperationException("Expressions for ReportSource are not supported when changing the connection string dynamically");
            }
        }
  
        Report UnpackageReport(UriReportSource uriReportSource)
        {
            var reportPackager = new ReportPackager();
            using (var sourceStream = System.IO.File.OpenRead(uriReportSource.Uri))
            {
                var report = (Report)reportPackager.UnpackageDocument(sourceStream);
                return report;
            }
        }
  
        Report DeserializeReport(UriReportSource uriReportSource)
        {
            var settings = new System.Xml.XmlReaderSettings();
            settings.IgnoreWhitespace = true;
            using (var xmlReader = System.Xml.XmlReader.Create(uriReportSource.Uri, settings))
            {
                var xmlSerializer = new Telerik.Reporting.XmlSerialization.ReportXmlSerializer();
                var report = (Telerik.Reporting.Report)xmlSerializer.Deserialize(xmlReader);
                return report;
            }
        }
  
        Report DeserializeReport(XmlReportSource xmlReportSource)
        {
            var settings = new System.Xml.XmlReaderSettings();
            settings.IgnoreWhitespace = true;
            var textReader = new System.IO.StringReader(xmlReportSource.Xml);
            using (var xmlReader = System.Xml.XmlReader.Create(textReader, settings))
            {
                var xmlSerializer = new Telerik.Reporting.XmlSerialization.ReportXmlSerializer();
                var report = (Telerik.Reporting.Report)xmlSerializer.Deserialize(xmlReader);
                return report;
            }
        }
  
        void SetConnectionString(ReportItemBase reportItemBase)
        {
            if (reportItemBase.Items.Count < 1)
                return;
  
            if (reportItemBase is Report)
            {
                var report = (Report)reportItemBase;
  
                if (report.DataSource is SqlDataSource)
                {
                    var sqlDataSource = (SqlDataSource)report.DataSource;
                    sqlDataSource.ConnectionString = connectionString;
                }
                foreach (var parameter in report.ReportParameters)
                {
                    if (parameter.AvailableValues.DataSource is SqlDataSource)
                    {
                        var sqlDataSource = (SqlDataSource)parameter.AvailableValues.DataSource;
                        sqlDataSource.ConnectionString = connectionString;
                    }
                }
            }
  
            foreach (var item in reportItemBase.Items)
            {
                //recursively set the connection string to the items from the Items collection
                SetConnectionString(item);
  
                //set the drillthrough report connection strings
                var drillThroughAction = item.Action as NavigateToReportAction;
                if (null != drillThroughAction)
                {
                    var updatedReportInstance = this.UpdateReportSource(drillThroughAction.ReportSource);
                    drillThroughAction.ReportSource = updatedReportInstance;
                }
  
                if (item is SubReport)
                {
                    var subReport = (SubReport)item;
                    subReport.ReportSource = this.UpdateReportSource(subReport.ReportSource);
                    continue;
                }
  
                //Covers all data items(Crosstab, Table, List, Graph, Map and Chart)
                if (item is DataItem)
                {
                    var dataItem = (DataItem)item;
                    if (dataItem.DataSource is SqlDataSource)
                    {
                        var sqlDataSource = (SqlDataSource)dataItem.DataSource;
                        sqlDataSource.ConnectionString = connectionString;
                        continue;
                    }
                }
  
            }
        }
    }
```
```VB
Imports Telerik.Reporting
  
Class ReportConnectionStringManager
    ReadOnly connectionString As String
  
    Public Sub New(connectionString As String)
        Me.connectionString = connectionString
    End Sub
  
    Public Function UpdateReportSource(sourceReportSource As ReportSource) As ReportSource
        If TypeOf sourceReportSource Is UriReportSource Then
            Dim uriReportSource = DirectCast(sourceReportSource, UriReportSource)
            ' unpackage TRDP report
            ' http://docs.telerik.com/reporting/report-packaging-trdp#unpackaging
            Dim reportInstance = UnpackageReport(uriReportSource)
            ' or deserialize TRDX report(legacy format)
            ' http://docs.telerik.com/reporting/programmatic-xml-serialization#deserialize-report-definition-from-xml-file
            ' var reportInstance = DeserializeReport(uriReportSource);
            ValidateReportSource(uriReportSource.Uri)
            Me.SetConnectionString(reportInstance)
            Return CreateInstanceReportSource(reportInstance, uriReportSource)
        End If
  
        If TypeOf sourceReportSource Is XmlReportSource Then
            Dim xml = DirectCast(sourceReportSource, XmlReportSource)
            ValidateReportSource(xml.Xml)
            Dim reportInstance = Me.DeserializeReport(xml)
            Me.SetConnectionString(reportInstance)
            Return CreateInstanceReportSource(reportInstance, xml)
        End If
  
        If TypeOf sourceReportSource Is InstanceReportSource Then
            Dim instanceReportSource = DirectCast(sourceReportSource, InstanceReportSource)
            Me.SetConnectionString(DirectCast(instanceReportSource.ReportDocument, ReportItemBase))
            Return instanceReportSource
        End If
  
        If TypeOf sourceReportSource Is TypeReportSource Then
            Dim typeReportSource = DirectCast(sourceReportSource, TypeReportSource)
            Dim typeName = typeReportSource.TypeName
            ValidateReportSource(typeName)
            Dim reportType = Type.[GetType](typeName)
            Dim reportInstance = DirectCast(Activator.CreateInstance(reportType), Report)
            Me.SetConnectionString(DirectCast(reportInstance, ReportItemBase))
            Return CreateInstanceReportSource(reportInstance, typeReportSource)
        End If
  
        Throw New NotImplementedException("Handler for the used ReportSource type is not implemented.")
    End Function
  
    Private Function CreateInstanceReportSource(report As IReportDocument, originalReportSource As ReportSource) As ReportSource
        Dim instanceReportSource = New InstanceReportSource() With { _
             .ReportDocument = report _
        }
        InstanceReportSource.Parameters.AddRange(originalReportSource.Parameters)
        Return InstanceReportSource
    End Function
  
    Public Sub ValidateReportSource(value As String)
        If value.Trim().StartsWith("=") Then
            Throw New InvalidOperationException("Expressions for ReportSource are not supported when changing the connection string dynamically")
        End If
    End Sub
  
    Private Function UnpackageReport(uriReportSource As UriReportSource) As Report
        Dim reportPackager = New ReportPackager()
        Using sourceStream = System.IO.File.OpenRead(uriReportSource.Uri)
            Dim report = DirectCast(reportPackager.UnpackageDocument(sourceStream), Report)
            Return report
        End Using
    End Function
  
    Public Function DeserializeReport(uriReportSource As UriReportSource) As Report
        Dim settings = New System.Xml.XmlReaderSettings()
        settings.IgnoreWhitespace = True
        Using xmlReader = System.Xml.XmlReader.Create(uriReportSource.Uri, settings)
            Dim xmlSerializer = New Telerik.Reporting.XmlSerialization.ReportXmlSerializer()
            Dim report = DirectCast(xmlSerializer.Deserialize(xmlReader), Telerik.Reporting.Report)
            Return report
        End Using
    End Function
  
    Public Function DeserializeReport(xmlReportSource As XmlReportSource) As Report
        Dim settings = New System.Xml.XmlReaderSettings()
        settings.IgnoreWhitespace = True
        Dim textReader = New System.IO.StringReader(xmlReportSource.Xml)
        Using xmlReader = System.Xml.XmlReader.Create(textReader, settings)
            Dim xmlSerializer = New Telerik.Reporting.XmlSerialization.ReportXmlSerializer()
            Dim report = DirectCast(xmlSerializer.Deserialize(xmlReader), Telerik.Reporting.Report)
            Return report
        End Using
    End Function
  
    Public Sub SetConnectionString(reportItemBase As ReportItemBase)
        If reportItemBase.Items.Count < 1 Then
            Return
        End If
  
        If TypeOf reportItemBase Is Report Then
            Dim report = DirectCast(reportItemBase, Report)
  
            If TypeOf report.DataSource Is SqlDataSource Then
                Dim sqlDataSource = DirectCast(report.DataSource, SqlDataSource)
                sqlDataSource.ConnectionString = connectionString
            End If
            For Each parameter As Telerik.Reporting.ReportParameter In report.ReportParameters
                If TypeOf parameter.AvailableValues.DataSource Is SqlDataSource Then
                    Dim sqlDataSource = DirectCast(parameter.AvailableValues.DataSource, SqlDataSource)
                    sqlDataSource.ConnectionString = connectionString
                End If
            Next
        End If
  
        For Each item As Telerik.Reporting.ReportItemBase In reportItemBase.Items
            'recursively set the connection string to the items from the Items collection
            SetConnectionString(item)
  
            'set the drillthrough report connection strings
            Dim drillThroughAction = TryCast(item.Action, NavigateToReportAction)
            If drillThroughAction IsNot Nothing Then
                Dim updatedReportInstance = Me.UpdateReportSource(drillThroughAction.ReportSource)
                drillThroughAction.ReportSource = updatedReportInstance
            End If
  
            If TypeOf item Is SubReport Then
                Dim subReport = DirectCast(item, SubReport)
                subReport.ReportSource = Me.UpdateReportSource(subReport.ReportSource)
                Continue For
            End If
  
            'Covers all data items(Crosstab, Table, List, Graph, Map and Chart)
            If TypeOf item Is DataItem Then
                Dim dataItem = DirectCast(item, DataItem)
                If TypeOf dataItem.DataSource Is SqlDataSource Then
                    Dim sqlDataSource = DirectCast(dataItem.DataSource, SqlDataSource)
                    sqlDataSource.ConnectionString = connectionString
                    Continue For
                End If
  
            End If
        Next
    End Sub
End Class
```
In order to set the connection strings at run-time you have to instantiate the ReportConnectionStringManager with the new connection string you want to use. Then you have invoke the UpdateReportSource with a <a href="/t-telerik-reporting-reportsource" target="_blank">ReportSource</a>. This method returns an updated ReportSource with the new connection string. The updated ReportSource then can be used for ReportViewer.ReportSource or for <a href="/t-telerik-reporting-processing-reportprocessor" target="_blank">ReportProcessor</a>. For example check out the following check out the following sample:

```C#
var connectionString = "Data Source=(local);Initial Catalog=AdventureWorks;Integrated Security=SSPI";
var connectionStringHandler = new ReportConnectionStringManager(connectionString);
var sourceReportSource = new UriReportSource { Uri = "Employee Sales Summary.trdx" };
//var sourceReportSource = new InstanceReportSource { ReportDocument = new EmployeeSalesSummary() };
var reportSource = connectionStringHandler.UpdateReportSource(sourceReportSource);
this.reportViewer1.ReportSource = reportSource;
this.reportViewer1.RefreshReport();
```
```VB
Dim connectionString = "Data Source=(local)\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=SSPI"
    Dim connectionStringHandler = New ReportConnectionStringManager(connectionString)
    Dim sourceReportSource = New UriReportSource() With { _
         .Uri = "Employee Sales Summary.trdx" _
    }
 
    Dim reportSource = connectionStringHandler.UpdateReportSource(sourceReportSource)
    Me.reportViewer1.ReportSource = reportSource
    Me.reportViewer1.RefreshReport()
```

If you intend to use the above code for modifying reports displayed by an **HTML5 Viewer**, the code must be placed in the Resolve method of a custom resolver used by the **Reporting REST service**. 

> **Note**
> <br>
> The *SetConnectionString method* must be updated to skip the check for Drill-trough report actions (NavigateToReportAction). In case of a navigation to other report, the string description of the target report will be received by the resolver's Resolve method and it will go through the same modifications.
