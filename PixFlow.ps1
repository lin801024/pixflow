# PixFlow launcher - sets up the local environment and forwards all args to pixflow-motion CLI
$Root  = Split-Path -Parent $MyInvocation.MyCommand.Path
$Skill = Join-Path $Root 'skill'

# 1) Self-contained ffmpeg/ffprobe (E:\PixFlow\bin)
$env:Path = (Join-Path $Root 'bin') + ';' + $env:Path

# 2) Hugging Face mirror for the depth model download (only if not already set)
if (-not $env:HF_ENDPOINT) { $env:HF_ENDPOINT = 'https://hf-mirror.com' }

# 3) Use the system Edge (Chromium) as Remotion's browser (only if it exists and not already set)
if (-not $env:PIXFLOW_CHROME) {
    $edge = 'C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe'
    if (Test-Path -LiteralPath $edge) { $env:PIXFLOW_CHROME = $edge }
}

Set-Location -LiteralPath $Skill
& node (Join-Path $Skill 'cli\pixflow-motion.mjs') @args
exit $LASTEXITCODE
