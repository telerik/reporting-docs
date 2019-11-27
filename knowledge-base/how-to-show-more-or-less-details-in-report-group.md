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
A sample report demonstrating how to achieve the above can be found [here](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/showhidedetails.trdp?sfvrsn=80136260_2&download=true). Here are the major steps you may follow for each data field that should be displayed in the described way:

- Set the detail section CanShrink to True
- Add a __TextBox__ for each data field and set its __Visible__ property with [Bindings](../expressions-bindings):
Set _Property path_ to 'Visible' and _Value_	to '= RowNumber()<=3'
This TextBox (_textBox3_ in the sample) will display the first 3 values that will always be visible. It will be hidden when the detail section is rendered with the rows after the third.

- Add a __Panel__ below the TextBox and place another TextBox inside (_textBox5_ in the sample). Let the TextBox occupy the entire Panel. Set the Panel __CanShrink__ to __True__ and __Visible__ to __False__. Set the TextBox _Visible_ with _Bindings_ as above but with the opposite equation, i.e. '= RowNumber()>3'. This way the Panel will be initially hidden. When displayed, the Panel will collapse for the first three rows as the TextBox inside it will be invisible. For the rows after the third the Panel will be shown.
- Add two __TextBoxes__ in the group footer - one with the text 'More..' and the other with the text 'Less..' or as required. Let the 'Less...' TextBox be hidden initially. Add _Action_ __Toggle Visibility__ to both TextBoxes - the Action should control the above Panel and the two TextBoxes ('Less...' and 'More...'). With this setting, for example, the 'More...' TextBox will display the Panel and the 'Less...' TextBox and will hide itself, whereas the 'Less...' TextBox will do the opposite.
