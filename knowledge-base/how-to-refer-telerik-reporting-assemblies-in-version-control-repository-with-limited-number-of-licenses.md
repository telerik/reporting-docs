---
title: How to Refer Telerik Reporting Assemblies in Projects Hosted in Version Control Repository when only One/Few Developers Hold Licenses
description: Solution won't compile to other developers in the team that are not licensed for Telerik Reporting
type: how-to
page_title: How to Refer Telerik Reporting Assemblies in Version Control Repository with Limited Number of Licenses
slug: how-to-refer-telerik-reporting-assemblies-in-version-control-repository-with-limited-number-of-licenses
position: 
tags: 
ticketid: 1425070
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
Frequently, in a team, only one or few of the developers are working with and are licensed for Telerik Reporting. The other developers that are working on other parts of the project still need access to Telerik Reporting assemblies to be able to compile the project.

## Solution
 1\. If you need to refer Telerik Reporting assemblies from a NuGet package, you may :
  - Share the credentials for the Telerik NuGet private feed with the other team members.  
  - Download the NuGet packages locally and refer them from a local feed accessible by team members.  



 2\. If you can use local references, you may create a folder where to upload the Telerik Reporting assemblies and refer them in the project from this folder. 
