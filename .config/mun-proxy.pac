// vim: set syntax=javascript:

function FindProxyForURL(url, host)
{
  if (dnsDomainIs(host, ".aits.mun.ca"))
  {
    return "SOCKS localhost:1080";
  }
  else if (dnsDomainIs(host, ".ban.mun.ca"))
  {
    return "SOCKS localhost:1080";
  }
  else if (dnsDomainIs(host, ".fas.mun.ca"))
  {
    return "SOCKS localhost:1080";
  }
  else if (dnsDomainIs(host, ".wds.mun.ca"))
  {
    return "SOCKS localhost:1080";
  }
  else
  {
    return "DIRECT";
  }
}
