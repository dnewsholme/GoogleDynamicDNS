# Google Dynamic DNS Updater

![GoogleDomains](https://cdn0.tnwcdn.com/wp-content/blogs.dir/1/files/2015/01/google-domains-730x349.png)

## How to use

NOTE: **Requires Powershell Core 6.0 or later**

Edit Config with your dynamic dns username and password as well as the domain.
Run as a scheduled task or via Cron.

### Run with docker

```bash
sudo docker pull dnewsholme/googledynamicdns:latest
```

Environment Variables

| Name             | Setting                     | Example         |
|------------------|-----------------------------|-----------------|
| GDNS_USERNAME    | username                    | jhksoo          |
| GNS_PASSWORD     | password                    | sokoks          |
| GNS_DOMAINRECORD | Domain Name                 | dev.webiste.com |
| GNS_FREQUENCY    | Update Frequency in seconds | 300             |

## What it does

The script gets your current external IP address from domains.google.com/checkip and sets it on the DNS record you specify.
