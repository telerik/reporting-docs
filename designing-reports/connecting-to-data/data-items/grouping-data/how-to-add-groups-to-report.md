---
title: How to Add groups to Report
page_title: How to Add groups to Report | for Telerik Reporting Documentation
description: How to Add groups to Report
slug: telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report
tags: how,to,add,groups,to,report
published: True
position: 2
---

# How to Add groups to Report



Report groups are defined by adding __Group__  objects to the report’s __Groups__  collection. Report groups are always nested according to the order in the Groups collection. To display group data one should use the __GroupHeaderSection__  and __GroupFooterSection__  that appear once for each group member, respectively at start and end. The DetailSection displays detail data in a report and always appears inside the innermost group (if any). To add a group, follow these steps:

## Adding a group to a Report using Report Designer

1. Click the Report selector button located in the upper left hand of the[Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%})

1. Click the __Groups__  ellipsis.

1. Follow these steps for each group:

   1. 	          				Click Add button - a new unbound group will be added to the __Groups__  collection. 
	                    

   1. 	                    	Click the Grouping property ellipsis. 
	          			

   1. 				        	From the Edit [Grouping dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-grouping-dialog%}), type or select an expression by which to group the data. 
				        

   1. 	          				To apply sorting to the group, follow these steps:
          				

   +           				     	Click the Sorting ellipsis.
          					 

   + 					         	Click New
					         

   + 					         	Type or select an expression by which to sort the data. 
					         

   + 					         	From the Direction column drop-down list, choose the sort direction for each expression. ASC sorts the expression in ascending order. DESC sorts the expression in descending order.
					         

   1.           				To apply filtering to the group, follow these steps:
          				

   +           					   		Click the Filters ellipsis 
          					   

   +           			           		Click New. 
         					   

   +                     		   		In Expression, type or select the expression for the field to filter. To open the Edit Expression Dialog, select the ```<Expression>``` option.
          					   

   +                     		   		In the Operator box, select the operator that you want the filter to use to compare the values in the Expression box and the Value box. 
          					   

   +                                		In the Value box, type the expression or value against which you want the filter to evaluate the value in Expression.
          				       

   1.           			 		In Name, type the name of the group. 
          			

   1.                     		Click GroupKeepTogether to specify the keep together options. 
          			

   1.                     		Click BookMarkID to set a BookMark for this group.
          			

1. Click Ok twice to close the Edit Grouping and Group Collection dialogs.

>note You can add a group to the Report item by using the grouping pane in the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) as well. To do so right click on the detail and select  __Add Parent Group__ . If there are existing groups, you can create Parent or Child groups by right clicking on any of the existing groups. 


## Edit a group in a Report using Report Designer

1.       			In the __Report Designer__ , click the Report selector button located in the upper left hand of the [Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) to make the report active in the Properties window. The Grouping pane in the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) displays the available groups (if any).
      		

1.       			Right-click the group, and then click __Group Properties__ . 
      		

1.       			In __Name__ , type the name of the group. 
      		

1.       			In __Grouping property__ , type or select a simple expression, or click the ```<Expression>``` option to create a new group expression. 
      		

1.       			Click __New__  to create additional expressions. All expressions you specify are combined using a logical AND to specify data for this group. 
      		

1.       			To allow sorting for the group, follow these steps:
      			

   +       						Click the Sorting ellipsis.
      				

   +       						Click New. 
      				

   +       						Type or select an expression by which to sort the data. 
      				

   +       						From the Direction column drop-down list, choose the sort direction for each expression. ASC sorts the expression in ascending order. DESC sorts the expression in descending order.
      				

1. To allow filtering for the group, follow these steps: 
      			

   +       					Click the Filters ellipsis 
      				

   +       					Click New.
      				

   +       					In __Expression__ , type or select the expression for the field to filter. To open the [Edit Expression Dialog]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-expression-dialog%}), select the ```<Expression>``` option. 
      				

   +       					In the __Operator__  box, select the operator that you want the filter to use to compare the values in the Expression box and the Value box. 
      				

   +       					In the __Value__  box, type the expression or value against which you want the filter to evaluate the value in Expression.
      				

1.       			Click __GroupKeepTogether__  to specify the keep together options.
      		

1.       			Click __BookMarkID__  to set a BookMark for this group.
      		

## Delete a group from a Report using Report Designer

1.       			Click the Report selector button located in the upper left hand of the [Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}). This makes the report active in the Properties window. The grouping pane in the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) displays the available groups (if any).
      		

1.       			Right click on the group and select __Delete Group__ .
      		

1.       			When prompted to delete it, __Select Yes__ . 
      		

## Adding a group to a Report programatically

{{source=CodeSnippets\CS\API\Telerik\Reporting\ReportSnippets.cs region=AddNewGroupSnippet}}
````C#
	
	            Telerik.Reporting.Group group1 = new Telerik.Reporting.Group();
	            group1.Name = "group1";
	            group1.Groupings.Add(new Telerik.Reporting.Grouping("=Fields.ProductID"));
	            Telerik.Reporting.GroupFooterSection groupFooterSection1 = new Telerik.Reporting.GroupFooterSection();
	            Telerik.Reporting.GroupHeaderSection groupHeaderSection1 = new Telerik.Reporting.GroupHeaderSection();
	            group1.GroupFooter = groupFooterSection1;
	            group1.GroupHeader = groupHeaderSection1;
	            //if you need to filter the data, apply filtering
	            group1.Filters.Add(new Telerik.Reporting.Filter("=Fields.ProductID", Telerik.Reporting.FilterOperator.Equal, "=10"));
	            //if you need to sort the data, apply sorting
	            group1.Sortings.Add(new Telerik.Reporting.Sorting("=Fields.ProductID", Telerik.Reporting.SortDirection.Asc));
	
	            report1.Groups.Add(group1);
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\ReportSnippets.vb region=AddNewGroupSnippet}}
````VB
	
	        Dim group1 As New Telerik.Reporting.Group()
	        group1.Name = "group1"
	        group1.Groupings.Add(New Telerik.Reporting.Grouping("=Fields.ProductID"))
	        Dim groupFooterSection1 As New Telerik.Reporting.GroupFooterSection()
	        Dim groupHeaderSection1 As New Telerik.Reporting.GroupHeaderSection()
	        group1.GroupFooter = groupFooterSection1
	        group1.GroupHeader = groupHeaderSection1
	        'if you need to filter the data, apply filtering
	        group1.Filters.Add(New Telerik.Reporting.Filter("=Fields.ProductID", Telerik.Reporting.FilterOperator.Equal, "=10"))
	        'if you need to sort the data, apply sorting
	        group1.Sortings.Add(New Telerik.Reporting.Sorting("=Fields.ProductID", Telerik.Reporting.SortDirection.Asc))
	
	        report1.Groups.Add(group1)
````



# See Also


 * [Report](/reporting/api/Telerik.Reporting.Report) 

 * [Groups](/reporting/api/Telerik.Reporting.Report#Telerik_Reporting_Report_Groups) 
