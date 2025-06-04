# save_tabs.py
import yaml
import psutil
import subprocess
import sys
from typing import List, Dict, Optional

def get_chrome_tabs() -> List[Dict[str, str]]:
    """Get open tabs from Google Chrome"""
    try:
        # On macOS
        if sys.platform == 'darwin':
            script = '''
            tell application "Google Chrome"
                set tabList to {}
                repeat with w in windows
                    repeat with t in tabs of w
                        set end of tabList to {title:title of t, url:URL of t}
                    end repeat
                end repeat
                return tabList
            end tell
            '''
            result = subprocess.run(['osascript', '-e', script], capture_output=True, text=True)
            # Parse the AppleScript output (this would need more robust parsing)
            tabs = []
            for line in result.stdout.split('\n'):
                if 'title:' in line and 'url:' in line:
                    parts = line.split(',')
                    title = parts[0].split('title:')[1].strip()
                    url = parts[1].split('url:')[1].strip()
                    tabs.append({'title': title, 'url': url, 'browser': 'Chrome'})
            return tabs
        
        # On Windows
        elif sys.platform == 'win32':
            import win32gui
            import win32con
            
            def enum_windows_callback(hwnd, tabs):
                length = win32gui.GetWindowTextLength(hwnd)
                if length > 0:
                    window_title = win32gui.GetWindowText(hwnd)
                    if "Google Chrome" in window_title:
                        # This is a simplified approach - in reality you'd need to access the DOM
                        # which requires more complex COM interaction
                        tabs.append({
                            'title': window_title,
                            'url': 'https://chrome-tab-url-extraction-not-implemented',
                            'browser': 'Chrome'
                        })
                return True
            
            tabs = []
            win32gui.EnumWindows(enum_windows_callback, tabs)
            return tabs
        
        # On Linux
        else:
            # You might use xdotool or similar tools
            return []
    
    except Exception as e:
        print(f"Error getting Chrome tabs: {e}")
        return []

def get_edge_tabs() -> List[Dict[str, str]]:
    """Get open tabs from Microsoft Edge"""
    try:
        # Similar to Chrome implementation
        if sys.platform == 'darwin':
            script = '''
            tell application "Microsoft Edge"
                set tabList to {}
                repeat with w in windows
                    repeat with t in tabs of w
                        set end of tabList to {title:title of t, url:URL of t}
                    end repeat
                end repeat
                return tabList
            end tell
            '''
            result = subprocess.run(['osascript', '-e', script], capture_output=True, text=True)
            tabs = []
            for line in result.stdout.split('\n'):
                if 'title:' in line and 'url:' in line:
                    parts = line.split(',')
                    title = parts[0].split('title:')[1].strip()
                    url = parts[1].split('url:')[1].strip()
                    tabs.append({'title': title, 'url': url, 'browser': 'Edge'})
            return tabs
        
        elif sys.platform == 'win32':
            import win32gui
            
            def enum_windows_callback(hwnd, tabs):
                length = win32gui.GetWindowTextLength(hwnd)
                if length > 0:
                    window_title = win32gui.GetWindowText(hwnd)
                    if "Microsoft Edge" in window_title:
                        tabs.append({
                            'title': window_title,
                            'url': 'https://edge-tab-url-extraction-not-implemented',
                            'browser': 'Edge'
                        })
                return True
            
            tabs = []
            win32gui.EnumWindows(enum_windows_callback, tabs)
            return tabs
        
        else:
            return []
    
    except Exception as e:
        print(f"Error getting Edge tabs: {e}")
        return []

