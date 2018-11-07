---
title: Modify report physical width proportionally in the code behind
description: Auto-size report items and physical page proportionally in Report constructor
type: troubleshooting
page_title: Set width of report, report items and physical page programmatically
slug: programmatically-modify-report-physical-width-proportionally
position: 
tags: 
ticketid: 1349673
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
Sometimes it is necessary to reuse reports on different printers with different paper width instead of using different reports for each width.
In such cases the report and its content can be adjusted to the new width programmatically to occupy the entire paper area and preserve the report layout.

## Solution
It is necessary to modify correspondingly the width of the __Report__ itself, its __PaperSize__, and __all report items__ widths.  
  
This can be done for example in the constructor of the report.  
It is important along with Report width to update also the PaperSize settings. PaperKind should be updated to 'Custom' to be able to provide custom width. If PaperKind is set to some standaard type, its standardized width will be respected in Print Preview mode. 

The rest of the report items widths can be set by iterating recursively through them. The sample code below stretches the report with a factor _widthFactor = 1.5_ :
```CSharp
public partial class Report1 : Telerik.Reporting.Report
{
    public Report1()
    {
        //
        // Required for telerik Reporting designer support
        //
        InitializeComponent();

        double widthFactor = 1.5;
        this.SetReportWidth(widthFactor);
    }

    private void SetReportWidth(double widthFactor)
    {
        this.Width *= widthFactor;
        this.PageSettings.PaperKind = System.Drawing.Printing.PaperKind.Custom;
        SizeU oldPaperSize = this.PageSettings.PaperSize;
        SizeU newPaperSize = new SizeU(oldPaperSize.Width * widthFactor, oldPaperSize.Height);
        this.PageSettings.PaperSize = newPaperSize;

        this.SetItemWidth(this, widthFactor);
    }

    private void SetItemWidth(ReportItemBase reportItem, double widthFactor)
    {
        if (reportItem is ReportItem)
        {
            ((ReportItem)reportItem).Width *= widthFactor;
        }

        foreach (ReportItemBase item in reportItem.Items)
        {
            this.SetItemWidth(item, widthFactor);
        }
    }
}
```

