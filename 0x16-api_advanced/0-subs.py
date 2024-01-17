#!/usr/bin/python3
"""
a function that queries the Reddit
API and returns the number of subscribers
"""

import requests


def number_of_subscribers(subreddit):
    """a function that queries the Reddit"""
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    headers = {'User-Agent': 'YourAppName/1.0'}
    try:
        response = requests.get(url, headers=headers, allow_redirects=False)
        response.raise_for_status()  # errors check
        if response.is_redirect:
            return 0
        try:
            data = response.json()
        except ValueError as e:
            return 0
        if 'data' in data and 'subscribers' in data['data']:
            count = data['data']['subscribers']
            return count
        else:
            return 0
    except Exception as e:
        return (0)
