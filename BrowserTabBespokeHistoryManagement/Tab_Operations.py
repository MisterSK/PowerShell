# tab_operations.py
import yaml
import argparse
import subprocess
import os
from urllib.parse import urlparse
from typing import List, Dict, Optional
import sys

def load_tabs_from_yaml(file_path: str) -> List[Dict[str, str]]:
    """Load tabs from a YAML file"""
    with open(file_path, 'r') as f:
        return yaml.safe_load(f)

def open_tabs(tabs: List[Dict[str, str]], browser: str, count: int = 0):
    """Open tabs in the specified browser"""
    browser_cmd = {
        'chrome': {
            'win32': 'start chrome',
            'darwin': 'open -a "Google Chrome"',
            'linux': 'google-chrome'
        },
        'edge': {
            'win32': 'start msedge',
            'darwin': 'open -a "Microsoft Edge"',
            'linux': 'microsoft-edge'
        },
        'firefox': {
            'win32': 'start firefox',
            'darwin': 'open -a "Firefox"',
            'linux': 'firefox'
        },
        'yandex': {
            'win32': 'start yandex',
            'darwin': 'open -a "Yandex"',
            'linux': 'yandex-browser'
        }
    }.get(browser.lower(), {}).get(sys.platform, 'chrome')
    
    if not browser_cmd:
        print(f"Unsupported browser/platform combination: {browser}/{sys.platform}")
        return
    
    urls = [tab['url'] for tab in tabs]
    if count > 0:
        urls = urls[:count]
    
    for url in urls:
        if sys.platform == 'win32':
            subprocess.Popen(f'{browser_cmd} "{url}"', shell=True)
        else:
            subprocess.Popen(f'{browser_cmd} "{url}"', shell=True)

def group_by_domain(tabs: List[Dict[str, str]], output_dir: str = "grouped_by_domain"):
    """Group tabs by domain and save to separate YAML files"""
    groups = {}
    
    for tab in tabs:
        try:
            domain = urlparse(tab['url']).netloc
            if not domain:
                continue
                
            if domain.startswith('www.'):
                domain = domain[4:]
                
            if domain not in groups:
                groups[domain] = []
            groups[domain].append(tab)
        except:
            continue
    
    os.makedirs(output_dir, exist_ok=True)
    
    for domain, domain_tabs in groups.items():
        safe_domain = "".join(c if c.isalnum() else "_" for c in domain)
        output_file = os.path.join(output_dir, f"{safe_domain}.yaml")
        
        with open(output_file, 'w') as f:
            yaml.dump(domain_tabs, f, default_flow_style=False)
    
    print(f"Saved {len(groups)} domain groups to {output_dir}")

def group_by_topic(tabs: List[Dict[str, str]], output_dir: str = "grouped_by_topic"):
    """Group tabs by topic and save to separate YAML files"""
    # Simplified topic detection - in a real app you might use NLP or a more sophisticated approach
    topics = {
        'news': ['news', 'article', 'report', 'update', 'headline'],
        'social': ['facebook', 'twitter', 'linkedin', 'instagram', 'social'],
        'shopping': ['amazon', 'ebay', 'store', 'shop', 'cart', 'buy'],
        'tech': ['github', 'stackoverflow', 'microsoft', 'developer', 'tech', 'programming'],
        'video': ['youtube', 'vimeo', 'watch', 'video'],
        'work': ['office', 'outlook', 'slack', 'teams', 'work'],
        'email': ['mail', 'gmail', 'inbox', 'email']
    }
    
    groups = {topic: [] for topic in topics}
    groups['other'] = []
    
    for tab in tabs:
        matched = False
        url = tab['url'].lower()
        title = tab['title'].lower()
        
        for topic, keywords in topics.items():
            for keyword in keywords:
                if keyword in url or keyword in title:
                    groups[topic].append(tab)
                    matched = True
                    break
            if matched:
                break
        
        if not matched:
            groups['other'].append(tab)
    
    os.makedirs(output_dir, exist_ok=True)
    
    for topic, topic_tabs in groups.items():
        if topic_tabs:  # Only create files for non-empty groups
            output_file = os.path.join(output_dir, f"{topic}.yaml")
            
            with open(output_file, 'w') as f:
                yaml.dump(topic_tabs, f, default_flow_style=False)
    
    print(f"Saved {len([t for t in groups.values() if t])} topic groups to {output_dir}")