def get_firefox_tabs() -> List[Dict[str, str]]:
    """Get open tabs from Firefox"""
    try:
        if sys.platform == 'darwin':
            script = '''
            tell application "Firefox"
                set tabList to {}
                repeat with w in windows
                    repeat with t in tabs of w
                        set end of tabList to {title:title of t, url:URL of t}
                    end repeat
                end repeat
                return tabList
            end tell
            '''
            result = subprocess.run(['osascript', '-e', script], capture_output=True, text=True)
            tabs = []
            for line in result.stdout.split('\n'):
                if 'title:' in line and 'url:' in line:
                    parts = line.split(',')
                    title = parts[0].split('title:')[1].strip()
                    url = parts[1].split('url:')[1].strip()
                    tabs.append({'title': title, 'url': url, 'browser': 'Firefox'})
            return tabs
        
        elif sys.platform == 'win32':
            import win32gui
            
            def enum_windows_callback(hwnd, tabs):
                length = win32gui.GetWindowTextLength(hwnd)
                if length > 0:
                    window_title = win32gui.GetWindowText(hwnd)
                    if "Mozilla Firefox" in window_title:
                        tabs.append({
                            'title': window_title,
                            'url': 'https://firefox-tab-url-extraction-not-implemented',
                            'browser': 'Firefox'
                        })
                return True
            
            tabs = []
            win32gui.EnumWindows(enum_windows_callback, tabs)
            return tabs
        
        else:
            return []
    
    except Exception as e:
        print(f"Error getting Firefox tabs: {e}")
        return []

def get_yandex_tabs() -> List[Dict[str, str]]:
    """Get open tabs from Yandex Browser"""
    try:
        if sys.platform == 'darwin':
            script = '''
            tell application "Yandex"
                set tabList to {}
                repeat with w in windows
                    repeat with t in tabs of w
                        set end of tabList to {title:title of t, url:URL of t}
                    end repeat
                end repeat
                return tabList
            end tell
            '''
            result = subprocess.run(['osascript', '-e', script], capture_output=True, text=True)
            tabs = []
            for line in result.stdout.split('\n'):
                if 'title:' in line and 'url:' in line:
                    parts = line.split(',')
                    title = parts[0].split('title:')[1].strip()
                    url = parts[1].split('url:')[1].strip()
                    tabs.append({'title': title, 'url': url, 'browser': 'Yandex'})
            return tabs
        
        elif sys.platform == 'win32':
            import win32gui
            
            def enum_windows_callback(hwnd, tabs):
                length = win32gui.GetWindowTextLength(hwnd)
                if length > 0:
                    window_title = win32gui.GetWindowText(hwnd)
                    if "Yandex" in window_title:
                        tabs.append({
                            'title': window_title,
                            'url': 'https://yandex-tab-url-extraction-not-implemented',
                            'browser': 'Yandex'
                        })
                return True
            
            tabs = []
            win32gui.EnumWindows(enum_windows_callback, tabs)
            return tabs
        
        else:
            return []
    
    except Exception as e:
        print(f"Error getting Yandex tabs: {e}")
        return []

def save_tabs_to_yaml(browser_type: str = "all", output_file: str = "tabs.yaml"):
    """Save all open browser tabs to a YAML file"""
    tabs = []
    
    browser_type = browser_type.lower()
    if browser_type in ["all", "chrome"]:
        tabs.extend(get_chrome_tabs())
    if browser_type in ["all", "edge"]:
        tabs.extend(get_edge_tabs())
    if browser_type in ["all", "firefox"]:
        tabs.extend(get_firefox_tabs())
    if browser_type in ["all", "yandex"]:
        tabs.extend(get_yandex_tabs())
    
    # Prepare data for YAML
    yaml_data = []
    for tab in tabs:
        yaml_data.append({
            'title': tab['title'],
            'url': tab['url'],
            'browser': tab['browser']
        })
    
    # Save to YAML file
    with open(output_file, 'w') as f:
        yaml.dump(yaml_data, f, default_flow_style=False)
    
    print(f"Saved {len(tabs)} tabs to {output_file}")

if __name__ == "__main__":
    import argparse
    
    parser = argparse.ArgumentParser(description='Save browser tabs to YAML file.')
    parser.add_argument('--browser', type=str, default='all',
                       help='Browser type (chrome, edge, firefox, yandex, all)')
    parser.add_argument('--output', type=str, default='tabs.yaml',
                       help='Output YAML file path')
    
    args = parser.parse_args()
    save_tabs_to_yaml(args.browser, args.output)