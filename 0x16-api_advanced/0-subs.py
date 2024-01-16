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
        response = requests.get(url, headers=headers)
        #response.raise_for_status()  # errors check
        if response.is_redirect:
            return None
        data = response.json()
        count = data['data']['subscribers']
        return count
    except Exception as e:
        return (0)
