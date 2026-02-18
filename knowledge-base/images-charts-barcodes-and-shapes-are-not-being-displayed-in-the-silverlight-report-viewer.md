---
title: Images, Charts, Barcodes and Shapes are not being displayed in the Silverlight report viewer.
description:  When a report is previewed in the Silverlight report viewer, Images, Charts, Barcodes and Shapes are missing, however they are present when exporting to one of the supported formats.  
type: how-to
page_title: The Silverlight report viewer does not render Images, Charts, Barcodes and Shapes.
slug: images-charts-barcodes-and-shapes-are-not-being-displayed-in-the-silverlight-report-viewer
res_type: kb
sitemap: false
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		 <tr>
			<td>Application Type</td>
			<td>Silverlight Application</td>
		</tr>
                <tr>
			<td>Report Viewer</td>
			<td>Silverlight Report Viewer</td>
		</tr>
	</tbody>
</table>

> The Silverlight Report Viewer and its WCF Reporting Service are no longer supported and deployed with the installation of Telerik Reporting. The last release of Telerik Reporting with included Silverlight Report Viewer is [R1 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2023-17-0-23-118).\

## Description

 When a report is previewed in the Silverlight report viewer, Images, Charts, Barcodes and Shapes are missing, however they are present when exporting to one of the supported formats.  
   
## Solution

- **Resources endpoints misconfiguration**

The most probable reason is missing resource endpoint for the [Telerik Reporting WCF Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/overview%}) that is responsible for serving all images: Picturebox, Chart, Shapes and Barcodes.

For proper configuration please refer to the [Hosting WCF Service in IIS]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-add-telerik-reporting-wcf-service-to-web-application%}) help article.   

The **Silverlight report viewer** lives entirely on the *client* side, while the report rendering is performed on the *server*. The **XAML** rendering extension (used by Silverlight report viewer) streams images as resources (similar to HTML), so if the resource endpoint is missing in the service configuration, the images would not be served. When exporting, images are embedded in the export file.  
   
- **URL rewriting and load balancing scenarios**  

Other reason for missing images in the rendered in XAML report is the usage of URL rewriting or load balancing where the Reporting WCF Service URL is not the same as the displayed in browser. In such scenarios inherit the report service and override its property `Telerik.Reporting.Service.ReportServiceBase.BaseAddress` which is the Uri used from the XamlRendering for the resources address (e.g., images).
   
Example:  

````C#
namespace CSharp.SilverlightDemo.Web
{
    using System;
    using System.Collections.Generic;
    using System.Web;
    using Telerik.Reporting.Service;
 
    public class MyService : ReportService
    {
        protected override Uri BaseAddress
        {
            get
            {
                // Sample
                return new Uri("http://www.mysite.com/ReportService.svc");
 
                // Original logic quoted for reference
                //var request = this.HttpContext.Request;
                //var response = this.HttpContext.Response;
                //return new UriBuilder(request.Url.GetLeftPart(UriPartial.Authority))
                //    {
                //        Path = response.ApplyAppPathModifier(request.RawUrl)
                //    }
                //    .Uri;
            }
        }
    }
}
````
````VB
Imports System.Collections.Generic
Imports System.Web
Imports Telerik.Reporting.Service
Namespace CSharp.SilverlightDemo.Web
  
    Public Class MyService
        Inherits ReportService
        Protected Overrides ReadOnly Property BaseAddress() As Uri
            Get
                ' Sample
  
                    ' Original logic quoted for reference
                    'var request = this.HttpContext.Request;
                    'var response = this.HttpContext.Response;
                    'return new UriBuilder(request.Url.GetLeftPart(UriPartial.Authority))
                    '    {
                    '        Path = response.ApplyAppPathModifier(request.RawUrl)
                    '    }
                    '    .Uri;
                Return New Uri("http://www.mysite.com/ReportService.svc")
            End Get
        End Property
    End Class
End Namespace
```` 
   
Finally, change the **ReportService.svc** and the **Web.config** files in order to use the modified service.  
