<#
.SYNOPSIS
    Installs Google Antigravity AI agent skills globally to your IDE or locally to a project.

.DESCRIPTION
    Installs modern AI skills for Laravel 13, Flutter stable, PHP 8.5, React 19, and universal workflows.
    Supports installing everything or filtering specifically by stack (Flutter, Laravel, React, Common).

.PARAMETER Global
    Install skills globally to Antigravity IDE configuration (~/.gemini/config/skills).

.PARAMETER IDE
    Alias for -Global.

.PARAMETER Project
    Path to project directory where skills will be installed (.agent/skills).

.PARAMETER ProjectPath
    Alias for -Project.

.PARAMETER Stack
    Stack(s) to install: 'All', 'Flutter', 'Laravel', 'React', 'Common'. Supports multiple or comma-separated.

.PARAMETER Flutter
    Convenience switch to install Flutter skills.

.PARAMETER Laravel
    Convenience switch to install Laravel & PHP skills.

.PARAMETER React
    Convenience switch to install React 19 skills.

.PARAMETER All
    Convenience switch to install all skills.

.PARAMETER Common
    Convenience switch to install only common workflow skills.

.PARAMETER StackOnly
    Do NOT include common workflow skills when installing a specific stack.

.PARAMETER List
    List all available skills categorized by stack and exit.

.PARAMETER DryRun
    Preview actions without copying files.

.EXAMPLE
    .\install.ps1 -Global
    Installs all skills globally to the Antigravity IDE config.

.EXAMPLE
    .\install.ps1 -Flutter -Project .
    Installs Flutter skills (+ common skills) into current project's .agent/skills folder.

.EXAMPLE
    .\install.ps1 -Flutter -Laravel -Project D:\Projects\MyFullstackApp
    Installs both Flutter and Laravel skills into the project.

.EXAMPLE
    .\install.ps1 -List
    Lists all available skills.
#>

[CmdletBinding(DefaultParameterSetName = 'Install')]
param (
    [Parameter(ParameterSetName = 'Install')]
    [switch]$Global,

    [Parameter(ParameterSetName = 'Install')]
    [switch]$IDE,

    [Parameter(ParameterSetName = 'Install')]
    [Alias('ProjectPath')]
    [string]$Project,

    [Parameter(ParameterSetName = 'Install')]
    [string[]]$Stack,

    [Parameter(ParameterSetName = 'Install')]
    [switch]$Flutter,

    [Parameter(ParameterSetName = 'Install')]
    [switch]$Laravel,

    [Parameter(ParameterSetName = 'Install')]
    [switch]$React,

    [Parameter(ParameterSetName = 'Install')]
    [switch]$All,

    [Parameter(ParameterSetName = 'Install')]
    [switch]$Common,

    [Parameter(ParameterSetName = 'Install')]
    [switch]$StackOnly,

    [Parameter(ParameterSetName = 'Install')]
    [switch]$DryRun,

    [Parameter(ParameterSetName = 'List', Mandatory = $true)]
    [switch]$List
)

$ErrorActionPreference = 'Stop'
$ScriptDir = $PSScriptRoot
$ManifestPath = Join-Path $ScriptDir "skills.json"
$SkillsSourceDir = Join-Path $ScriptDir "skills"

if (-not (Test-Path $ManifestPath)) {
    Write-Error "Error: Manifest file '$ManifestPath' not found."
    exit 1
}

if (-not (Test-Path $SkillsSourceDir)) {
    Write-Error "Error: Skills source directory '$SkillsSourceDir' not found."
    exit 1
}

$Manifest = Get-Content $ManifestPath -Raw -Encoding utf8 | ConvertFrom-Json

if ($List) {
    Write-Host "======================================================================" -ForegroundColor Cyan
    Write-Host " Google Antigravity Agent Skills Catalog" -ForegroundColor Cyan
    Write-Host "======================================================================" -ForegroundColor Cyan
    $Total = 0
    foreach ($prop in $Manifest.stacks.PSObject.Properties) {
        $stackKey = $prop.Name
        $stackData = $prop.Value
        $skillList = $stackData.skills
        $Total += $skillList.Count
        Write-Host "`n[$($stackData.name)] ($($skillList.Count) skills)" -ForegroundColor Yellow
        Write-Host "Description: $($stackData.description)" -ForegroundColor DarkGray
        Write-Host ("-" * 70) -ForegroundColor DarkGray
        foreach ($s in ($skillList | Sort-Object)) {
            Write-Host "  - $s" -ForegroundColor White
        }
    }
    Write-Host "`n======================================================================" -ForegroundColor Cyan
    Write-Host " Total Canonical Skills: $Total" -ForegroundColor Cyan
    Write-Host "======================================================================" -ForegroundColor Cyan
    exit 0
}

