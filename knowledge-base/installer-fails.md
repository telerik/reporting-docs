---
title: Telerik Reporting Installer Fails
page_title: Troubleshooting Telerik Reporting Installer Failures
description: "Learn what could be causing and how to troubleshoot problems related to Telerik Reporting installation failures."
slug: installer-fails
previous_url: troubleshooting/installation
tags: telerik, reporting, troubleshoot, installer, fails
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
			<td>Q2 2012 and later</td>
		</tr>
	</tbody>
</table>

## Description

The installer fails and I am not able to install Telerik Reporting. How can I fix this issue?

## Cause

The possible reason for this issue is a rights elevation problem that may have occurred.

## Solution

Run the installer as administrator or from an admin account and generate an installer log to identify the reason for the existing issue:

1. Open a command prompt window by clicking __Start__. In the prompt, type `cmd`. Click `Enter`.
1. Navigate to the folder in which the Telerik Reporting installer is located.
1. Run the `msiexec /i Telerik_Reporting.msi -l*xv install.log` command where `install.log` stands for and has to be replaced with the directory path and filename where you want to save the log.  Click `Enter`.
1. After you generate the file, archive it and attach it to a support ticket with more information on the issue.
