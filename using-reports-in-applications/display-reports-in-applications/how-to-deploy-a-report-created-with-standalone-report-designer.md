---
title: How to Deploy a report created with Standalone Report Designer
page_title: How to Deploy a report created with Standalone Report Designer | for Telerik Reporting Documentation
description: How to Deploy a report created with Standalone Report Designer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-deploy-a-report-created-with-standalone-report-designer
tags: how,to,deploy,a,report,created,with,standalone,report,designer
published: True
position: 8
---

# How to Deploy a report created with Standalone Report Designer



The [Overview]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})         supports Telerik Reporting XML report definitions (.TRDP) in a zip package and in a plain XML format (.TRDX legacy option).       

## Display TRDP or TRDX file in a Report Viewer

To show a report created with the [Overview]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}), you have the following options:         

* __Use [UriReportSource](/reporting/api/Telerik.Reporting.UriReportSource)__  and a path to the TRDX|TRDP file:             

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSourceSnippets.cs region=CreateUriReportSourceSnippet}}
  ````C#
	            var uriReportSource = new Telerik.Reporting.UriReportSource();
	
	            // Specifying an URL or a file path
	            uriReportSource.Uri = "SampleReport.trdp";
	
	            // Adding the initial parameter values
	            uriReportSource.Parameters.Add(new Telerik.Reporting.Parameter("OrderNumber", "SO43659"));
````



{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSourceSnippets.vb region=CreateUriReportSourceSnippet}}
  ````VB
	        Dim uriReportSource As New Telerik.Reporting.UriReportSource()
	
	        ' Specifying an URL or a file path
	        uriReportSource.Uri = "SampleReport.trdp"
	
	        ' Adding the initial parameter values
	        uriReportSource.Parameters.Add(New Telerik.Reporting.Parameter("OrderNumber", "SO43659"))
````



* __Use [XmlReportSource](/reporting/api/Telerik.Reporting.XmlReportSource)__  and read the plain XML of a TRDX file:             

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSourceSnippets.cs region=CreateXmlReportSourceSnippet}}
  ````C#
	            var xmlReportSource = new Telerik.Reporting.XmlReportSource();
	
	            // Specifying the XML markup of the report
	            xmlReportSource.Xml = @"<?xml version='1.0' encoding='utf-8'?>
	                                    <Report Width='3in' Name='userReport1' xmlns='http://schemas.telerik.com/reporting/2012/2'>
	                                      <Items>
	                                        <DetailSection Height='1in' Name='detailSection1'>
	                                          <Items>
	                                            <TextBox Value='=Parameters.OrderNumber.Value' Size='2in, 0.4in' Location='0.5in, 0.3in' Name='textBox1' />
	                                          </Items>
	                                        </DetailSection>
	                                      </Items>
	                                      <PageSettings>
	                                        <PageSettings PaperKind='Letter' Landscape='False'>
	                                          <Margins>
	                                            <MarginsU Left='1in' Right='1in' Top='1in' Bottom='1in' />
	                                          </Margins>
	                                        </PageSettings>
	                                      </PageSettings>
	                                      <ReportParameters>
	                                        <ReportParameter Name='OrderNumber'>
	                                          <AvailableValues />
	                                        </ReportParameter>
	                                      </ReportParameters>
	                                    </Report>";
	
	            // Adding the initial parameter values
	            xmlReportSource.Parameters.Add(new Telerik.Reporting.Parameter("OrderNumber", "SO43659"));
````



{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSourceSnippets.vb region=CreateXmlReportSourceSnippet}}
  ````VB
	        Dim xmlReportSource As New Telerik.Reporting.XmlReportSource()
	
	        ' Specifying the XML markup of the report
	        xmlReportSource.Xml = "<?xml version='1.0' encoding='utf-8'?>" &
	                                    "<Report Width='3in' Name='userReport1' xmlns='http://schemas.telerik.com/reporting/2012/2'>" &
	                                      "<Items>" &
	                                        "<DetailSection Height='1in' Name='detailSection1'>" &
	                                          "<Items>" &
	                                            "<TextBox Value='=Parameters.OrderNumber.Value' Size='2in, 0.4in' Location='0.5in, 0.3in' Name='textBox1' />" &
	                                          "</Items>" &
	                                        "</DetailSection>" &
	                                      "</Items>" &
	                                      "<PageSettings>" &
	                                        "<PageSettings PaperKind='Letter' Landscape='False'>" &
	                                          "<Margins>" &
	                                            "<MarginsU Left='1in' Right='1in' Top='1in' Bottom='1in' />" &
	                                          "</Margins>" &
	                                        "</PageSettings>" &
	                                      "</PageSettings>" &
	                                      "<ReportParameters>" &
	                                        "<ReportParameter Name='OrderNumber'>" &
	                                          "<AvailableValues />" &
	                                        "</ReportParameter>" &
	                                      "</ReportParameters>" &
	                                    "</Report>"
	
	        ' Adding the initial parameter values
	        xmlReportSource.Parameters.Add(New Telerik.Reporting.Parameter("OrderNumber", "SO43659"))
````



* __Deserialize the XML report definition from a TRDX file__ :             If working with CLR types and objects is your thing, you can deserialize the XML report definition and proceed               following the basic concepts of the programming language and the .NET platform. For example you can create an InstanceReportSource and               and set its ReportDocument property to the deserialized report object. See [Serialize Report Definition in XML]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}) for more information.             

* __Unpackaging the XML report definition from a TRDP file__ :             If you need to obtain a Telerik Report instance in code from a TRDP file, you can unpackage the content in code. Then create an InstanceReportSource and               set its ReportDocument property to the unpackaged report object. See [Package Report Definition]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}) for more information.             

The only thing left to do is assign the resulting report sources to the report viewer's ReportSource property.

# See Also


 * [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})

 * [Reference Report Definitions in Applications]({%slug telerikreporting/using-reports-in-applications/reference-report-definitions-in-applications%})

 * [How to Set ReportSource for Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%})

 * [Previewing a report definition that uses an external assembly](http://www.telerik.com/support/kb/reporting/report-viewers/deploying-trdx-that-uses-external-assembly.aspx)
