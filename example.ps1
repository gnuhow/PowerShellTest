function example {
    param(
        [string] $name,
        [int] $age,
        [bool] $isAlive
    )

    Import-Module ActiveDirectory
    . .\import.ps1

    Write-Host -ForegroundColor Yellow "Global var: `"$GLOBAL_VAR`""
    Write-Host -ForegroundColor Green "User Name: $name" 
    Write-Output "file data" | Out-File -FilePath test.txt
    Write-Output "more data" | Add-content -Path test.txt

    New-Item -Path "newFolder"
}

example -name "charlie" -age 33 -isAlive 1
