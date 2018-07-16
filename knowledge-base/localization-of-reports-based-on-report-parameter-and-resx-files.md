---
title: Localization of reports based on report parameter and RESX files
description: Localize reports based on report parameter with the desired culture and custom created resource files
type: how-to
page_title: Localization of reports based on report parameter and RESX files
slug: localization-of-reports-based-on-report-parameter-and-resx-files
position: 
tags: Localization, ReportParameters, Expressions
ticketid: 1173951
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>12.1 18.516</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>MVC</td>
	</tr>
	<tr>
		<td>Viewer</td>
		<td>HTML5 MVC Viewer</td>
	</tr>
	<tr>
		<td>Visual Studio version</td>
		<td>Visual Studio 2017</td>
	</tr>
	<tr>
		<td>Preferred Language</td>
		<td>C Sharp</td>
	</tr>
</table>


## Description
The following article explains how to create localizable reports according to report parameter containing the name of the culture for the specified localization resource. For example, to provide a localization resource for the German *(de-De)* culture, the corresponding resource file could be named: *Resources.de-DE.resx*.

## Solution
Such application could be easily created following these steps:
- Create new ReportLibrary project that would contain the report and it's corresponding resource files.
- Configure new DataSource (for this example we are using CSVDataSourceWizard) which should contain two properties - **Language** (the names of languages) and **Culture** (their culture strings).
- Create two new report parameters for the report. The first will be for the Language, so map the csvDataSource as **AvaliableValues** of the parameter. Let **DisplayMemeber** be *= Fields.Language* and **ValueMember** - *= Fields.Culture*. Finally, set it's **Visibility** to *True*. The second report parameter will give information about the base path
the resources are searched at (check the report viewer's initialization file - *Index.cshtml*, that demonstrates how to get current base path for web applications).
- Create Resource files with localized strings for each language according to report items values.
- Create new user function that will get the localized value of the report item, based on the chosen parameter value. For example:
``` CSharp
       public static string GetLocalizedText(string name, string cultureName, string basePath)
        {
            Dictionary<string, string> language;
            if (languages.TryGetValue(cultureName, out language))
            {
                return language[name];
            }

            var filePath = new Uri(new Uri(basePath), string.Format("bin\\Resources.{0}resx", cultureName)).AbsolutePath;

            filePath = Uri.UnescapeDataString(filePath);

            var reader = new ResXResourceReader(filePath);

            language = new Dictionary<string, string>();
            foreach (DictionaryEntry k in reader)
            {
                language.Add((string)k.Key, k.Value + string.Empty);
            }

            languages.GetOrAdd(cultureName, language);

            return language[name];
        }
```
- The function is then used in expression to visualize text in the report.

## See Also
You can download the sample MVC application illustrating the behavior from [here](https://www.telerik.com/docs/default-source/knowledgebasearticleattachments/reporting/localizationwithresxfilesbasedonreportparameter.zip?sfvrsn=201d2106_2).
