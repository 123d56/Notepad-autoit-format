# AutoIt Tidy Formatter - installer (bilingual / 双语)
# Expects: <script>\AutoItBeautify\...  ->  copies into <Notepad++>\plugins\AutoItBeautify\
# 写入 Program Files 时会自动请求管理员权限 / Requests UAC automatically when needed.
param([string]$NppDir = '', [switch]$NoPause)
$ErrorActionPreference = 'Stop'
$self = Split-Path -Parent $MyInvocation.MyCommand.Path
$src  = Join-Path $self 'AutoItBeautify'

function Find-NppDir {
    foreach ($p in @("$env:ProgramFiles\Notepad++", "${env:ProgramFiles(x86)}\Notepad++")) {
        if ($p -and (Test-Path (Join-Path $p 'notepad++.exe'))) { return $p }
    }
    foreach ($k in @('HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\notepad++.exe',
                     'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\App Paths\notepad++.exe')) {
        $exe = (Get-ItemProperty $k -ErrorAction SilentlyContinue).'(default)'
        if ($exe) { return (Split-Path -Parent $exe) }
    }
    return $null
}

if (-not $NppDir) { $NppDir = Find-NppDir }
if (-not $NppDir) { throw 'Notepad++ not found / 未找到 Notepad++: copy the AutoItBeautify folder into <Notepad++>\plugins\ manually.' }
if (-not (Test-Path $src)) { throw "AutoItBeautify folder missing / 缺少 AutoItBeautify 文件夹: $src" }

$dest = Join-Path $NppDir 'plugins\AutoItBeautify'
try {
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    Copy-Item (Join-Path $src '*') $dest -Recurse -Force -ErrorAction Stop
} catch {
    Write-Host 'Requesting administrator rights... / 正在请求管理员权限...'
    $arguments = @('-NoProfile','-ExecutionPolicy','Bypass','-File',"`"$PSCommandPath`"",'-NppDir',"`"$NppDir`"",'-NoPause')
    Start-Process powershell -Verb RunAs -ArgumentList $arguments -Wait
    exit
}

Write-Host ''
Write-Host "Installed to / 已安装到: $dest"
Write-Host 'Restart Notepad++ completely to activate. / 请完全退出并重新启动 Notepad++ 以生效。'
if (-not $NoPause) { Read-Host 'Press Enter to exit / 按回车退出' | Out-Null }