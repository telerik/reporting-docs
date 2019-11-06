---
title: How to Manipulate Table Rows Based on their Position in the Physical Page
description: See how to alternate table row background color with the first data row on each new page having the same background color, independent on the color of the previous row.
type: how-to
page_title: Manipulate Table Rows Based on their Position in the Physical Page
slug: manipulate-table-rows-based-on-their-position-in-the-physical-page
position: 
tags: 
ticketid: 1427166
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
In some scenarios with alternating table row colors, it is necessary on each new page the first data row to have constant background color, independent on the color of the previous row rendered as last on the previous page. The column headers should be rendered on each page with unaltered properties.

## Solution
The Reporting engine uses the GDI to calculate the space occupied by report elements. This functionality is not exposed in the Reporting API. Therefore, it is necessary to use [System.Reflection](https://docs.microsoft.com/en-us/dotnet/api/system.reflection?view=netframework-4.8) to modify the color of the items in a table row based on their position on the page.
This can be done in the [ItemDataBinding event](../e-telerik-reporting-reportitembase-itemdatabinding) of a Page section (e.g. _PageHeader_). The main idea is to get the actual measured height of the table row (here we need reflection as these properties are not exposed) and calculate whether it will fit on the current page or needs to be transferred to the next page with its background color reset.

For simplicity in the code we assume that:
* all the measures are in inches 
* the Table starts at vertical position 0 in its container section

```CSharp
namespace ReportLibrary1
{
    using System;
    using System.ComponentModel;
    using System.Drawing;
    using System.Linq;
    using System.Reflection;
    using Telerik.Reporting.Drawing;
    using Telerik.Reporting.Processing;

    /// <summary>
    /// Summary description for Report1
    /// </summary>
    public partial class Report1 : Telerik.Reporting.Report
    {
        const int columnHeaderRowCount = 1;// This value should be tuned according to your setup
        readonly Color mainColor = Color.Red;
        readonly Color secondaryColor = Color.DarkCyan;

        readonly static PropertyInfo measurementsProp;
        static PropertyDescriptor heightProp = null;

        // Used to avoid multiple item color modifications
        Telerik.Reporting.Processing.Report processingReportInstance = null;

        static Report1()
        {
            measurementsProp = typeof(Telerik.Reporting.Processing.TextBox).GetProperties(BindingFlags.Instance | BindingFlags.NonPublic)
                .First(pi => pi.Name == "Measurements");
        }

        public Report1()
        {
            //
            // Required for telerik Reporting designer support
            //
            InitializeComponent();

            //
            // TODO: Add any constructor code after InitializeComponent call
            //
        }

        private void pageHeaderSection1_ItemDataBinding(object sender, EventArgs e)
        {
            Telerik.Reporting.Processing.PageSection processingPageHeader = (Telerik.Reporting.Processing.PageSection)sender;
            Telerik.Reporting.Processing.Report processingReport = processingPageHeader.Report;

            if (this.processingReportInstance == processingReport)
            {
                return;
            }
            else
            {
                this.processingReportInstance = processingReport;
            }

            var useMainColor = true;

            // Get the instance of the Processing Table
            Telerik.Reporting.Processing.Table processingTable =
                (Telerik.Reporting.Processing.Table)ElementTreeHelper.FindChildByName(processingReport, "table1", true)[0];

            int tableColumnCount = this.table1.ColumnGroups.Count;
            var tableColumnHeaderHeight = 0f;

            int rowIndex = 0;
            for (; rowIndex < columnHeaderRowCount; rowIndex++)
            {
                var row = processingTable.Rows[rowIndex];
                var textBox = (Telerik.Reporting.Processing.TextBox)row.GetCell(0).Item;
                tableColumnHeaderHeight += GetMeasuredHeight(textBox);
            }

            // assumes all sizes are in the same Units (inch)
            float pageSectionsHeight = this.pageFooterSection1.Height.Value + this.pageHeaderSection1.Height.Value;
            float usablePageHeight = this.PageSettings.PaperSize.Height.Value - this.PageSettings.Margins.Top.Value - this.PageSettings.Margins.Bottom.Value;
            float availableHeight = usablePageHeight - pageSectionsHeight - tableColumnHeaderHeight;//here we assume that the Table starts at vertical position 0 in its container section

            float heightOccupiedByTable = 0f;
            for (; rowIndex < processingTable.Rows.Count; rowIndex++)
            {
                var row = processingTable.Rows[rowIndex];
                var textBox = (Telerik.Reporting.Processing.TextBox)row.GetCell(0).Item;

                var rowHeight = GetMeasuredHeight(textBox);
                heightOccupiedByTable += rowHeight;

                if (heightOccupiedByTable > availableHeight)
                {
                    useMainColor = true;
                    heightOccupiedByTable = rowHeight;
                }

                for (int columnIndex = 0; columnIndex < tableColumnCount; columnIndex++)
                {
                    var textBoxItem = (Telerik.Reporting.Processing.TextBox)row.GetCell(columnIndex).Item;
                    textBoxItem.Style.BackgroundColor = useMainColor ? this.mainColor : this.secondaryColor;
                }

                useMainColor = !useMainColor;
            }
        }

        private static float GetMeasuredHeight(Telerik.Reporting.Processing.TextBox textBox)
        {
            var m = measurementsProp.GetValue(textBox);
            if (null == heightProp)
            {
                heightProp = TypeDescriptor.GetProperties(m)["Height"];
            }

            return Unit.Mm((long)heightProp.GetValue(m) / 100.0).ChangeType(UnitType.Inch).Value;// the Measurements are internally kept in hundreds of millimeters, hence the division
        }
    }
}
```

* The first for-cycle in the __pageHeaderSection1_ItemDataBinding__ event handler is used to skip the table headers. Their count should be known apriori and is stored in the _columnHeaderRowCount_ field of the report class.  
* The second for-cycle is the one that iterates over the data rows and their items (only _TextBoxes_ for simplicity) and sets their background color. All table rows (header and detail) are stored in the same collection, therefore we use the same indexer for the two cycles.  
* The [PropertyDescriptor](https://docs.microsoft.com/en-us/dotnet/api/system.componentmodel.propertydescriptor?view=netframework-4.8) _heightProp_ stores the measured height of the TextBox in the corresponding table cell. The height is returned by the _GetMeasuredHeight_ method in inches.
* The height of the rows is accumulated until the total height exceeds the available height of the page (_availableHeight_). At this point the row should be transferred to a new page and its color should be reset - controlled by the Boolean field _useMainColor_.  
* The _processingReportInstance_ field is used to avoid multiple identical modifications of the same processing report instance properties. 
