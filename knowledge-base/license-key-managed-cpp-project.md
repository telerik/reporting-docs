---
title: Adding Telerik Reporting License Key in a Managed C++/CLI Project
page_title: How to Set Up the License Key in a Managed C++ Project
description: "Learn how to add the Telerik Reporting license key in a managed C++/CLI (.vcxproj) project where the standard licensing mechanism does not work."
slug: license-key-managed-cpp-project
tags: licensing, license, key, cpp, cli, managed, vcxproj, c++
published: True
type: troubleshooting
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
        <tr>
			<td>Version</td>
			<td>19.0.25.211+</td>
		</tr>
	</tbody>
</table>

## Description

I use Telerik Reporting in a managed C++/CLI project. My project contains `.cpp` and `.h` files and a `.vcxproj` project file instead of a `.csproj`. The [standard license key setup]({%slug license-key%}) does not activate the product, and I see license-related warnings and watermarks.

How do I add the Telerik Reporting license key in a managed C++/CLI project?

## Solution

To activate Telerik Reporting in a managed C++/CLI project, add the license key as an assembly-level attribute in a `.cpp` file and reference the licensing assembly manually.

### Step 1: Obtain the License Key

1. Go to the [License Keys](https://www.telerik.com/account/your-licenses/license-keys) page in your Telerik account.
1. Click **View Script Keys**.
1. From the dropdown, select **Progress® Telerik® Reporting**.
1. The dialog displays code snippets in C# and VB.NET. Copy only the raw key string (the `"eyJhbGciOiJSUzI1..."` value).

### Step 2: Reference the Licensing Assembly

Make sure your project references `Telerik.Licensing.Runtime.dll`.

### Step 3: Add the License Key File

Create a new file named `TelerikLicense.cpp` in your project with the following content:

```CPP
using namespace Telerik::Licensing;

[assembly:EvidenceAttribute("YOUR_LICENSE_KEY_HERE")];
```

Replace `YOUR_LICENSE_KEY_HERE` with the raw key string obtained in [Step 1](#step-1-obtain-the-license-key).

### Step 4: Include the File in the Project

Open your `.vcxproj` file and add the following line inside an `<ItemGroup>` that contains other `<ClCompile>` entries:

```XML
<ClCompile Include="TelerikLicense.cpp" />
```

### Step 5: Build and Verify

Rebuild the project. The license warnings and watermarks should no longer appear.

> important Do not publish the license key in publicly accessible repositories. The key is personal and tied to your Telerik account.

## See Also

* [Setting Up Your Telerik Reporting License Key]({%slug license-key%})
* [License Errors and Warnings]({%slug license-errors-and-warnings%})
