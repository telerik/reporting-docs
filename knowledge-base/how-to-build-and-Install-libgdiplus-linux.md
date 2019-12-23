---
title: How to Build and Install Latest libgdiplus library on Linux
description: Step by step installation description of libgdiplus on Linux
type: how-to
page_title: How to build and install latest libgdiplus library on Linux
slug: how-to-build-and-Install-libgdiplus-linux
position: 
tags: 
ticketid: 1433335
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.0.19.116</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
Step by step article how to build and install libgdiplus from source and prebuilt .deb package

## Solution
**Prerequisites:**

We are assuming that you already have older libgdiplus which installed its dependencies. More information and build and install instructions can be found here: https://github.com/mono/libgdiplus

```
sudo apt install libgdiplus
```


**Easier method:**

https://www.mono-project.com/download/stable/#download-lin

```
sudo apt install gnupg ca-certificates

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF

echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list

sudo apt update

sudo apt install libgdiplus
```


**Harder method:**

On Debian based distributions install prerequisites by running this command: 
```
sudo apt-get install libgif-dev autoconf libtool automake build-essential gettext libglib2.0-dev libcairo2-dev libtiff-dev libexif-dev
```

Clone or download and unarchive libgdi repository: 

```
git clone https://github.com/mono/libgdiplus.git
cd libgdiplus
```

Run build script (Optionally you can use --with-pango parameter if you want to use this library: 

```
./autogen.sh
make 
```

Then run unit tests to verify of all is correct: 

```
make check
```

If everything is fine, install by running: 

```
make install 
```

or  

```
sudo make install 
```
If the first one fails because of missing rights. 
