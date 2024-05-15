# Push your current Cliboard to https://pwpush.com/ and copy the link to the password to your clipboard
$clipboardContent = Get-Clipboard

$body = @{
    "password[payload]" = $clipboardContent
    "password[expire_after_days]" = "2"
    "password[expire_after_views]" = "1"
    "password[retrieval_step]" = "true"
}

$response = Invoke-WebRequest -Uri 'https://pwpush.com/p.json' -Method POST -Body $body

$jsonResponse = $response.Content | ConvertFrom-Json

$token = $jsonResponse.url_token

$link = "https://pwpush.com/p/$token"

$link | Set-Clipboard

Write-Output $link
