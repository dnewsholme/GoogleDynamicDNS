FROM mcr.microsoft.com/powershell:preview
# Create app directory
WORKDIR /GoogleDynamicDNS
# Install app dependencies
COPY src/* ./
# Run Command
RUN pwsh `
        -NoLogo `
        -NoProfile `
        -Command " `
          Set-ExecutionPolicy unrestricted -Force"
CMD [ "pwsh.exe","./GoogleDynamicDNS.ps1" ]
