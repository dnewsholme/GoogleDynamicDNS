FROM mcr.microsoft.com/powershell:preview
# Create app directory
WORKDIR /GoogleDynamicDNS
# Install app dependencies
COPY src ./
# Run Command
CMD [ "pwsh","./GoogleDynamicDNS.ps1" ]
