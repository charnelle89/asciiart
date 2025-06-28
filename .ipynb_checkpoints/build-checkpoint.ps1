# build.ps1 ─ convertit UN notebook (.ipynb) en script Python (.py)
param(
    # chemin du notebook source
    [string]$Notebook = "notebooks\analyse.ipynb",

    # dossier où écrire le .py (doit exister ou sera créé)
    [string]$OutDir   = "src\asciiart",

    # nom SANS extension (.py sera ajouté)
    [string]$OutBase  = "analyse"
)

# ► s'assurer que le dossier cible existe
if (-not (Test-Path $OutDir)) {
    New-Item -Path $OutDir -ItemType Directory -Force | Out-Null
}

Write-Host "🔄 Export $Notebook → $OutDir\$OutBase.py"

uv run jupyter nbconvert `
        --to script  $Notebook `
        --output     $OutBase `
        --output-dir $OutDir
