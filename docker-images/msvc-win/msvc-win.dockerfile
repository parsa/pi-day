# escape=`

# Copyright (C) Microsoft Corporation. All rights reserved.
# Licensed under the MIT license. See LICENSE.txt in the project root for license information.

ARG FROM_IMAGE=sdk
FROM microsoft/dotnet-framework:${FROM_IMAGE}

# Reset the shell.
SHELL ["cmd", "/S", "/C"]

# Set up environment to collect install errors.
COPY Install.cmd C:\TEMP\
ADD https://aka.ms/vscollect.exe C:\TEMP\collect.exe

# Install Node.js LTS
ADD https://nodejs.org/dist/v8.11.3/node-v8.11.3-x64.msi C:\TEMP\node-install.msi
RUN start /wait msiexec.exe /i C:\TEMP\node-install.msi /l*vx "%TEMP%\MSI-node-install.log" /qn ADDLOCAL=ALL

# Download channel for fixed install.
ARG CHANNEL_URL=https://aka.ms/vs/15/release/channel
ADD ${CHANNEL_URL} C:\TEMP\VisualStudio.chman

# Download and install Build Tools for Visual Studio 2017 for native desktop workload.
ADD https://aka.ms/vs/15/release/vs_buildtools.exe C:\TEMP\vs_buildtools.exe
RUN C:\TEMP\Install.cmd C:\TEMP\vs_buildtools.exe --quiet --wait --norestart --nocache `
    --channelUri C:\TEMP\VisualStudio.chman `
    --installChannelUri C:\TEMP\VisualStudio.chman `
    --add Microsoft.VisualStudio.Workload.VCTools --includeRecommended`
    --installPath C:\BuildTools

# Use developer command prompt and start PowerShell if no other command specified.
ENTRYPOINT C:\BuildTools\Common7\Tools\VsDevCmd.bat &&
CMD ["powershell.exe", "-NoLogo", "-ExecutionPolicy", "Bypass"]

ADD https://github.com/git-for-windows/git/releases/download/v2.20.1.windows.1/Git-2.20.1-64-bit.exe C:\TEMP\Git.exe
COPY git-setup-opts.inf C:\TEMP\git-setup-opts.inf
RUN C:\TEMP\Git.exe /SP- /VERYSILENT /SUPPRESSMSGBOXES /FORCECLOSEAPPLICATIONS /LOADINF=C:\TEMP\git-setup-opts.inf /LOG=C:\TEMP\git-setup.log

RUN git clone --depth=1 https://github.com/Microsoft/vcpkg.git C:\vcpkg `
    && C:\vcpkg\bootstrap-vcpkg.bat `
    && C:\vcpkg\vcpkg.exe --vcpkg-root C:\vcpkg --triplet x64-windows install boost-multiprecision mpfr `
    && C:\vcpkg\vcpkg.exe --vcpkg-root C:\vcpkg --triplet x64-windows export boost-multiprecision mpfr --raw --output=vcpkg-export `
    && move C:\vcpkg\vcpkg-export C:\vcpkg-export `
    && rd /s /q C:\vcpkg `
    && move C:\vcpkg-export C:\vcpkg