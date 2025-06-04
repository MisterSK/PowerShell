# Browser Tab Manager - README

This project provides PowerShell and Python scripts to manage browser tabs across multiple browsers (Chrome, Edge, Firefox, Yandex). The system allows you to save all open tabs to a YAML file and perform various operations on them.

## Features

- Save all open browser tabs to a YAML file (with title, URL, and browser info)
- Open all or a specified number of URLs from the YAML file in a specified browser
- Group tabs by common website domains into separate YAML files
- Group tabs by common topics into separate YAML files
- Open tabs filtered by domain or topic
- Open tabs from any generated sub-YAML file

## Requirements

### PowerShell Version
- Windows 10/11 (best compatibility)
- PowerShell 5.1 or newer
- Browsers must be installed

### Python Version
- Python 3.6 or newer
- Required packages: `pyyaml` (install with `pip install pyyaml`)
- Platform-specific requirements:
  - Windows: `pywin32` (install with `pip install pywin32`)
  - macOS: No additional requirements
  - Linux: May require `xdotool` or similar for some functionality

## Installation

1. Clone this repository or download the script files:
   - PowerShell: `save_tabs.ps1`, `tab_operations.ps1`
   - Python: `save_tabs.py`, `tab_operations.py`

2. For Python, install the required packages:
   ```bash
   pip install pyyaml
   ```

## How It Works

### Tab Collection Mechanism

**PowerShell:**
- Uses COM objects to interact with browser windows
- Parses window titles and document objects to extract tab information
- Works best with Internet Explorer and Edge (Chromium)

**Python:**
- Uses platform-specific methods:
  - On macOS: AppleScript to query browsers
  - On Windows: `win32gui` to enumerate windows
  - On Linux: Would use `xdotool` (not fully implemented)
- More cross-platform but may have limitations on some systems

### YAML File Structure

The generated YAML files have this format:
```yaml
- title: "Page Title"
  url: "https://example.com"
  browser: "Chrome"
- title: "Another Page"
  url: "https://example.org"
  browser: "Edge"
```

## Usage Examples

### PowerShell

1. Save all Chrome tabs:
```powershell
.\save_tabs.ps1 -BrowserType Chrome -OutputFile my_tabs.yaml
```

2. Open first 5 tabs in Edge:
```powershell
.\tab_operations.ps1 -Action open -InputFile my_tabs.yaml -BrowserType Edge -Count 5
```

3. Group tabs by domain:
```powershell
.\tab_operations.ps1 -Action group-domain -InputFile my_tabs.yaml
```

4. Open tabs from a specific domain:
```powershell
.\tab_operations.ps1 -Action open-domain -InputFile my_tabs.yaml -Domain example.com -BrowserType Chrome
```

5. Open tabs from a sub-YAML file:
```powershell
.\tab_operations.ps1 -Action open-subfile -SubFile grouped_by_domain\example.com.yaml -BrowserType Firefox
```

### Python

1. Save all Firefox tabs:
```bash
python save_tabs.py --browser firefox --output my_tabs.yaml
```

2. Open first 3 tabs in Chrome:
```bash
python tab_operations.py open --input my_tabs.yaml --browser chrome --count 3
```

3. Group tabs by topic:
```bash
python tab_operations.py group-topic --input my_tabs.yaml
```

4. Open all "news" tabs:
```bash
python tab_operations.py open-topic --input my_tabs.yaml --topic news --browser edge
```

5. Open tabs from a topic file:
```bash
python tab_operations.py open-subfile --file grouped_by_topic/news.yaml --browser firefox
```

## Limitations

1. **Tab Extraction Accuracy**:
   - Some browsers in private/incognito mode may not expose tab information
   - Complex single-page applications might not report accurate URLs

2. **Platform Support**:
   - PowerShell version works best on Windows
   - Python version has better cross-platform support but may need adjustments

3. **Browser Support**:
   - Chrome, Edge, Firefox, and Yandex are supported
   - Safari and other browsers would require additional implementation

4. **Topic Detection**:
   - Current topic detection is keyword-based
   - For more accurate results, consider integrating NLP techniques

## Troubleshooting

**PowerShell Issues:**
- If you get permission errors, run PowerShell as Administrator
- Execution policy might block scripts - run `Set-ExecutionPolicy RemoteSigned`

**Python Issues:**
- Make sure all dependencies are installed
- On macOS, grant Terminal full disk access for better tab extraction
- On Windows, install `pywin32` if you get COM-related errors

## Future Enhancements

1. Add support for more browsers (Opera, Safari, Brave)
2. Implement more sophisticated topic detection using NLP
3. Add scheduling capabilities to regularly save tab collections
4. Add GUI interface for easier management
5. Implement cloud synchronization of tab collections

## Contributing

Contributions are welcome! Please open issues or pull requests for:
- Bug fixes
- New browser support
- Additional features
- Improved documentation