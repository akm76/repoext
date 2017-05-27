#
# functions to create:
# Configure-Paths() - set /src directory (or read from config file)
# Locate-Git() - check that git (or other required source control is available
# Locate-Svn()
# Locate-Hg()
# Clone-ProjectSource() - read package name and clone package repo to /src
# Update-ProjectSource() - perform repo sync
# Build-Project() - may require CMake or other?
# Locate-CMake()



Function Get-DirName()
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $FolderBrowserDialog = New-Object System.Windows.Forms.FolderBrowserDialog
    $FolderBrowserDialog.RootFolder = "MyDocuments"
    $FolderBrowserDialog.Description = "Select Local Repository Destination"
    $FolderBrowserDialog.ShowDialog() | Out-Null
    $FolderBrowserDialog.SelectedPath
}

function Configure-Paths()
{
    $myConfig=Join-Path $env:USERPROFILE "\.repoext.cfg"
    if (Test-Path $myConfig) {
        $config=Get-Content $myConfig | ConvertFrom-Json
    }
    else {
        $srcPath=Get-DirName
        $config=[PSCustomObject]@{"SRC"=$srcPath;"CONFIG"=$myConfig}
        ConvertTo-Json $config | Set-Content $myConfig
    }
    $config
}

function Locate-Tool {
param(
    [parameter][string] $tool
)
$toolShort= # strip the extention
{
    Get-Command $toolShort; 
    trap [Management.Automation.CommandNotFoundException] 
    {
        Write-Host "$tool : command not available"
        # attempts to recover by searching for executable
        continue
    } 
    
}

$search_result=Get-ChildItem -Path "C:\Program Files" -Filter 7z.exe -Recurse
Set-Item -Path Env:Path -Value ($Env:Path + ";" + $search_result.DirectoryName)

}


