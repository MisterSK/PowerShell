# save_tabs.ps1
param(
    [string]$BrowserType = "All",
    [string]$OutputFile = "tabs.yaml"
)

function Get-ChromeTabs {
    $chromeTabs = @()
    $chromeProcesses = Get-Process -Name "chrome" -ErrorAction SilentlyContinue
    
    if ($chromeProcesses) {
        try {
            $chrome = New-Object -ComObject Shell.Application
            $chromeWindows = $chrome.Windows() | Where-Object { $_.Name -like "*Google Chrome*" }
            
            foreach ($window in $chromeWindows) {
                for ($i = 0; $i -lt $window.Document.frames.length; $i++) {
                    $tab = $window.Document.frames.item($i).document
                    $chromeTabs += [PSCustomObject]@{
                        Title = $tab.title
                        URL = $tab.url
                        Browser = "Chrome"
                    }
                }
            }
        } catch {
            Write-Warning "Error accessing Chrome tabs: $_"
        }
    }
    
    return $chromeTabs
}

function Get-EdgeTabs {
    $edgeTabs = @()
    $edgeProcesses = Get-Process -Name "msedge" -ErrorAction SilentlyContinue
    
    if ($edgeProcesses) {
        try {
            $edge = New-Object -ComObject Shell.Application
            $edgeWindows = $edge.Windows() | Where-Object { $_.Name -like "*Microsoft Edge*" }
            
            foreach ($window in $edgeWindows) {
                for ($i = 0; $i -lt $window.Document.frames.length; $i++) {
                    $tab = $window.Document.frames.item($i).document
                    $edgeTabs += [PSCustomObject]@{
                        Title = $tab.title
                        URL = $tab.url
                        Browser = "Edge"
                    }
                }
            }
        } catch {
            Write-Warning "Error accessing Edge tabs: $_"
        }
    }
    
    return $edgeTabs
}

function Get-FirefoxTabs {
    $firefoxTabs = @()
    $firefoxProcesses = Get-Process -Name "firefox" -ErrorAction SilentlyContinue
    
    if ($firefoxProcesses) {
        try {
            $firefox = New-Object -ComObject Shell.Application
            $firefoxWindows = $firefox.Windows() | Where-Object { $_.Name -like "*Mozilla Firefox*" }
            
            foreach ($window in $firefoxWindows) {
                for ($i = 0; $i -lt $window.Document.frames.length; $i++) {
                    $tab = $window.Document.frames.item($i).document
                    $firefoxTabs += [PSCustomObject]@{
                        Title = $tab.title
                        URL = $tab.url
                        Browser = "Firefox"
                    }
                }
            }
        } catch {
            Write-Warning "Error accessing Firefox tabs: $_"
        }
    }
    
    return $firefoxTabs
}

function Get-YandexTabs {
    $yandexTabs = @()
    $yandexProcesses = Get-Process -Name "yandex" -ErrorAction SilentlyContinue
    
    if ($yandexProcesses) {
        try {
            $yandex = New-Object -ComObject Shell.Application
            $yandexWindows = $yandex.Windows() | Where-Object { $_.Name -like "*Yandex*" }
            
            foreach ($window in $yandexWindows) {
                for ($i = 0; $i -lt $window.Document.frames.length; $i++) {
                    $tab = $window.Document.frames.item($i).document
                    $yandexTabs += [PSCustomObject]@{
                        Title = $tab.title
                        URL = $tab.url
                        Browser = "Yandex"
                    }
                }
            }
        } catch {
            Write-Warning "Error accessing Yandex tabs: $_"
        }
    }
    
    return $yandexTabs
}

# Collect tabs based on specified browser
$allTabs = @()

switch ($BrowserType.ToLower()) {
    "chrome" { $allTabs += Get-ChromeTabs }
    "edge" { $allTabs += Get-EdgeTabs }
    "firefox" { $allTabs += Get-FirefoxTabs }
    "yandex" { $allTabs += Get-YandexTabs }
    default {
        $allTabs += Get-ChromeTabs
        $allTabs += Get-EdgeTabs
        $allTabs += Get-FirefoxTabs
        $allTabs += Get-YandexTabs
    }
}

# Convert to YAML
$yamlContent = ""
foreach ($tab in $allTabs) {
    $yamlContent += "- title: ""$($tab.Title -replace '"', '\"')`n"
    $yamlContent += "  url: ""$($tab.URL -replace '"', '\"')`n"
    $yamlContent += "  browser: ""$($tab.Browser)`n"
}

# Save to file
$yamlContent | Out-File -FilePath $OutputFile -Encoding UTF8
Write-Host "Saved $($allTabs.Count) tabs to $OutputFile"