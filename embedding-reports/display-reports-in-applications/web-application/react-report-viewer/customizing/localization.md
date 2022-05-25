---
title: Localization
page_title: Localization 
description: Localization
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/customizing/localization
tags: localization
published: True
position: 2
---

# Localization

The article elaborates on how to localize the messages displayed by the React Report Viewer.

1. To localize the report viewer, create a new TypeScript file __stringResources.ts__ :

   ````TypeScript
export class StringResources {
		static english = {
			loadingReport: 'Loading...',
			// override other string resources here
		}
		static japanese = {
			loadingReport: 'ちょっと、まってください...',
			// override other string resources here
		}
		// override string resources for other cultures here
}
````

   The file can contain all or only a part of the string resources which would be localized. For a full list of the report viewer string resources which could be localized, please refer to [HTML5 Report Viewer Localization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/localization%}).

2. Import the new file in the component where the viewer is used: 

   ````TypeScript
import { StringResources } from './stringResources';
````


3. Use the [useEffect hook](https://reactjs.org/docs/hooks-effect.html) to extend the viewer object with the string resources for the desired culture after the component has mounted: 

   ````TypeScript
export function ReportViewer() {
	  const viewerRef = useRef(null);
	  const [language, setLanguage] = useState(navigator.language);

	  useEffect(() => {
		if (viewerRef) {
		  const { viewerObject } = viewerRef.current;
		  switch (language) {
			case "ja":
			  viewerObject.stringResources = Object.assign(viewerObject.stringResources, StringResources.japanese);
			  break;
			default:
			  viewerObject.stringResources = Object.assign(viewerObject.stringResources, StringResources.english);
			  break;
		  }
		}
	  }, [language])

	  return (
		<TelerikReportViewer
		  ref = {viewerRef}
		  serviceUrl = "https://demos.telerik.com/reporting/api/reports/"
		  reportSource = {{
			report: 'Dashboard.trdx',
			parameters: {}
		  }}
		  viewerContainerStyle = {{
			position: 'absolute',
			left: '5px',
			right: '5px',
			top: '40px',
			bottom: '5px',
			overflow: 'hidden',
			clear: 'both',
			fontFamily: 'ms sans serif'
		  }}
		  viewMode = "INTERACTIVE"
		  scaleMode = "SPECIFIC"
		  scale = {1.0}
		  enableAccessibility = {false} />
	  )
}
````

