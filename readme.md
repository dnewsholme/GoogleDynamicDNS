# Google Dynamic DNS Updater

![GoogleDomains](https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2015/01/google-domains-730x349.png)

## How to use

NOTE: **Requires Powershell Core 6.0 or later**

Edit Config with your dynamic dns username and password as well as the domain.
Run as a scheduled task or via Cron.

### Run with docker

```bash
sudo docker pull dnewsholme/googledynamicdns:latest
sudo docker run -e GDNS_USERNAME="jhksoo" -e GDNS_PASSWORD="sokoks" -e GDNS_DOMAINRECORD="dev.website.com" -e GDNS_FREQUENCY="300" dnewsholme/googledynamicdns
```

Environment Variables

| Name              | Setting                     | Example         |
|-------------------|-----------------------------|-----------------|
| GDNS_USERNAME     | username                    | jhksoo          |
| GDNS_PASSWORD     | password                    | sokoks          |
| GDNS_DOMAINRECORD | Domain Name                 | dev.website.com |
| GDNS_FREQUENCY    | Update Frequency in seconds | 300             |

#### Docker Compose

```docker
---
version: "2"
services:
  sonarr:
    image: dnewsholme/googledynamicdns
    container_name: googledynamicdns
    environment:
      - GDNS_USERNAME= jhksoo
      - GDNS_PASSWORD= sokoks
      - GDNS_DOMAINRECORD= dev.website.com
      - GDNS_FREQUENCY=300
    restart: unless-stopped
```

## What it does

The script gets your current external IP address from domains.google.com/checkip and sets it on the DNS record you specify.
