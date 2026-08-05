$ErrorActionPreference = "Stop"
$readme = "README.md"

# 1. Badges to left
$leftBadges = '<p align="center">`n  <a href="https://github.com/ishandutta2007/Awesome-Awesome-Awesome"><img src="https://img.shields.io/badge/Awesome-%E2%9C%94-blueviolet?style=flat-square&logo=github" alt="Awesome"/></a><a href="https://discord.gg/jc4xtF58Ve"><img src="https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white" alt="Discord" /></a>'
$content = Get-Content -Raw $readme
$content = $content -replace '(?m)^# 🚀 Insane-Valuation-Tech-Companies\r?\n', "# 🚀 Insane-Valuation-Tech-Companies`n`n$leftBadges`n</p>`n"
Set-Content -NoNewline -Path $readme -Value $content
git add .
git commit -m "seo optimised and badges to left added"
# We skip pushing here to avoid potential lock issues, we will do a final push at the end. Wait, user explicitly asked to run `git push` each time. I will include it.
git push

# 2. Badge to right
$rightBadge = '<a href="https://github.com/ishandutta2007"><img alt="GitHub followers" src="https://img.shields.io/github/followers/ishandutta2007?label=Follow" /></a>'
$content = Get-Content -Raw $readme
$content = $content -replace '(?m)(<a href="https://discord\.gg/jc4xtF58Ve".*?</a>)', "`$1$rightBadge"
Set-Content -NoNewline -Path $readme -Value $content
git add .
git commit -m "badges to right added"
git push

# 3. Star history
$folderName = "Insane-Valuation-Tech-Companies"
$starHistory = "`n##  Star History`n<div align=`"center`">`n<a href=`"https://www.star-history.com/?repos=ishandutta2007%2F$folderName&type=date&legend=bottom-right`">`n<picture>`n<source media=`"(prefers-color-scheme: dark)`" srcset=`"https://api.star-history.com/chart?repos=ishandutta2007/$folderName&type=date&theme=dark&legend=bottom-right`" />`n<source media=`"(prefers-color-scheme: light)`" srcset=`"https://api.star-history.com/chart?repos=ishandutta2007/$folderName&type=date&legend=bottom-right`" />`n<img alt=`"Star History Chart`" src=`"https://api.star-history.com/chart?repos=ishandutta2007/$folderName&type=date&legend=bottom-right`" />`n</picture>`n</a>`n</div>`n"
$content = Get-Content -Raw $readme
$content = $content + $starHistory
Set-Content -NoNewline -Path $readme -Value $content
git add .
git commit -m "star history added"
git push

# 4. Replace chartrepos
$content = Get-Content -Raw $readme
if ($content -match 'chartrepos') {
    $content = $content -replace 'chartrepos', 'chart?repos'
    Set-Content -NoNewline -Path $readme -Value $content
    git add .
    git commit -m "fixed star plot"
    git push
}

# 5. Replace awesome link
$content = Get-Content -Raw $readme
if ($content -match 'https://github.com/sindresorhus/awesome') {
    $content = $content -replace 'https://github.com/sindresorhus/awesome', 'https://github.com/ishandutta2007/Awesome-Awesome-Awesome'
    Set-Content -NoNewline -Path $readme -Value $content
    git add .
    git commit -m "invalid awesome link fixed"
    git push
}
