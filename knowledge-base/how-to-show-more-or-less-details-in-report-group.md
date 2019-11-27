---
title: How to show more/less details in a Report
description: How to show only part of the details and button 'More' for optionally showing the rest, or all details and button 'Less' for optionally hiding part of them.
type: how-to
page_title: Show more or less of the details in a Report group
slug: how-to-show-more-or-less-details-in-report-group
position: 
tags: 
ticketid: 1443872
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
The article describes an approach for showing only a limited number (e.g. 3) of the details and button 'More...' for optionally showing the rest of the details, or all details and button 'Less...' for optionally hiding part of them.

## Solution
Here are the major steps you may follow for each data field that should be displayed in the described way:

- Set the detail section __CanShrink__ to __True__
- Add a __TextBox__ for each data field and set its __Visible__ property with [Bindings](../expressions-bindings): 
	+ Set _Property path_ to 'Visible' 
	+ Set _Value_	to '= RowNumber()<=3' 
	
	This TextBox (_textBox3_ in the sample) will display the first 3 values that will always be visible. It will be hidden when the detail section is rendered with the rows after the third.

- Add a __Panel__ below the _TextBox_ and:
	+ Place another _TextBox_ inside (_textBox5_ in the sample) 
	+ Let the _TextBox_ occupy the entire _Panel_ 
	+ Set the _Panel_ __CanShrink__ to __True__ 
	+ Set the _Panel_ __Visible__ to __False__
	+ Set the _TextBox_ _Visible_ with _Bindings_ as above but with the opposite equation, i.e. '= RowNumber()>3' 
	
	This way the _Panel_ will be initially hidden. When displayed, the _Panel_ will collapse for the first three rows as the _TextBox_ inside it will be invisible. For the rows after the third the _Panel_ will be shown.
- Add two __TextBoxes__ in the __Group Footer__ - one with the text 'More..' and the other with the text 'Less..' or as required. Let the 'Less...' _TextBox_ be hidden initially. Add _Action_ __Toggle Visibility__ to both _TextBoxes_ - the _Action_ should control the above _Panel_ and the two _TextBoxes_ ('Less...' and 'More...'). With this setting, for example, the 'More...' _TextBox_ will display the _Panel_ and the 'Less...' _TextBox_ and will hide itself, whereas the 'Less...' _TextBox_ will do the opposite. 

A sample report demonstrating how to achieve the above can be found [here](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/showhidedetails.trdp?sfvrsn=80136260_2&download=true).
