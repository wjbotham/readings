$READING_NAME="Introductory Antimemetics"
#$READING_NAME="Unforgettable, That's What You Are"

$FFMPEG = "C:\Program Files\ffmpeg-4.2.3-win64-static\bin\ffmpeg.exe"
$READINGS_DIR = "C:\Users\Wesley\Desktop\Readings"
$VIDEO_DIR = "$READINGS_DIR\$READING_NAME"
$SOURCE_DIR = "$VIDEO_DIR\Source" 
$SOURCE_LIST = "$VIDEO_DIR\source_list.txt" 

$source_content = $null
foreach($line in Get-ChildItem $SOURCE_DIR -Filter *.mkv -Name)
{
       $source_content += "file '$SOURCE_DIR\$line'`n"
}
[IO.File]::WriteAllLines($SOURCE_LIST, $source_content)

& $FFMPEG -f concat -safe 0 -i $SOURCE_LIST -c copy "$VIDEO_DIR\output_$(Get-Date -Format `"yyyyMMddHHmmss`").mkv"

if (Test-Path $SOURCE_LIST) {
  Remove-Item –path $SOURCE_LIST
}
