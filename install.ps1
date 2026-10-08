# LexRO installer for Claude Code (Windows PowerShell)
# Instalator LexRO pentru Claude Code (Windows PowerShell)
#
#   irm https://raw.githubusercontent.com/tiberiugabriel/LexRO/main/install.ps1 | iex
#
# With options / Cu opțiuni:
#   & ([scriptblock]::Create((irm https://raw.githubusercontent.com/tiberiugabriel/LexRO/main/install.ps1))) -Project
#
# Options / Opțiuni:
#   -Project      install into .\.claude\skills (current project only / doar proiectul curent)
#   -Dir <path>   install into a custom skills directory / într-un folder de skill-uri ales
#   -Uninstall    remove the installed skill / șterge skill-ul instalat
#   -Force        replace an existing 'lexro' folder that is not LexRO / înlocuiește un folder 'lexro' străin
#
# Environment / Variabile de mediu:
#   LEXRO_REF          branch, tag or commit to install (default: main)
#   LEXRO_ARCHIVE_URL  full URL of a .zip archive of the repository (overrides LEXRO_REF)

param(
    [switch]$Project,
    [string]$Dir,
    [switch]$Uninstall,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$Repo      = 'tiberiugabriel/LexRO'
$SkillName = 'lexro'
$Ref       = if ($env:LEXRO_REF) { $env:LEXRO_REF } else { 'main' }
$ArchiveUrl = if ($env:LEXRO_ARCHIVE_URL) { $env:LEXRO_ARCHIVE_URL } else { "https://github.com/$Repo/archive/$Ref.zip" }

if ($Dir) {
    $TargetDir = $Dir; $Scope = 'custom'
} elseif ($Project) {
    $TargetDir = Join-Path (Get-Location) '.claude\skills'; $Scope = 'project'
} else {
    $TargetDir = Join-Path $HOME '.claude\skills'; $Scope = 'personal'
}
$Dest = Join-Path $TargetDir $SkillName

function Fail([string]$Message) {
    Write-Host "Error / Eroare: $Message" -ForegroundColor Red
    throw $Message
}

function Test-LexRO([string]$Path) {
    $skillMd = Join-Path $Path 'SKILL.md'
    if (-not (Test-Path $skillMd -PathType Leaf)) { return $false }
    return [bool](Select-String -Path $skillMd -Pattern "^name:\s*$SkillName\s*$" -Quiet)
}

function Remove-Existing {
    if (-not (Test-Path $Dest)) { return }
    $item = Get-Item $Dest -Force
    if ($item.LinkType) {
        # symlink/junction: remove the link only / doar linkul
        $item.Delete()
        return
    }
    if (-not $item.PSIsContainer) { Fail "$Dest exists and is not a folder / $Dest există și nu este un folder" }
    if (-not (Test-LexRO $Dest) -and -not $Force) {
        Fail "$Dest exists and is not LexRO. Use -Force to replace it. / $Dest există și nu este LexRO. Folosește -Force ca să-l înlocuiești."
    }
    Remove-Item $Dest -Recurse -Force
}

if ($Uninstall) {
    if (-not (Test-Path $Dest)) {
        Write-Host "LexRO is not installed in / LexRO nu este instalat în: $TargetDir"
        return
    }
    Remove-Existing
    Write-Host "LexRO removed from / LexRO a fost șters din: $Dest"
    return
}

$Tmp = Join-Path ([System.IO.Path]::GetTempPath()) ("lexro-" + [System.Guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $Tmp -Force | Out-Null

try {
    Write-Host "Downloading LexRO ($Ref) / Se descarcă LexRO ($Ref)..."
    $zip = Join-Path $Tmp 'lexro.zip'
    try {
        [Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12
    } catch { }
    try {
        Invoke-WebRequest -Uri $ArchiveUrl -OutFile $zip -UseBasicParsing
    } catch {
        Fail "download failed / descărcarea a eșuat: $ArchiveUrl"
    }

    $src = Join-Path $Tmp 'src'
    Expand-Archive -Path $zip -DestinationPath $src -Force

    $skillMd = Get-ChildItem -Path $src -Recurse -Filter 'SKILL.md' -File |
        Where-Object { $_.Directory.Name -eq $SkillName -and $_.Directory.Parent.Name -eq 'skills' } |
        Select-Object -First 1
    if (-not $skillMd) { Fail "skills/$SkillName/SKILL.md not found in the archive / nu a fost găsit în arhivă" }
    $skillSrc = $skillMd.Directory.FullName
    if (-not (Test-LexRO $skillSrc)) { Fail "the downloaded skill is not named '$SkillName' / skill-ul descărcat nu se numește '$SkillName'" }

    New-Item -ItemType Directory -Path $TargetDir -Force | Out-Null
    Remove-Existing
    Copy-Item -Path $skillSrc -Destination $Dest -Recurse

    Write-Host ""
    Write-Host "LexRO installed ($Scope) / LexRO instalat ($Scope): $Dest" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next / Pasul următor:"
    Write-Host "  - Open a new Claude Code session and type /lexro"
    Write-Host "    Deschide o sesiune nouă de Claude Code și scrie /lexro"
    Write-Host "  - Update: run this command again / Actualizare: rulează din nou această comandă"
    Write-Host ""
    Write-Host "LexRO provides informational guidance, not legal, tax or accounting advice."
    Write-Host "LexRO oferă orientare informativă, nu consultanță juridică, fiscală sau contabilă."
}
finally {
    Remove-Item $Tmp -Recurse -Force -ErrorAction SilentlyContinue
}
