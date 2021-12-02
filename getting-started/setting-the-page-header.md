---
title: Setting the Page Header
page_title: Setting the Page Header | for Telerik Reporting Documentation
description: Setting the Page Header
slug: telerikreporting/getting-started/setting-the-page-header
tags: setting,the,page,header
published: True
position: 2
---

# Setting the Page Header



This article is part of the Demo report guide on getting started with Telerik Reporting and demonstrates         how to customize the page header by setting the background and adding a title and a logo.       

## Setting the Header and the Title

1. Click __pageHeaderSection__ .             

1. From the __Properties__  grid, select __Style__  > __BackgroundColor__                and set the __0, 105, 104__  color.             

1. From the bar, select __Insert__  to add the title. Click __TextBox__                to automatically place the [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%}) in the header.             

1. Set the __Value__  to be "Telerik". Add one more TextBox with text "Demo Report".             

1. Mark the textboxes and from the __Properties__  grid, make the following settings:             

   + __Style > Font__  should be Segoe UI.                 

   + __Style > Font Color__  set to __White__ .                 

1. Add a [Shape]({%slug telerikreporting/designing-reports/report-structure/shape%}) between the textboxes. Set the __ShapeType__  to be               __Vertical Line__  and the __LineColor__  property to be __White__ .             

## Adding the Logo

1. Go to __Insert__  and select [PictureBox]({%slug telerikreporting/designing-reports/report-structure/picturebox%}).             

1. Include the desired picture through the __Value__  property. If you need to adjust the size of the picture, use the __Sizing__  property.             

## Previewing the Result

Preview the result by clicking __Preview__  > __PrintPreview__ .           

  ![Page Header](images/PageHeader.PNG)

## Next Steps

* [Creating the Table and Populating it with Data]({%slug telerikreporting/getting-started/creating-the-table-and-populating-it-with-data%})

* [Creating the Graph]({%slug telerikreporting/getting-started/creating-the-graph%})

* [Setting the Page Footer]({%slug telerikreporting/getting-started/setting-the-page-footer%})

* [Integrating the Report in .NET Framework Application]({%slug telerikreporting/getting-started/integrating-the-report-in-.net-framework-application%})

* [Parameterizing the Graph]({%slug telerikreporting/getting-started/parameterizing-the-graph%})

* [How to Add Column Graph]({%slug telerikreporting/getting-started/how-to-add-column-graph%})

## Previous Steps

* [First Steps]({%slug telerikreporting/getting-started/first-steps%})

* [Creating the Demo Report]({%slug telerikreporting/getting-started/creating-the-demo-report%})
