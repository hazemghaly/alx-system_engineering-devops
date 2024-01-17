#!/usr/bin/python3
"""
a function that queries the Reddit
API and returns the number of subscribers
"""

import requests


def number_of_subscribers(subreddit):
    """a function that queries the Reddit"""
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"
    }
    response = requests.get(url, headers=headers, allow_redirects=False)
    if response.status_code == 404:
        return 0
    data = response.json()
    if 'data' in data and 'subscribers' in data['data']:
        count = data['data']['subscribers']
        return count
    else:
        return 0
