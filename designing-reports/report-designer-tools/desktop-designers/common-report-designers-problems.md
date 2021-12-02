---
title: Common Report Designers Problems
page_title: Common Report Designers Problems | for Telerik Reporting Documentation
description: Common Report Designers Problems
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/common-report-designers-problems
tags: common,report,designers,problems
published: True
position: 3
---

# Common Report Designers Problems



## Font is missing in report designers

Please refer to the information from the following KB article:  [Font is missing in report designers.](http://www.telerik.com/support/kb/reporting/details/font-is-missing-in-report-designers) 

## Report designers don't work on Windows Server platforms

The desktop Report Designers need the assembly *Microsoft.mshtml*  for the HtmlTextBox designer.            The assembly can be found by default in the Global Assembly Cache of most Windows OS. The Windows Server Operating Systems            lack the specified assembly and for that reason the designers crash on these systems, with an error message indicating that            the assembly is missing.         

The Reporting engine and the Telerik Reporting REST Services work correctly also on Windows Server Operating Systems.            Hence, the  Windows Server OS can be used for deploying Telerik Reporting projects. For designing reports it is            necessary to use Windows OS editions for personal computers like Windows 10.         

# See Also

