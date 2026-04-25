# ═══════════════════════════════════════════════════════════════════
# NODEX WATERMARK GENERATOR · V1.0
# ═══════════════════════════════════════════════════════════════════
#
# À QUOI ÇA SERT :
# Personnalise le skill Nodex V5.2 avec l'email + tier de l'acheteur,
# génère un code d'activation unique, et zippe le tout pour livraison.
#
# UTILISATION :
#   .\watermark-generator.ps1 -Email "client@exemple.com" -Tier "pro"
#
# OPTIONS :
#   -Email     : email de l'acheteur (obligatoire)
#   -Tier      : essentiel | pro | elite (obligatoire)
#   -SourceDir : chemin vers le skill source (défaut: ../../.claude/skills/nodex-v5.2)
#   -OutDir    : dossier de sortie (défaut: ./deliveries)
#
# OUTPUT :
#   - {OutDir}/nodex-v5.2-{tier}-{slug-email}.zip
#   - {OutDir}/nodex-v5.2-{tier}-{slug-email}-LICENSE.txt
#
# © 2026 Nodex Trading · V5.2 · Usage interne Nahel
# ═══════════════════════════════════════════════════════════════════

param(
    [Parameter(Mandatory=$true)]  [string]$Email,
    [Parameter(Mandatory=$true)]  [ValidateSet("essentiel","pro","elite")] [string]$Tier,
    [Parameter(Mandatory=$false)] [string]$SourceDir = "$PSScriptRoot\..\..\..\.claude\skills\nodex-v5.2",
    [Parameter(Mandatory=$false)] [string]$OutDir = "$PSScriptRoot\deliveries"
)

Write-Host ""
Write-Host "+============================================+" -ForegroundColor Cyan
Write-Host "|   NODEX WATERMARK GENERATOR  V1.0         |" -ForegroundColor Cyan
Write-Host "+============================================+" -ForegroundColor Cyan
Write-Host ""

# 1. Validations
Write-Host "[1/6] Validation des entrees..." -ForegroundColor Yellow

if (-not (Test-Path $SourceDir)) {
    Write-Host "  ERREUR : skill source introuvable : $SourceDir" -ForegroundColor Red
    exit 1
}
if (-not (Test-Path "$SourceDir\SKILL.md")) {
    Write-Host "  ERREUR : SKILL.md introuvable dans $SourceDir" -ForegroundColor Red
    exit 1
}
if ($Email -notmatch '^[\w\.\-]+@[\w\.\-]+\.\w+$') {
    Write-Host "  ERREUR : email invalide : $Email" -ForegroundColor Red
    exit 1
}

Write-Host "  OK - email : $Email" -ForegroundColor Green
Write-Host "  OK - tier  : $Tier" -ForegroundColor Green
Write-Host "  OK - source : $SourceDir" -ForegroundColor Green
Write-Host ""

# 2. Génération du code d'activation
Write-Host "[2/6] Generation du code d'activation..." -ForegroundColor Yellow

$tierShort = switch ($Tier) {
    "essentiel" { "ESS" }
    "pro"       { "PRO" }
    "elite"     { "ELT" }
}

function Get-RandomSeg {
    $chars = "ABCDEFGHIJKLMNPQRSTUVWXYZ23456789"  # Sans 0/O/1/I pour éviter confusion
    -join ((1..4) | ForEach-Object { $chars[(Get-Random -Maximum $chars.Length)] })
}

$activationCode = "NDX-$tierShort-$(Get-RandomSeg)-$(Get-RandomSeg)-$(Get-RandomSeg)"
$activationDate = (Get-Date).ToString("yyyy-MM-ddTHH:mm:ssZ")

Write-Host "  OK - code genere : $activationCode" -ForegroundColor Green
Write-Host ""

# 3. Préparation du dossier de sortie
Write-Host "[3/6] Preparation du dossier de sortie..." -ForegroundColor Yellow

if (-not (Test-Path $OutDir)) {
    New-Item -ItemType Directory -Path $OutDir | Out-Null
}

# Slug de l'email pour le nom de fichier
$emailSlug = ($Email -replace '@', '-at-' -replace '\.', '-' -replace '[^a-zA-Z0-9\-]', '')
$buildName = "nodex-v5.2-$Tier-$emailSlug"
$buildDir  = "$OutDir\$buildName"
$zipPath   = "$OutDir\$buildName.zip"
$licensePath = "$OutDir\$buildName-LICENSE.txt"

# Nettoie un éventuel build précédent
if (Test-Path $buildDir) { Remove-Item -Recurse -Force $buildDir }
if (Test-Path $zipPath)  { Remove-Item -Force $zipPath }

Write-Host "  OK - dossier de build : $buildDir" -ForegroundColor Green
Write-Host ""

# 4. Copie du skill source
Write-Host "[4/6] Copie du skill source..." -ForegroundColor Yellow