def open_by_domain(tabs: List[Dict[str, str]], domain: str, browser: str):
    """Open tabs from a specific domain"""
    domain_tabs = []
    
    for tab in tabs:
        try:
            tab_domain = urlparse(tab['url']).netloc
            if tab_domain and (domain in tab_domain or tab_domain in domain):
                domain_tabs.append(tab)
        except:
            continue
    
    if domain_tabs:
        open_tabs(domain_tabs, browser)
        print(f"Opened {len(domain_tabs)} tabs from domain {domain}")
    else:
        print(f"No tabs found for domain {domain}")

def open_by_topic(tabs: List[Dict[str, str]], topic: str, browser: str):
    """Open tabs related to a specific topic"""
    topic_tabs = []
    topic = topic.lower()
    
    for tab in tabs:
        url = tab['url'].lower()
        title = tab['title'].lower()
        
        if topic in url or topic in title:
            topic_tabs.append(tab)
    
    if topic_tabs:
        open_tabs(topic_tabs, browser)
        print(f"Opened {len(topic_tabs)} tabs related to topic {topic}")
    else:
        print(f"No tabs found for topic {topic}")

def open_from_subfile(file_path: str, browser: str):
    """Open tabs from a sub YAML file"""
    if os.path.exists(file_path):
        tabs = load_tabs_from_yaml(file_path)
        open_tabs(tabs, browser)
        print(f"Opened {len(tabs)} tabs from {file_path}")
    else:
        print(f"File not found: {file_path}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Manage browser tabs from YAML file.')
    subparsers = parser.add_subparsers(dest='action', required=True)
    
    # Open tabs parser
    open_parser = subparsers.add_parser('open', help='Open tabs from YAML file')
    open_parser.add_argument('--input', default='tabs.yaml', help='Input YAML file')
    open_parser.add_argument('--browser', default='chrome', help='Browser to open in')
    open_parser.add_argument('--count', type=int, default=0, help='Number of tabs to open (0 for all)')
    
    # Group by domain parser
    domain_group_parser = subparsers.add_parser('group-domain', help='Group tabs by domain')
    domain_group_parser.add_argument('--input', default='tabs.yaml', help='Input YAML file')
    domain_group_parser.add_argument('--output-dir', default='grouped_by_domain', help='Output directory')
    
    # Group by topic parser
    topic_group_parser = subparsers.add_parser('group-topic', help='Group tabs by topic')
    topic_group_parser.add_argument('--input', default='tabs.yaml', help='Input YAML file')
    topic_group_parser.add_argument('--output-dir', default='grouped_by_topic', help='Output directory')
    
    # Open by domain parser
    open_domain_parser = subparsers.add_parser('open-domain', help='Open tabs from a specific domain')
    open_domain_parser.add_argument('--input', default='tabs.yaml', help='Input YAML file')
    open_domain_parser.add_argument('--domain', required=True, help='Domain to open tabs from')
    open_domain_parser.add_argument('--browser', default='chrome', help='Browser to open in')
    
    # Open by topic parser
    open_topic_parser = subparsers.add_parser('open-topic', help='Open tabs related to a specific topic')
    open_topic_parser.add_argument('--input', default='tabs.yaml', help='Input YAML file')
    open_topic_parser.add_argument('--topic', required=True, help='Topic to open tabs for')
    open_topic_parser.add_argument('--browser', default='chrome', help='Browser to open in')
    
    # Open from subfile parser
    open_subfile_parser = subparsers.add_parser('open-subfile', help='Open tabs from a sub YAML file')
    open_subfile_parser.add_argument('--file', required=True, help='Sub YAML file to open')
    open_subfile_parser.add_argument('--browser', default='chrome', help='Browser to open in')
    
    args = parser.parse_args()
    
    if args.action == 'open':
        tabs = load_tabs_from_yaml(args.input)
        open_tabs(tabs, args.browser, args.count)
    elif args.action == 'group-domain':
        tabs = load_tabs_from_yaml(args.input)
        group_by_domain(tabs, args.output_dir)
    elif args.action == 'group-topic':
        tabs = load_tabs_from_yaml(args.input)
        group_by_topic(tabs, args.output_dir)
    elif args.action == 'open-domain':
        tabs = load_tabs_from_yaml(args.input)
        open_by_domain(tabs, args.domain, args.browser)
    elif args.action == 'open-topic':
        tabs = load_tabs_from_yaml(args.input)
        open_by_topic(tabs, args.topic, args.browser)
    elif args.action == 'open-subfile':
        open_from_subfile(args.file, args.browser)