# Sätt Git hooks-sökväg
$hookPath = "C:\Users\Tova\IdeaProjects\Git-uppgift\.git\hooks"
# Kopiera PowerShell-skriptet
Copy-Item ".githooks/pre-commit.ps1" -Destination "$hookPath/pre-commit.ps1"
# Skapa wrapper som anropar PowerShell
@"
#!/bin/sh
pwsh.exe -NoProfile -ExecutionPolicy Bypass -File ".git/hooks/pre-commit.ps1"
exit
"@ | Out-File -FilePath "$hookPath/pre-commit" -Encoding ASCII -NoNewline
Write-Host "Git hooks har installerats!" -ForegroundColor Green
