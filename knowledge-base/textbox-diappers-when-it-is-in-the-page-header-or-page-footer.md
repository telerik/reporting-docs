---
title: TextBox Disappears 
description: If the textbox is located at the corner of the Page Header or Page Footer it might disappear
type: troubleshooting
page_title: TextBox disappears when it is in the Page Header or Page Footer
slug: textbox-diappers-when-it-is-in-the-page-header-or-page-footer
position: 
tags: 
ticketid: 1399136
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


## Steps to Reproduce
If the **TextBox** is located at some of the corners of the Page Header or Page Footer, it will disappear or its content will be cut when its **KeepTogether** property is set to  *False*.

## Solution
Set the **KeepTogether** property of the **Textbox** to **True**.
