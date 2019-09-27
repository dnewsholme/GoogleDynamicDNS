FROM mcr.microsoft.com/powershell:preview
# Create app directory
WORKDIR /GoogleDynamicDNS
# Install app dependencies
COPY src/* ./
# Run Command
RUN Set-ExecutionPolicy -ExecutionPolicy Unrestricted
CMD [ "pwsh.exe","./GoogleDynamicDNS.ps1" ]
