---
title: Using Out-proc Session State Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/using-out-proc-session-state/overview
tags: overview
published: True
position: 0
---

# Using Out-proc Session State Overview



>note This is a legacy report viewer and for new projects our recommendation is to use the latest web forms report viewer -           [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})


## 

The ReportViewer control uses the __ASP.NET session state__  to preserve the report instance that is displayed,           between page postbacks and different viewer operations. The session state, however, can be configured to run in different modes.           By default it uses the memory of the worker process (InProc mode) and the report instance stays intact. However, in some cases           it is more appropriate to use a __StateServer, SqlServer or Custom__  session state mode. All of these modes are referred to as out-proc           session state modes. The biggest difference between the two modes is that the session variables have to be serialized and deserialized           when the session state is preserved and restored. In this case the serialization process imposes the following limitations which have to           be considered when designing Telerik reports:         

* The report should have a public default constructor as it is used to instantiate the report class during the deserialization process.

* Data sources for the data items should be binary serializable.

* Report events should be attached in the report’s default constructor.

* The fields representing the report items in the Report class should not be used in the report events.
            Instead the report item should be taken from the Items collection of the report. Consider the following examples:__Wrong__ 

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\OutProcSnippets.cs region=WrongItemDataBinding}}
  ````C#
	        void Report1_WrongItemDataBinding(object sender, System.EventArgs e)
	        {
	            this.textBox1.Value = "New Value";
	        }
````



{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\OutProcSnippets.vb region=WrongItemDataBinding}}
  ````VB
	    Private Sub Report1_WrongItemDataBinding(sender As System.Object, e As System.EventArgs) Handles MyBase.NeedDataSource
	        Me.TextBox1.Value = "New Value"
	    End Sub
````

__Correct__ 

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\OutProcSnippets.cs region=CorrectItemDataBinding}}
  ````C#
	        void Report1_CorrectItemDataBinding(object sender, System.EventArgs e)
	        {
	            Telerik.Reporting.Processing.Report processingReport = (Telerik.Reporting.Processing.Report)sender;
	            Telerik.Reporting.Report reportDef = (Telerik.Reporting.Report)processingReport.ItemDefinition;
	            Telerik.Reporting.TextBox textBox = (Telerik.Reporting.TextBox)(reportDef.Items.Find("textBox1", true)[0]);
	            textBox.Value = "New Value";
	        }
````



{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\OutProcSnippets.vb region=CorrectItemDataBinding}}
  ````VB
	    Private Sub Report1_CorrectItemDataBinding(sender As System.Object, e As System.EventArgs) Handles MyBase.NeedDataSource
	        Dim processingReport = DirectCast(sender, Telerik.Reporting.Processing.Report)
	        Dim reportDef = DirectCast(processingReport.ItemDefinition, Telerik.Reporting.Report)
	        Dim textBox As Telerik.Reporting.TextBox = DirectCast(reportDef.Items.Find("TextBox1", True)(0), Telerik.Reporting.TextBox)
	        textBox.Value = "New value"
	    End Sub
````



* To utilize the events of the report items (NeedDataSource, ItemDataBinding, ItemDataBound) you have to attach
            them in the ItemDataBinding event of the Report. For example:

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\OutProcSnippets.cs region=AttachItemsEvents}}
  ````C#
	        void Report1_ItemDataBinding(object sender, System.EventArgs e)
	        {
	            Telerik.Reporting.Processing.Report processingReport = (Telerik.Reporting.Processing.Report)sender;
	            Telerik.Reporting.Report reportDef = (Telerik.Reporting.Report)processingReport.ItemDefinition;
	            Telerik.Reporting.Chart chart = (Telerik.Reporting.Chart)(reportDef.Items.Find("chart1", true)[0]);
	            chart.NeedDataSource += new System.EventHandler(Chart_NeedDataSource);
	        }
	
	        void Chart_NeedDataSource(object sender, System.EventArgs e)
	        {
	            var processingChart = (Telerik.Reporting.Processing.Chart)sender;
	            var chartDef = (Telerik.Reporting.Chart)processingChart.ItemDefinition;
	            // . . .
	        }
````



{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\OutProcSnippets.vb region=AttachItemsEvents}}
  ````VB
	    Private Sub Report1_ItemDataBinding(sender As System.Object, e As System.EventArgs) Handles MyBase.ItemDataBinding
	        Dim processingReport = DirectCast(sender, Telerik.Reporting.Processing.Report)
	        Dim reportDef = DirectCast(processingReport.ItemDefinition, Telerik.Reporting.Report)
	        Dim chart As Telerik.Reporting.Chart = DirectCast(reportDef.Items.Find("Chart1", True)(0), Telerik.Reporting.Chart)
	        AddHandler chart.NeedDataSource, AddressOf Chart1_NeedDataSource
	    End Sub
	
	    Private Sub Chart1_NeedDataSource(sender As System.Object, e As System.EventArgs)
	        Dim processingChart = DirectCast(sender, Telerik.Reporting.Processing.Chart)
	        Dim chartDef = DirectCast(sender, Telerik.Reporting.Chart)
	        ' ...
	    End Sub
````



As the data sources are kept in the session state, it is highly recommended to use the built-in [Data Source Components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}).           As a last resort you can use the NeedDataSource event to populate the report with data. Otherwise the session state will either           become very large, especially when using large datasets or the data for the report will not be serialized at all if it cannot be           binary serialized/deserialized (e.g. business objects, anonymous types, data adapters, etc.). You should restrain from setting an           instance of your business object directly as a data source, as it would be serialized multiple times into the session.         

It is highly recommended not to use events when designing reports. The reporting engine provides another powerful means to achieve the           same functionality. For example instead of using events to accomplish your goals you can take advantage of            [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}), [User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) and            [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}).         

More info about the differences between different state modes you can find in the            [ASP.NET Session State](http://msdn.microsoft.com/en-us/library/ms972429.aspx)  documentation article.         

# See Also


 * [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%})

 * [How to Add report viewer to a web page]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/how-to-add-report-viewer-to-a-web-page%})

 * [Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/report-viewer-localization%})

 * [Medium Trust Support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/medium-trust-support%})

 * [AJAX support]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/ajax-support%})
