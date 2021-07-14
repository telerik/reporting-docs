---
title: Report designer is not available after upgrading Telerik Reporting
description: Report designer is not available after upgrading Telerik Reporting.
type: how-to
page_title: Report designer is not available after upgrading Telerik Reporting
slug: report-designer-is-not-available-after-upgrading-telerik-reporting
res_type: kb
---  
   
## Problem
After upgrading Telerik Reporting and opening an existing report (created with the previous version) in VS design mode, the following errors occur:
 
**Unable to load one or more of the requested types** or **Telerik.Reporting.Drawing.Unit cannot be converted to type Telerik.Reporting.Drawing.Unit**  
   
 ## Description  
 A possible reason for this problem is that your project uses "*stale*" assemblies from the previous Telerik Reporting version, which do not match the new DLL versions. In other words, the assemblies from the older missing version are still in your project's ***bin*** folder, and these assemblies do not comply with the new ones, leading to the error above.   
   
 ## Soluton
 
 1. Go through the [Upgrade Wizard](../ui-upgrade-wizard);
 2. Delete the project's "***bin***" and "***obj***" folders as described below:
    - Backup your project.
    - Close all reports in the project.
    - Close Visual Studio.
    - Physically delete the "***bin***" and "***obj***" directories for this project.  
 > Note 
 > <br>
 > Unless you have manually put any new files in these folders, the correct contents of these directories will be recreated automatically.
 3. Open Visual Studio.
 4. Add References to the new assemblies.
 5. Rebuild the solution.
 6. Delete the .resx file for the reports throwing the error, rebuild the project and open the report designer again.
