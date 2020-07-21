// vim: set syntax=javascript:

function FindProxyForURL(url, host)
{
  if (shExpMatch(url, "*.aits.mun.ca/*"))
  {
    return "SOCKS localhost:1080";
  }
  else if (shExpMatch(url, "*.ban.mun.ca/*"))
  {
    return "SOCKS localhost:1080";
  }
  else if (shExpMatch(url, "*.fas.mun.ca/*"))
  {
    return "SOCKS localhost:1080";
  }
  else if (shExpMatch(url, "*.wds.mun.ca/*"))
  {
    return "SOCKS localhost:1080";
  }
  else
  {
    return "DIRECT";
  }
}
