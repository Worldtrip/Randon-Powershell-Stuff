﻿$uri = "bbis.nps.gse.gov.uk"
$PSEmailServer = "smtphub.suffolkcc.gov.uk"
$body = "https://bbis.nps.gse.gov.uk/ Not working!!!"

$testdate = Get-Date ;

try {
        $Addresses = [System.Net.Dns]::GetHostAddresses("$uri").IPAddressToString
    }
    catch { 
        $Addresses = "Server IP cannot resolve."
    }

try {
    $webresult = Measure-Command { $request = Invoke-WebRequest -Uri $uri -Proxy http://proxy.eadidom.com:8080 -ProxyUseDefaultCredentials }
    }
    catch {
        $webresult = "Unable to download webpage - New Proxy1"
        Send-MailMessage -To "andrew.brooke@suffolk.gov.uk" -From "andrew.brooke@suffolk.gov.uk" -Subject "Blue Badge Site not Working!  FwdProxy1" -Body $body
        }