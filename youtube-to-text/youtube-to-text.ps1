$youtubeLink = Get-Clipboard

$videoDownloadCommand = "./yt-dlp.exe --extract-audio --audio-format mp3 -o 'downloaded_audio.%(ext)s' $youtubeLink"
Invoke-Expression $videoDownloadCommand

$audioFile = "downloaded_audio.mp3"
$transcript = python transcribe.py $audioFile
Remove-Item $audioFile
$transcript | Set-Clipboard
$transcript