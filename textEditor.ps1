# Edit selected text in a large file
$filename = "loremIpsum.txt"
$originalText = "Donec eget viverra arcu."
$resultFilename = "loremResult.txt"
$replacementText = "This is all Greek to me!"

$match = Select-String -Path $filename -Pattern $originalText -CaseSensitive
$lineNumber = $match.LineNumber

$resultLine = $match.line -replace $originalText, $replacementText
Write-Host "result: $resultLine"

# Add text before to the result file
Get-Content 

$lineCount = (Get-Content $filename | Measure-Object -Line).Lines
Write-Host "linecount $lineCount"

