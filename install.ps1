# Pulls the exploit engine that the pages drive.
$ErrorActionPreference = "Stop"
New-Item -ItemType Directory -Force -Path "patches" | Out-Null

$base = "https://raw.githubusercontent.com/StarlightShade15/raw13g-auto-exploit/main"
$files = @(
  "jb.js","core.js","mem.js","int64.js","ps4_offsets.js","rpc_worker.js",
  "payload2.bin","goldhen.bin","cache.appcache"
)

foreach ($f in $files) {
  Write-Host "  -> $f"
  Invoke-WebRequest -Uri "$base/$f" -OutFile $f -UseBasicParsing
}

foreach ($p in @("1302.bin","1350.bin","1352.bin")) {
  Write-Host "  -> patches/$p"
  Invoke-WebRequest -Uri "$base/patches/$p" -OutFile "patches/$p" -UseBasicParsing
}

Write-Host ""
Write-Host "OK - files downloaded:" -ForegroundColor Green
Get-ChildItem -Recurse -File | Select-Object Name, Length | Format-Table -AutoSize
Write-Host "Now deploy the whole folder to Netlify (app.netlify.com/drop)." -ForegroundColor Cyan