$RED = [ConsoleColor]::Red
$GREEN = [ConsoleColor]::Green
$BLUE = [ConsoleColor]::Blue
$ENDCOLOR = [ConsoleColor]::White


Write-Host "   _____ _ _        _____           __ _        _           _        _ _"           
Write-Host "  / ____(_) |      |  __ \         / _(_)      (_)         | |      | | |"          
Write-Host " | |  __ _| |_ ____| |__) | __ ___| |_ ___  __  _ _ __  ___| |_ __ _| | | ___ _ __" 
Write-Host " | | |_ | | __|____|  ___/ '__/ _ \  _| \ \/ / | | '_ \/ __| __/ _` | | |/ _ \ '__|"
Write-Host " | |__| | | |_     | |   | | |  __/ | | |>  <  | | | | \__ \ || (_| | | |  __/ |"
Write-Host "  \_____|_|\__|    |_|   |_|  \___|_| |_/_/\_\ |_|_| |_|___/\__\__,_|_|_|\___|_|      /v1.0.0/"   
                                                                                     
                                                                                     

$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-not $isAdmin) {
    Write-Host ""
    Write-Host "----> Is user administrator: " -NoNewline
    Write-Host "no" -ForegroundColor Red
    Write-Host "Please run this script as an administrator." -ForegroundColor Red
    exit
} else {
    Write-Host ""
    Write-Host "----> Is user administrator: " -NoNewline
    Write-Host "yes" -ForegroundColor Green
}

$sourceFilePath = Join-Path -Path $PSScriptRoot -ChildPath "git-prefix"
$destinationPath = "C:\Program Files\Git\mingw64\libexec\git-core\git-prefix"

Copy-Item -Path $sourceFilePath -Destination $destinationPath -Force

Write-Host ""
Write-Host "----> Custom file 'git-prefix' installed successfully to: $destinationPath"
Write-Host ""
