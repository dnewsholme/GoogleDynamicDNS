FROM mcr.microsoft.com/powershell:preview
# Create app directory
WORKDIR /GoogleDynamicDNS
# Install app dependencies
COPY src/* ./
# Run Command
RUN pwsh -Command "Set-ExecutionPolicy -ExecutionPolicy Unrestricted"
CMD [ "pwsh","./GoogleDynamicDNS.ps1" ]
