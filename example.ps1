function example {
    param(
        [string] $name,
        [int] $age,
        [bool] $isAlive
    )

    Import-Module ActiveDirectory
    . .\import.ps1

    $fileName = "test.txt"
    $folderName = "newFolder"

    Write-Host -ForegroundColor Yellow "Global var: `"$GLOBAL_VAR`""
    Write-Host -ForegroundColor Green "User Name: $name" 
    Write-Output "file data" | Out-File -FilePath $fileName
    Write-Output "more data" | Add-content -Path $fileName

    New-Item -Path $folderName
    Get-ChildItem $folderName

    Remove-Item $fileName
    Remove-Item $folderName
}

example -name "charlie" -age 33 -isAlive 1

