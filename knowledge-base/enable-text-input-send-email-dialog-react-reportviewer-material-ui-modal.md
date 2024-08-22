---
title: Enabling Text Input in Send Email Dialog with React Report Viewer in a Material UI Modal
description: "Learn how to resolve the inability to edit fields in the Send Email dialog of React Report Viewer when used inside a Material UI Modal."
type: troubleshooting
page_title: How to Make Text Fields Editable in Send Email Dialog of React Report Viewer in Material UI Modal
slug: enable-text-input-send-email-dialog-react-reportviewer-material-ui-modal
tags: progress® telerik® reporting, reportviewer, react, modal, material ui
res_type: kb
ticketid: 1662132
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>React Report Viewer </td>
		</tr>
	</tbody>
</table>

## Description
When using the [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%}) in a React application with the [Material UI Modal component](https://mui.com/material-ui/react-modal/), the text fields in the "Send Email" dialog become uneditable, although dropdowns can still be modified. 

## Cause

This issue occurs because the Material UI Modal enforces focus on itself, preventing any interactions with the "Send Email" dialog.

## Solution

To resolve this issue, set the `disableEnforceFocus` property of the Material UI Modal to `true`. This action allows focus to be moved to the "Send Email" dialog, enabling text input in its fields:

````JavaScript
import * as React from 'react';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Modal from '@mui/material/Modal';
import { TelerikReportViewer } from '@progress/telerik-react-report-viewer';

const style = {
  position: 'absolute',
  top: '50%',
  left: '50%',
  transform: 'translate(-50%, -50%)',
  width: 1000,
  border: '2px solid #000',
  boxShadow: 24,
  p: 4,
};

export default function BasicModal() {
  const [open, setOpen] = React.useState(false);
  const handleOpen = () => setOpen(true);
  const handleClose = () => setOpen(false);

  return (
    <div>
      <Button onClick={handleOpen}>Open modal</Button>
      <Modal
        open={open}
        disableAutoFocus={true}
        disableEnforceFocus={true}
        onClose={handleClose}
        aria-labelledby="modal-modal-title"
        aria-describedby="modal-modal-description"
      >
        <Box sx={style}>
          <TelerikReportViewer
            serviceUrl="https://demos.telerik.com/reporting/api/reports/"
            reportSource={{
                report: 'Dashboard.trdx',
                parameters: {}
            }}
            viewerContainerStyle={{
                width: '100%',
                height: '600px'
            }}
            viewMode="INTERACTIVE"
            scaleMode="SPECIFIC"
            scale={1.0}
            enableAccessibility={false}
            sendEmail={{ enabled: true }}
          />
        </Box>
      </Modal>
    </div>
  );
}
````

By setting `disableEnforceFocus={true}`, the focus is no longer strictly enforced within the Material UI Modal, allowing for interaction with the "Send Email" dialog fields.

## See Also

* [Material UI Modal API](https://mui.com/material-ui/api/modal/)
