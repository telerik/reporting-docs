---
title: Parallels and Meridians
page_title: Styling and Configuring the Map Parallels and Meridians
description: "Learn how to configure and style the appearance of the Parallels and Meridians of the Telerik Reporting Map report item."
slug: telerikreporting/designing-reports/report-structure/map/formatting-a-map/parallels-and-meridians
tags: telerik, reporting, map, report, item, parallels, and, meridians
previous_url: /MapFormattingParallelsMeridians
published: True
reportingArea: General
---

# Configuring Parallels and Meridians

The parallels and meridians represent the coordinate system grid that is called a graticule and can be formatted by using the __Property Browser__.

## Setting the Step

Both parallels and meridians define a step that determines the density of their lines. By default, the step value is __NaN__, which automatically adjust the graticule lines depending on the current map extent. The smaller the extent is, the smaller the graticule step becomes.

To change the step of the parallels or meridians:

1. Click the Map item you want to change. The selected map properties are listed in the __Property Browser__.
1. Expand the __Parallels__ or __Meridians__ property.
1. Select the __Step__ property and set it to the desired value.
1. When you are done, press __Enter__.

## Styling the Appearance

You can change the style of the parallels and meridians by selecting the respective property and by using the __Style__ properties of the __Property Browser__.

To change the style of the parallels or meridians:

1. Click the map item you want to change. The selected map properties are listed in the __Property Browser__.
1. Expand the __Parallels__ or __Meridians__ property.
1. In the __Style__ property, click the __Edit Collection (…)__ button. As a result, the __Edit style__ dialog opens.
1. When you are done, click **OK**.

## See Also
 
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
* [(API) GraticuleLine](/api/Telerik.Reporting.GraticuleLine)
* [(API) Style](/api/Telerik.Reporting.Drawing.Style)
* [Structure and Elements of the Map Report Item]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%})
* [Product Page for Telerik Reporting](https://www.telerik.com/products/reporting)
