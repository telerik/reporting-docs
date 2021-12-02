---
title: Graph Item Actions
page_title: Graph Item Actions | for Telerik Reporting Documentation
description: Graph Item Actions
slug: telerikreporting/designing-reports/adding-interactivity-to-reports/actions/graph-item-actions
tags: graph,item,actions
published: True
position: 6
---

# Graph Item Actions

The Graph item supports actions on the axis labels defined by the Graph's category groups (__Graph.CategoryGroups.Action__ ),         and on series' data points (__Graph.SeriesGroups.Action__ ).       

The labels for an axis with __CategoryScale__  are produced by the graph's category groups.         They are layout in levels based on the corresponding category group from the group hierarchy.         Graph groups that are part of the          [CategoryGroups](/reporting/api/Telerik.Reporting.Graph#Telerik_Reporting_Graph_CategoryGroups)          hierarchy support interactive actions.         The added actions will make the graph axis labels interactive (clickable).       

>note When the axis uses a NumericalScale, LogarithmicScale, DateTimeScale, the labels for an axis are produced           automatically based on the Scale properties. In such case, only data points are clickable after setting the Graph.CategoryGroups.Action property.         


## Add action to a category group using the Graph Wizard

The easiest way to setup drill-down graph categories is to use the Graph Wizard.           When the category groups hierarchy contains more than one level (parent-child relation)           the wizard will generate a drill-down action for each parent group so that it           collapses its children. The initial state of the child groups will be collapsed (not visible).         

## Add action to a category group using the Property Browser

1. Select the Graph item.    The selected graph properties are listed in the __Property Browser__ .                 

1. In the __CategoryGroups__  property, click the                   __Edit Collection (…) button__ . The GraphGroup Collection Editor opens.                 

1. Select the category group you want to add an action to. It should contain child group(s)                   that will be used as toggle visibility target.                     The selected graph group properties are listed in the __Property Browser__                    on the left.                 

1. In the __Action__  property, click the __Edit Collection (…) button__ . The Edit Action dialog opens.                 

1. Setup the desired action.                 

>note Category group drill-down action can toggle the visibility of its child groups only. Use the child group's Visible property to setup its initial visibility state.           


Adding an action to a series group is identical to the approach shown above.         

# See Also

 * [Action](/reporting/api/Telerik.Reporting.GraphGroup#collapsible-Telerik_Reporting_GraphGroup_Action)
 
 * [Actions Overview]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/overview%})
 