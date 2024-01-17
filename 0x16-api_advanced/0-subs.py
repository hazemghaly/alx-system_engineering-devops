#!/usr/bin/python3
"""
a function that queries the Reddit
API and returns the number of subscribers
"""

import requests
import sys
import time


def number_of_subscribers(subreddit):
    """a function that queries the Reddit"""
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"
    }
    response = requests.get(url, headers=headers, allow_redirects=False)
    response.raise_for_status()
    time.sleep(2)
    if response.status_code == 404:
        return 0
    try:
        data = response.json()
    except ValueError as e:
        return 0
    count = data.get('data', {}).get('subscribers', 0)
    return count
