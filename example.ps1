Import-Module PSReadLine

# import a powershell script into the environment
. .\import.ps1

$filename = "test.txt"
$folderName = "newFolder"
$jsonFilename = "example.json"
$loremString = "Lorem ipsum dolor sit amet, consectetur adipiscing elit."

# example function
function example {
    param(
        [string] $name,
        [int] $age,
        [bool] $isAlive
    )

    Write-Host -ForegroundColor Green "User Name: $name" 
}
example -name "charlie" -age 33 -isAlive $true


# Write host, pring objects to the screen
Write-Host -ForegroundColor Yellow "Global var: `"$GLOBAL_VAR`""

#  Write-output objects to a pipeline
Write-Output "file data" | Out-File -FilePath $filename
Write-Output "more data" | Add-content -Path $filename

# make a new folder
New-Item -Path $folderName -ItemType Directory

# ls the new folder
Get-ChildItem $folderName

# load Json into an object
$exampleHashTable = Get-Content -Raw "$jsonFilename" | ConvertFrom-Json 

# view the contents of an object
Select-Object -InputObject $exampleHashTable -Property *
Out-String -InputObject $exampleHashTable

# get values from an hashtable
$item2 = Select-Object -InputObject $exampleHashTable -Property "object" -ExpandProperty "object" | Select-Object -Property "item2" | select-object -Property *
Write-Host "Selected item2: $item2"

# object dot notation
$value = $exampleHashTable.object.item2
Write-Host "Dot notation item2: $value"

# PSItem to reference the current pipeline object
Get-Process | Where-Object {$PSItem.ProcessName -imatch "winlogon"}

# do text parsing
Select-String -Path loremIpsum.txt -Pattern '.*maximus.*' -CaseSensitive

# String arrays
$loremCharArray = $loremString.ToCharArray()
Write-Host "first char $($loremCharArray[0])"          # l
Write-Host "first word $($loremCharArray[0..4])"  # lorem
Write-Host "last char $($loremCharArray[-1])"          # last character "."
$loremCharArray[6] = "+"

# String array looping and manipulation
$resultCharArray = $loremCharArray
$position = 0
foreach ($character in $loremCharArray) {
    if ($character -ceq "l") {                              # case sensitive equals
        Write-Host "position: $position, character: $character"
        $resultCharArray[$position] = "w"
    } elseif ($character -ceq "L") {
        $resultCharArray[$position] = "W"
    }
    $position++
}
$resultString = $resultCharArray -join ''                  # join the array back into a string
Write-Host "result: $resultString"

# cleanup
Remove-Item $filename
Remove-Item $folderName
