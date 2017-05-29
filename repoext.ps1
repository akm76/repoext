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

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

Function Get-DirName()
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $FolderBrowserDialog = New-Object System.Windows.Forms.FolderBrowserDialog
    $FolderBrowserDialog.RootFolder = "MyDocuments"
    $FolderBrowserDialog.Description = "Select Local Repository Destination"
    $FolderBrowserDialog.ShowDialog() | Out-Null
    $FolderBrowserDialog.SelectedPath
}

function Get-RepoPaths()
{
    $myConfig=Join-Path $env:USERPROFILE "\.repoext.cfg"
    $projDefs=Join-Path $scriptPath "\projects"
    if (Test-Path $myConfig) {
        $config=Get-Content $myConfig | ConvertFrom-Json
    }
    else {
        $srcPath=Get-DirName
        $config=[PSCustomObject]@{"SRC"=$srcPath;
        "CONFIG"=$myConfig;
        "PROJDEFS"=$projDefs;
        }
        ConvertTo-Json $config | Set-Content $myConfig
    }
    $config
}

Function Search-Command {
# usage: Search-Command blahblah C:\Users\Sandbox,C:\Users\Public
Param(
    [parameter(Mandatory=$true)][string] $tool,
    [parameter(Mandatory=$false,ValueFromPipeline=$true)][String[]] $paths
    )
    $toolexe=$tool+".exe"
    $defaultSearchPaths=Get-ChildItem c:\Program* | Where-Object PSIsContainer
    $addSearchPaths=foreach($item in $paths) { Get-Item $item | Where-Object PSIsContainer }
    $searchPaths=$defaultSearchPaths+$addSearchPaths
    foreach($item in $searchPaths) {
        Write-Host "Searching $item ..." -NoNewline
        $searchResult=Get-ChildItem -Path $item -Filter $toolexe -Recurse
        if ($searchResult -eq $null) {
            Write-Host " not found."
        }
        else {
            Write-Host " found, adding to PATH"
            Set-Item -Path Env:Path -Value ($Env:Path + ";" + $searchResult.DirectoryName)
            break # no need to add multiples?
        }
    }
}


function Test-Command {
param(
    [parameter(Mandatory=$true)][string] $tool,
    [parameter(Mandatory=$false)][String[]] $paths
)
Write-Host "checking $tool..." -NoNewline

try {
    $e=Get-Command $tool -ErrorAction Stop;
    if($e -ne $null) {
        Write-Host $e.Source
    } 
}
catch [System.Management.Automation.CommandNotFoundException] 
    {
        Write-Host $_.Exception.Message
        Write-Host "$tool : command not available"
        Search-Command $tool $paths
        continue
    }
finally {
    Write-Host "verifying the command: $tool"
    $e=Get-Command $tool 
    if($e -eq $null) {
        throw;
        }
    }
    $e 
}

function Clone-Repo {
param(
    [parameter(Mandatory=$true)][string] $repoName,
    [parameter(Mandatory=$true)] $config
    )
    Write-Host $repoName
    $manifestLoc=Join-Path $config.PROJDEFS $repoName 
    $manifestLoc=Join-Path $manifestLoc "manifest.json"
    if(Test-Path $manifestLoc) {
        $manifest = Get-Content $manifestLoc | ConvertFrom-Json
        $cloneURL = $manifest.cloneurl
        Write-Host $cloneURL
        $localRepo=Join-Path $config.SRC $repoName
        if(Test-Path $localRepo) {
            throw "Local Repo exists; remove first or use Update-Repo: "+$localRepo
        }
        Push-Location $config.SRC
        if($cloneURL.Length -ne 0) {
            $cmd=$cloneURL+" "+$repoName+" >"+$repoName+"-clone.log"
            Invoke-Expression $cmd
        }
        Pop-Location
    }
    else {
        Write-Host $repoName + " is missing manifest.json file"
    }
}



function Update-Repo {
param(
    [parameter(Mandatory=$true)][string] $repoName,
    [parameter(Mandatory=$true)] $config
    )
    Write-Host $repoName
}

