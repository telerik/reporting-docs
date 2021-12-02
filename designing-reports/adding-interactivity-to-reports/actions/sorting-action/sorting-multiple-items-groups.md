---
title: Sorting Multiple Items/Groups
page_title: Sorting Multiple Items/Groups | for Telerik Reporting Documentation
description: Sorting Multiple Items/Groups
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/sorting-action/sorting-multiple-items-groups
tags: sorting,multiple,items/groups
published: True
position: 6
---

# Sorting Multiple Items/Groups



Prerequisites:       

* Reporting installation with the Examples feature          			

* MS SQL server with AdventureWorks         			

The examples are located in (Replace: Reporting X with your installation version)       

* Standalone Report Designer - %PROGRAMFILES(x86)%\Reporting X\Report Designer\Examples         			

* Visual Studio Integrated Designer – %PROGRAMFILES(x86)%\Reporting X\Examples\CSharp\         			

## 

Add an interactive sorting button to a parent for all targets item to enable a user to click the item adorner and sort the target data items/groups by the selected expression.          	

1. Open in report design view the Dashboard example report.         		

1. Select item to which you want to add an interactive sorting button.          		The selected item should be parent to the target groups/data items.         		For this how to use the report header section text box with Quaterly Sales text.         		

1. From __Properties window__  open the __Actions__  editor.         		

1. Select __Sorting__  option.         		

1. Click __Edit sort targets__  button to open Edit Sorting Action targets editor.         		

1. Click __New__  to add a new target.         		

1. Select the target group/data item name from the drop down. For this report use SalesPersonFullName (TableGroup).         		

1. Click __OK__ .         		

1. Click __New__  to add a new target.         		

1. Select the StoreName (TableGroup).         		

1. Click __OK__ .         		

1. In Sort expressions drop-down select the field or write expression for which you are defining a sorting action          		In this case you have to use =Sum(Fields.LineTotal)         		Specifying a sort expression is required.

1. Click __OK__ .         		

To verify the sorting action, preview the report, and then click the interactive sorting button.          	
