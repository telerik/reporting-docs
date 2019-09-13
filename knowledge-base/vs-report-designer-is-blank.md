---
title: The Visual Studio Report Designer is blank
description: The Visual Studio Report Designer is blank
type: troubleshooting
page_title: The Visual Studio Report Designer is blank
slug: vs-report-designer-is-blank
tags: vs designer
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
The Visual Studio Report Designer does not display anything when trying to open a report. 

## Solution
1.	Run the [Upgrade Wizard](../ui-upgrade-wizard). 
2.	Restart Visual Studio. 
3.	If the report cannot be loaded by the Visual Studio Report Designer, navigate to the definition of the __InitializeComponent__ report method. As a result, you will see the Designer report class. 
4.	If the Designer report class is not visible, refer to the KB article on [Visual Studio Report Designer being blank](/visual-studio-report-designer-is-blank). 
