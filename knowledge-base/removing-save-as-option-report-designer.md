---
title: Removing 'Save As' Option in the Web Report Designer
description: "Learn how to remove the 'Save As' option in Telerik Reporting's Web Report Designer and restrict saving specific report formats."
type: how-to
page_title: How to Remove 'Save As' from the Web Report Designer
meta_title: How to Remove 'Save As' from the Web Report Designer
slug: removing-save-as-option-report-designer
tags: reporting, web report designer, save as, permissions, css, savereportbyuriasync
res_type: kb
ticketid: 1700797
---

## Environment
<table>
   <tbody>
      <tr>
         <td>Product</td>
         <td>Reporting</td>
      </tr>
      <tr>
         <td>Version</td>
         <td>19.2.25.1001</td>
      </tr>
      <tr>
         <td>Project Type</td>
         <td>ASP.NET Core</td>
      </tr>
   </tbody>
</table>

## Description

I want to remove the 'Save As' option from the Web Report Designer UI to ensure users can only edit a predefined report. I have tried modifying permissions, but removing `Permission.Commands_Document_Save` leaves the 'Save As' option visible. Is there a way to hide this option or restrict saving specific report formats programmatically?

This knowledge base article also answers the following questions:
- How to hide the 'Save As' button in Telerik Web Report Designer?
- How to disable saving specific report formats in Telerik Reporting?
- How to override the saving functionality in Telerik Web Report Designer?

## Solution

To remove the 'Save As' option from the Web Report Designer, use the following approaches:

### Using CSS to Hide the 'Save As' Button
Add the following CSS rule to hide the 'Save As' button from the menu:

```CSS
li[data-action='documentSaveAs'] {
   display: none;
}
```

This CSS rule targets the 'Save As' button based on its data-action attribute and hides it from the user interface.

### Restricting Saving Specific Report Formats
Override the `SaveReportByUriAsync` method of the `ReportDesignerController` to restrict saving specific report formats, such as `.trdp`. Use the following example:

```C#
namespace YourNamespace.Controllers
{
    using Microsoft.AspNetCore.Mvc;
    using System.IO;
    using System.Threading.Tasks;
    using Telerik.Reporting.Services;
    using Telerik.WebReportDesigner.Services;
    using Telerik.WebReportDesigner.Services.Controllers;

    [Route("api/reportdesigner")]
    public class ReportDesignerController : ReportDesignerControllerBase
    {
        public ReportDesignerController(IReportDesignerServiceConfiguration reportDesignerServiceConfiguration, IReportServiceConfiguration reportServiceConfiguration)
            : base(reportDesignerServiceConfiguration, reportServiceConfiguration)
        {
        }

        public override async Task<IActionResult> SaveReportByUriAsync([FromQuery] string uri)
        {
            if(Path.GetExtension(uri).Equals(".trdp", System.StringComparison.CurrentCultureIgnoreCase))
            {
                return await Task.FromResult(this.GetDisabledForDemoJsonErrorResponse("Saving a report"));
            }

            return await base.SaveReportByUriAsync(uri);
        }

        JsonResult GetDisabledForDemoJsonErrorResponse(string verbAndItemPartOfError)
        {
            string message = $"{verbAndItemPartOfError} is disabled in this demo";
            return this.CreateJsonResponse(
                System.Net.HttpStatusCode.BadRequest,
                new ErrorResponse(string.Empty, message, message));
        }

        private class ErrorResponse
        {
            public string ErrorCode { get; }
            public string Message { get; }
            public string Details { get; }

            public ErrorResponse(string errorCode, string message, string details)
            {
                this.ErrorCode = errorCode;
                this.Message = message;
                this.Details = details;
            }
        }
    }
}
```

This code prevents saving reports with a `.trdp` extension and returns a custom error message for restricted saving actions.

## See Also

* [Web Report Designer Overview]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
* [Customizing via Permissions in the Web Report Designer]({%slug telerikreporting/report-designer-tools/web-report-designer/web-report-designer-customization%})

