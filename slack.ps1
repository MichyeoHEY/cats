$catfact = (Invoke-RestMethod -URI https://cat-fact.herokuapp.com/facts/random).text

$payload = @{
    "channel" = "#cat-facts"
    "icon_emoji" = ":nyancat:"
    "text" = "$catfact"
    "username" = "Cat fact of the day"
}

Invoke-WebRequest `
    -Body (ConvertTo-Json -Compress -InputObject $payload) `
    -Method Post `
    -Uri "https://hooks.slack.com/services/(YOURWEBHOOK)" | Out-Null
