---
title: Action NavigateToReport does not work after updating the Connection String dynamically in a Custom Report Resolver
description: NavigateToReport action will be corrupted if the Connection String is changed dynamically in the Custom Report Resolver
type: troubleshooting
page_title: Report item will not navigate to report when the Connection String is modified dynamically in the code
slug: navigate-to-report-not-working-when-custom-report-resolver-changes-connectionstring-dynamically
position: 
tags: 
ticketid: 1172947
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
Sometimes it is necessary to change the connection string dynamically, in the code. The approach described in  [Changing the connection string dynamically according to runtime data](https://www.telerik.com/support/kb/reporting/details/changing-the-connection-string-dynamically-according-to-runtime-data) KB article is suitable for Desktop Viewers.
It can be applied also for the Html5 Web Viewers __with some modifications__. The connection string should be changed in the _Resolve()_ method of the Custom Report Resolver.

When there is a _NavigateToReport_ Action set for any report item, the action will not work after updating the connection string.

## Solution
The above KB article drills through the entire report to modify the connection string of all its _Items_, _Parameters_ and _Actions_.  
The code from the KB searches for _NavigateToReport_ Actions, and replaces recursively the connection string also in Action _ReportSources_. That is where the problem occurs.  
You should **remove** the corresponding code that **drills through the Actions**, as it is excessive in the case of _Html5 Report Viewer / REST Service_. 
The _REST Service_ will automatically resolve the _ReportSource_ of the _NavigateToReport_ Action using the Custom Report Resolver, hence its connection string will be automatically modified and it is not necessary to drill through actions in the main report.  

The following code is appropriate for applications using Telerik Reporting REST Service :

**C#**
```CSharp
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

**VB.NET**
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
## Notes
When navigating to a Standalone designer report (.trdp, .trdx, .trbp) the paths to the reports will be resolved with respect to the application, not with respect to the main report. This may cause broken _NavigateToReport_ Actions when the report is not in the main folder of the application. To resolve the issue it will be necessary to replace the base path from the UriReportSource.Uri with the actual one (path to the application main folder).


Connection string can be modified run time without extra code, based on Report Parameter: [Change Connection String dynamically through a report parameter](../knowledge-base/how-to-pass-connectionstring-to-report-dynamically-through-report-parameter).
