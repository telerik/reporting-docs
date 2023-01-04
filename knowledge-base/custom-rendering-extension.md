---
title: How to Create Custom Rendering Extension
description: Implementing Custom IRenderingExtension
type: how-to
page_title: Custom IRenderingExtension
slug: custom-rendering-extension
position: 
tags: 
ticketid: 1461614
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
In the forum thread [Export to XML](https://www.telerik.com/forums/export-to-xml) you can find a sample implementation of custom 
XML rendering extension. Here we explain some important requirements that you need to meet in order for the rendering extension 
to work as expected. 

## Solution
In the configuration file of the application, it is necessary to register the Custom Extension:
```XML
<Telerik.Reporting>
    <Extensions>
      <Render>
        <Extension name="CustomExtensionName" 
                   type="NameSpace.CustomRenderingExtension, ProjectName" 
                   description="This Value Will Appear As Extension Name In the Export Options of the Viewers and Designers">
        </Extension>
      </Render>
    </Extensions>
  </Telerik.Reporting>
```

Here is sample code of the _NameSpace.CustomRenderingExtension_ type implementing the 
[IRenderingExtension](/api/telerik.reporting.processing.irenderingextension) interface, adapted from the example in the above 
forum thread. The _XmlReportWriter_ is the class that renders the report items in the custom XML format. Its implementation 
can be found in the sample from the forum thread.
```C#
namespace NameSpace
{
    public class CustomRenderingExtension : Telerik.Reporting.Processing.IRenderingExtension
    {
        static bool ShouldCountOnly(IDictionary renderingContext)
        {
            if (renderingContext.Contains("CountOnly"))
            {
                return (bool)renderingContext["CountOnly"];
            }

            return false; // Default
        }

        public bool Render(Telerik.Reporting.Processing.Report report
            , System.Collections.Hashtable renderingContext
            , System.Collections.Hashtable deviceInfo
            , Telerik.Reporting.Processing.CreateStream createStreamCallback
            , Telerik.Reporting.Processing.EvaluateHeaderFooterExpressions evalHeaderFooterCallback)
        {
            if (ShouldCountOnly(renderingContext))
            { // Our custom rendering extension format (XML) does not have pages, so we do not need to count pages.
                return true;
            }
	    
	    // The purpose of this method call is to evaluate the Expressions on the page sections of the only page that we have
	    evalHeaderFooterCallback(1, 1, report);

            var stream = createStreamCallback("report/CustomExtensionName", "xml", Encoding.UTF8, "application/xml");

            using (var xmlWriter = new XmlTextWriter(stream, Encoding.UTF8))
            {
                new XmlReportWriter(xmlWriter).Write(report);
            }

            var renderingStream = stream as IRenderStream;

            if (null != renderingStream)
            {
                renderingStream.Finish();
            }

            return true;
        }

        void Telerik.Reporting.IExtension.Initialize(System.Collections.Hashtable deviceInfo)
        {
        }

        public void Dispose()
        {
        }
    }

    ...
}
```
Consider the following points: 

* It is necessary to add code that skips the page count phase of the report rendering. If the report you render utilizes _PageCount_, 
it will fail without this code:
```C#
if (ShouldCountOnly(renderingContext))
{ // Our custom rendering extension format (XML) does not have pages, so we do not need to count pages.
    return true;
}
```
* If the report has [Page Header/Footer]({% slug telerikreporting/designing-reports/report-structure/how-to/how-to-add-remove-page-header---footer-sections %}) and report items with [Expressions]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/overview %}) in them, we need to call the following method in order to evaluate the Expressions:
```C#
evalHeaderFooterCallback(1, 1, report);
```
In the above code, we assume that the XML document contains only one page. Hence, the arguments are page '__1__' from a total of __1__ page and the __report__. If we don't call the method, the raw Expressions will be displayed as content of the report items in the page sections.  
It is up to the implementor of the custom rendering extension to specify how many pages there will be in the final document and what should be the content of each page section. This is the main reason for the Page Header/Footer evaluation to happen separately from the other sections' content.
* Create a stream for storing the rendered document. The name of the stream should be formed as 
"report/{extension name from the config file}", for example, in this case, it should be "report/CustomExtensionName". Here is 
the relevant code from the above snippet:
```C#
var stream = createStreamCallback("report/CustomExtensionName", "xml", Encoding.UTF8, "application/xml");
```
* Finalize the stream to indicate that there is no additional content to be added: 
```C#
var renderingStream = stream as IRenderStream;

if (null != renderingStream)
{
    renderingStream.Finish();
}
```

