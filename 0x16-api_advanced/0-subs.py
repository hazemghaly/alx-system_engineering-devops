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
    user_agent = {'User-Agent': 'api_advanced-project'}
    response = requests.get(url, headers=user_agent, allow_redirects=False)
    response.raise_for_status()
    time.sleep(2)
    if response.status_code == 404:
        return 0
    data = response.json()
    count = data.get('data', {}).get('subscribers', 0)
    return count