Copy-Item -Recurse -Force $SourceDir $buildDir

Write-Host "  OK - skill copie" -ForegroundColor Green
Write-Host ""

# 5. Watermark : injection dans tous les .md
Write-Host "[5/6] Injection du watermark dans les fichiers..." -ForegroundColor Yellow

$watermarkComment = @"

<!-- ============================================================
     NODEX V5.2 - LICENCE PERSONNELLE
     Acheteur     : $Email
     Tier         : $Tier ($tierShort)
     Code         : $activationCode
     Date achat   : $activationDate
     Watermark v1 : ce skill est strictement personnel et identifie.
     Toute redistribution est tracable et constitue une violation
     de la licence (CGV nodextrading.com).
     ============================================================ -->
"@

$mdFiles = Get-ChildItem -Path $buildDir -Recurse -Filter "*.md"
$count = 0
foreach ($file in $mdFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $content = $content + $watermarkComment
    $content | Out-File -FilePath $file.FullName -Encoding UTF8 -NoNewline
    $count++
}

# Pré-remplit state/license.json avec les infos de l'acheteur
$licenseJson = @{
    code = $activationCode
    tier = $Tier
    email = $Email
    activated_at = $null
    status = "pending_first_use"
    activation_method = "delivered"
    machine_id = $null
    expires_at = $null
    version_skill = "5.2.2"
} | ConvertTo-Json -Depth 5

$licensePending = "$buildDir\state\license.pending.json"
$licenseJson | Out-File -FilePath $licensePending -Encoding UTF8

Write-Host "  OK - watermark injecte dans $count fichiers .md" -ForegroundColor Green
Write-Host "  OK - license.pending.json cree" -ForegroundColor Green
Write-Host ""

# 6. Création du ZIP + fichier LICENSE
Write-Host "[6/6] Creation du ZIP + LICENSE.txt..." -ForegroundColor Yellow

Compress-Archive -Path "$buildDir\*" -DestinationPath $zipPath -Force

$licenseTxt = @"
+========================================================+
|   NODEX V5.2 - CERTIFICAT DE LICENCE                  |
+========================================================+

Cher(e) $Email,

Merci pour ton achat sur nodextrading.com !

Voici les informations de ta licence :

  EMAIL          : $Email
  TIER           : $Tier
  CODE ACTIVATION: $activationCode
  DATE D'ACHAT   : $activationDate
  ZIP LIVRE      : $buildName.zip

INSTRUCTIONS D'INSTALLATION :

  1. Decompresse le ZIP "$buildName.zip"
  2. Lance "install.ps1" en clic droit > "Executer avec PowerShell"
  3. Ouvre Claude Code dans ton dossier de trading
  4. Dis : "Nodex tu es la ?"
  5. Quand on te demande ton code d'activation, colle :
     >>> $activationCode <<<
  6. C'est parti.

ATTENTION :

  - Cette licence est strictement personnelle.
  - Le ZIP livre contient un watermark identifiant ton email.
  - Tout partage / revente / redistribution constitue une violation
    de la licence (cf. CGV sur nodextrading.com) et peut donner
    lieu a poursuites + revocation immediate de ta licence.
  - 1 licence = 3 machines maximum.

SUPPORT :

  - Email   : nodexcontact@gmail.com
  - Site    : nodextrading.com
  - Reponse : sous 24h ouvrees

Bon trading !
Nahel Zamouri - Fondateur Nodex Trading
"@

$licenseTxt | Out-File -FilePath $licensePath -Encoding UTF8

# Nettoie le dossier de build (on garde juste le ZIP + LICENSE)
Remove-Item -Recurse -Force $buildDir

Write-Host "  OK - ZIP cree : $zipPath" -ForegroundColor Green
Write-Host "  OK - LICENSE.txt cree : $licensePath" -ForegroundColor Green
Write-Host ""

# Récapitulatif
Write-Host "+============================================+" -ForegroundColor Green
Write-Host "|   LIVRAISON PRETE                         |" -ForegroundColor Green
Write-Host "+============================================+" -ForegroundColor Green
Write-Host ""
Write-Host "  Email           : $Email" -ForegroundColor White
Write-Host "  Tier            : $Tier" -ForegroundColor White
Write-Host "  Code activation : $activationCode" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Fichiers a envoyer par email :" -ForegroundColor Yellow
Write-Host "    1. $zipPath" -ForegroundColor White
Write-Host "    2. $licensePath" -ForegroundColor White
Write-Host ""
Write-Host "  Le code d'activation est aussi dans LICENSE.txt." -ForegroundColor Yellow
Write-Host ""

# Renvoie un objet exploitable si le script est appelé en mode pipeline
[PSCustomObject]@{
    Email = $Email
    Tier = $Tier
    ActivationCode = $activationCode
    ZipPath = $zipPath
    LicensePath = $licensePath
    GeneratedAt = $activationDate
}
