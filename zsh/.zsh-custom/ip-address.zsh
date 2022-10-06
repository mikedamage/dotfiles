function public-ip() {
  curl -s https://jsonip.com/ | jq -r .ip
}

function isp() {
  whois $(public-ip) | grep Organization
}
