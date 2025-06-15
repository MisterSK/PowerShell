# tab_operations.ps1
param(
    [string]$Action,
    [string]$InputFile = "tabs.yaml",
    [string]$BrowserType = "chrome",
    [int]$Count = 0,
    [string]$Domain = "",
    [string]$Topic = "",
    [string]$SubFile = ""
)

function Import-TabsFromYaml {
    param([string]$FilePath)
    
    $tabs = @()
    $content = Get-Content -Path $FilePath -Raw
    
    # Simple YAML parsing (for this specific format)
    $entries = $content -split '(?m)^- title:'
    foreach ($entry in $entries) {
        if ($entry.Trim()) {
            $tab = @{}
            $lines = $entry.Trim() -split "`n"
            foreach ($line in $lines) {
                if ($line -match '^\s*([^:]+):\s*"(.*)"\s*$') {
                    $key = $matches[1].Trim()
                    $value = $matches[2].Trim()
                    $tab[$key] = $value
                }
            }
            if ($tab.Count -gt 0) {
                $tabs += $tab
            }
        }
    }
    
    return $tabs
}

function Open-Tabs {
    param(
        [array]$Tabs,
        [string]$Browser,
        [int]$Count = 0
    )
    
    $browserExe = switch ($Browser.ToLower()) {
        "chrome" { "chrome.exe" }
        "edge" { "msedge.exe" }
        "firefox" { "firefox.exe" }
        "yandex" { "browser.exe" }
        default { "chrome.exe" }
    }
    
    $urls = $Tabs | Select-Object -ExpandProperty url
    if ($Count -gt 0) {
        $urls = $urls | Select-Object -First $Count
    }
    
    foreach ($url in $urls) {
        Start-Process $browserExe $url
    }
}

function Group-ByDomain {
    param([array]$Tabs)
    
    $groups = @{}
    foreach ($tab in $Tabs) {
        $url = $tab.url
        if ($url -match 'https?://([^/]+)') {
            $domain = $matches[1]
            if (-not $groups.ContainsKey($domain)) {
                $groups[$domain] = @()
            }
            $groups[$domain] += $tab
        }
    }
    
    # Create directory if not exists
    $dir = "grouped_by_domain"
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir | Out-Null
    }
    
    # Save each group to a separate file
    foreach ($domain in $groups.Keys) {
        $safeDomain = $domain -replace '[\\/:*?"<>|]', '_'
        $yamlContent = ""
        foreach ($tab in $groups[$domain]) {
            $yamlContent += "- title: ""$($tab.title -replace '"', '\"')`n"
            $yamlContent += "  url: ""$($tab.url -replace '"', '\"')`n"
            $yamlContent += "  browser: ""$($tab.browser)`n"
        }
        $yamlContent | Out-File -FilePath "$dir\$safeDomain.yaml" -Encoding UTF8
    }
    
    Write-Host "Saved $($groups.Count) domain groups to $dir"
}

function Group-ByTopic {
    param([array]$Tabs)
    
    # This is a simplified example - in a real implementation you might use
    # a keyword extraction library or manual categorization
    $topics = @{
        "news" = @("news", "article", "report", "update")
        "social" = @("facebook", "twitter", "linkedin", "instagram")
        "shopping" = @("amazon", "ebay", "store", "shop")
        "tech" = @("github", "stackoverflow", "microsoft", "developer")
    }
    
    $groups = @{}
    foreach ($key in $topics.Keys) {
        $groups[$key] = @()
    }
    $groups["other"] = @()
    
    foreach ($tab in $Tabs) {
        $matched = $false
        foreach ($topic in $topics.Keys) {
            foreach ($keyword in $topics[$topic]) {
                if ($tab.url -match $keyword -or $tab.title -match $keyword) {
                    $groups[$topic] += $tab
                    $matched = $true
                    break
                }
            }
            if ($matched) { break }
        }
        if (-not $matched) {
            $groups["other"] += $tab
        }
    }
    
    # Create directory if not exists
    $dir = "grouped_by_topic"
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir | Out-Null
    }
    
    # Save each group to a separate file
    foreach ($topic in $groups.Keys) {
        $yamlContent = ""
        foreach ($tab in $groups[$topic]) {
            $yamlContent += "- title: ""$($tab.title -replace '"', '\"')`n"
            $yamlContent += "  url: ""$($tab.url -replace '"', '\"')`n"
            $yamlContent += "  browser: ""$($tab.browser)`n"
        }
        $yamlContent | Out-File -FilePath "$dir\$topic.yaml" -Encoding UTF8
    }
    
    Write-Host "Saved $($groups.Count) topic groups to $dir"
}

# Main execution
$tabs = Import-TabsFromYaml -FilePath $InputFile

switch ($Action.ToLower()) {
    "open" {
        Open-Tabs -Tabs $tabs -Browser $BrowserType -Count $Count
    }
    "group-domain" {
        Group-ByDomain -Tabs $tabs
    }
    "group-topic" {
        Group-ByTopic -Tabs $tabs
    }
    "open-domain" {
        $grouped = @{}
        foreach ($tab in $tabs) {
            $url = $tab.url
            if ($url -match 'https?://([^/]+)') {
                $domain = $matches[1]
                if (-not $grouped.ContainsKey($domain)) {
                    $grouped[$domain] = @()
                }
                $grouped[$domain] += $tab
            }
        }
        
        if ($grouped.ContainsKey($Domain)) {
            Open-Tabs -Tabs $grouped[$Domain] -Browser $BrowserType
        } else {
            Write-Host "Domain not found in tabs"
        }
    }
    "open-topic" {
        $grouped = @{}
        foreach ($tab in $tabs) {
            $matched = $false
            if ($tab.url -match $Topic -or $tab.title -match $Topic) {
                $grouped[$Topic] += $tab
                $matched = $true
            }
            if (-not $matched) {
                $grouped["other"] += $tab
            }
        }
        
        if ($grouped.ContainsKey($Topic)) {
            Open-Tabs -Tabs $grouped[$Topic] -Browser $BrowserType
        } else {
            Write-Host "Topic not found in tabs"
        }
    }
    "open-subfile" {
        if (Test-Path $SubFile) {
            $subTabs = Import-TabsFromYaml -FilePath $SubFile
            Open-Tabs -Tabs $subTabs -Browser $BrowserType
        } else {
            Write-Host "File not found: $SubFile"
        }
    }
    default {
        Write-Host "Invalid action. Valid actions are: open, group-domain, group-topic, open-domain, open-topic, open-subfile"
    }
}