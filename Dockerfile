FROM mcr.microsoft.com/powershell:preview
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
COPY src/* ./
# Run Command
CMD [ "powershell-preview", "GoogleDynamicDNS.ps1" ]
