---
title: CustomDefinitionStorage Does Not Implement Interface Member
description: "Learn whe The CustomDefinitionStorage does not implement interface member IAssetsStorage.CreateFolderAsync(CreateFolderModel) exception is thrown after upgrade to R2 2022."
type: troubleshooting
page_title: CustomDefinitionStorage does not implement IAssetsStorage.CreateFolderAsync(CreateFolderModel)
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
			<td>Report Designer</td>
			<td>Web Report Designer</td>
		</tr>
	</tbody>
</table>


## Description

Errors like `'CustomDefinitionStorage' does not implement interface member 'IAssetsStorage.CreateFolderAsync(CreateFolderModel)'` are thrown after upgrade to R2 2022.

## Error Message

````
'CustomDefinitionStorage' does not implement interface member 'IAssetsStorage.CreateFolderAsync(CreateFolderModel)'
'CustomDefinitionStorage' does not implement interface member 'IAssetsStorage.DeleteAsync(string)'
...
````

## Cause\Possible Cause(s)

In [R2 2022](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2022-16-1-22-511), we improved the implementation of the `IDefinitionStorage` interface. Now the methods are asynchronous and you will need to replace
the existing ones.

## Solution

Implement the new interface methods:

````C#
public Task<ResourceFolderModel> CreateFolderAsync(CreateFolderModel model)
{
	// Creates a folder using the provided model.
	throw new NotImplementedException();
}

public Task<ResourceFolderModel> GetFolderAsync(string uri)
{
	// Retrieves the existing folder model by the provided URI.
	throw new NotImplementedException();
}

public Task DeleteFolderAsync(string uri)
{
	// Deletes a folder by the provided URI.
	throw new NotImplementedException();
}

public Task<IEnumerable<ResourceModelBase>> GetFolderContentsAsync(string uri)
{
	// Gets all resources contained in the given URI.
	throw new NotImplementedException();
}

public Task<ResourceFolderModel> RenameFolderAsync(RenameFolderModel model)
{
	// Renames a folder located at model.OldUri.
	throw new NotImplementedException();
}

public Task<byte[]> GetAsync(string resourceName)
{
	// Finds a resource by its name and returns its contents as byte array.
	throw new NotImplementedException();
}

public Task DeleteAsync(string uri)
{
	// Deletes the given resource
	throw new NotImplementedException();
}

public Task<ResourceFileModel> GetModelAsync(string uri)
{
	// Returns the resource model at provider URI or null if not found.
	throw new NotImplementedException();
}

public Task<ResourceFileModel> RenameAsync(RenameResourceModel model)
{
	// Renames the given resource
	throw new NotImplementedException();
}

public Task<ResourceFileModel> SaveAsync(SaveResourceModel model, byte[] resource)
{
	// Saves the raw data of a resource and returns its model.
	throw new NotImplementedException();
}
````

## See Also

[How to implement a report definition storage]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-implement-a-report-definition-storage%}).
