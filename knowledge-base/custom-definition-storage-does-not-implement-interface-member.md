---
title: 'CustomDefinitionStorage' does not implement interface member 'IAssetsStorage.CreateFolderAsync(CreateFolderModel)'
description: The 'CustomDefinitionStorage' does not implement interface member 'IAssetsStorage.CreateFolderAsync(CreateFolderModel)' is thrown after upgrade to R2 2022
type: troubleshooting
page_title: 'CustomDefinitionStorage' does not implement interface member 'IAssetsStorage.CreateFolderAsync(CreateFolderModel)'
slug: custom-definition-storage-does-not-implement-interface-member
position: 
tags: webreportdesigner
ticketid: 1564724
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>16.1.22.511+</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>HTML5 ASP.NET MVC</td>
		</tr>
	</tbody>
</table>


## Description
'CustomDefinitionStorage' does not implement interface member 'IAssetsStorage.CreateFolderAsync(CreateFolderModel)' is thrown after upgrade to R2 2022

## Error Message
'CustomDefinitionStorage' does not implement interface member 'IAssetsStorage.CreateFolderAsync(CreateFolderModel)'
'CustomDefinitionStorage' does not implement interface member 'IAssetsStorage.DeleteAsync(string)'
...


## Cause\Possible Cause(s)
We improved the ...

## Solution
Implement the new interface methods:
````C#

public Task<ResourceFolderModel> CreateFolderAsync(CreateFolderModel model)
{
    throw new System.NotImplementedException();
}

public Task DeleteAsync(string uri)
{
    throw new System.NotImplementedException();
}

public Task DeleteFolderAsync(string uri)
{
    throw new System.NotImplementedException();
}

public Task<byte[]> GetAsync(string resourceName)
{
    throw new System.NotImplementedException();
}

public Task<ResourceFolderModel> GetFolderAsync(string uri)
{
    throw new System.NotImplementedException();
}

public Task<IEnumerable<ResourceModelBase>> GetFolderContentsAsync(string uri)
{
    throw new System.NotImplementedException();
}

public Task<ResourceFileModel> GetModelAsync(string uri)
{
    throw new System.NotImplementedException();
}

public Task<ResourceFileModel> RenameAsync(RenameResourceModel model)
{
    throw new System.NotImplementedException();
}

public Task<ResourceFolderModel> RenameFolderAsync(RenameFolderModel model)
{
    throw new System.NotImplementedException();
}

public Task<ResourceFileModel> SaveAsync(SaveResourceModel model, byte[] resource)
{
    throw new System.NotImplementedException();
}

````

## See Also
https://docs.telerik.com/reporting/designing-reports/report-designer-tools/web-report-designer/how-to-implement-a-report-definition-storage