# Determine Selected Stacks
$SelectedStacks = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)

if ($All) {
    [void]$SelectedStacks.Add('all')
} else {
    if ($Flutter) { [void]$SelectedStacks.Add('flutter') }
    if ($Laravel) { [void]$SelectedStacks.Add('laravel') }
    if ($React)   { [void]$SelectedStacks.Add('react') }
    if ($Common)  { [void]$SelectedStacks.Add('common') }
    
    if ($PSBoundParameters.ContainsKey('Stack') -and $Stack) {
        foreach ($sVal in $Stack) {
            foreach ($part in ($sVal -split ',')) {
                $trimmed = $part.Trim().ToLower()
                if ($trimmed) { [void]$SelectedStacks.Add($trimmed) }
            }
        }
    }
}

if ($SelectedStacks.Count -eq 0 -or $SelectedStacks.Contains('all')) {
    $SelectedStacks = [System.Collections.Generic.HashSet[string]]::new([string[]]@('all'), [System.StringComparer]::OrdinalIgnoreCase)
}

# Determine Target Directory
$TargetDir = $null
if ($Global -or $IDE) {
    $TargetDir = Join-Path $HOME ".gemini\config\skills"
}
elseif ($PSBoundParameters.ContainsKey('Project') -or $PSBoundParameters.ContainsKey('ProjectPath')) {
    $ProjPath = if ([string]::IsNullOrWhiteSpace($Project)) { (Get-Location).Path } else { [System.IO.Path]::GetFullPath($Project, (Get-Location).Path) }
    $TargetDir = Join-Path $ProjPath ".agent\skills"
}
else {
    Write-Host "No destination explicitly chosen (-Global or -Project). Defaulting to IDE Global." -ForegroundColor Yellow
    $TargetDir = Join-Path $HOME ".gemini\config\skills"
}

# Resolve Skills
$SkillsToInstall = [System.Collections.Generic.HashSet[string]]::new([System.StringComparer]::OrdinalIgnoreCase)

if ($SelectedStacks.Contains('all')) {
    foreach ($prop in $Manifest.stacks.PSObject.Properties) {
        foreach ($s in $prop.Value.skills) {
            [void]$SkillsToInstall.Add($s)
        }
    }
}
else {
    $includeCommon = $false
    foreach ($sKey in $SelectedStacks) {
        $stackProp = $Manifest.stacks.$sKey
        if ($null -eq $stackProp) {
            Write-Error "Unknown stack '$sKey'. Available: all, flutter, laravel, react, common"
            exit 1
        }
        foreach ($s in $stackProp.skills) {
            [void]$SkillsToInstall.Add($s)
        }
        if ($sKey -in @('flutter', 'laravel', 'react')) {
            $includeCommon = $true
        }
    }

    # Include common skills unless StackOnly was passed
    if (-not $StackOnly -and $includeCommon) {
        foreach ($s in $Manifest.stacks.common.skills) {
            [void]$SkillsToInstall.Add($s)
        }
    }
}

$SortedSkills = $SkillsToInstall | Sort-Object

Write-Host "`nTarget Destination: " -NoNewline
Write-Host $TargetDir -ForegroundColor Cyan
Write-Host "Skills to install: $($SortedSkills.Count)" -ForegroundColor Green

if ($DryRun) {
    Write-Host "[DRY-RUN MODE: No files will be modified]`n" -ForegroundColor Magenta
}

$InstalledCount = 0
foreach ($skillName in $SortedSkills) {
    $src = Join-Path $SkillsSourceDir $skillName
    $dst = Join-Path $TargetDir $skillName

    if (-not (Test-Path $src)) {
        Write-Warning "Source skill '$skillName' not found at '$src'!"
        continue
    }

    if ($DryRun) {
        Write-Host "  [PLAN] Copy $skillName -> $dst" -ForegroundColor DarkGray
    }
    else {
        if (-not (Test-Path $TargetDir)) {
            [void](New-Item -ItemType Directory -Path $TargetDir -Force)
        }
        if (Test-Path $dst) {
            Remove-Item -Path $dst -Recurse -Force
        }
        Copy-Item -Path $src -Destination $TargetDir -Recurse -Force
        Write-Host "  [OK] Installed $skillName" -ForegroundColor White
    }
    $InstalledCount++
}

if ($DryRun) {
    Write-Host "`nDry run complete. $InstalledCount skills planned for installation." -ForegroundColor Magenta
}
else {
    Write-Host "`nSuccess! $InstalledCount skills successfully installed to $TargetDir" -ForegroundColor Green
}
