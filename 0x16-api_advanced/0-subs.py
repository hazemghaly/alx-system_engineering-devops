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
        response.raise_for_status()  # errors check
        if response.status_code == 302:
            return (0)
        data = response.json()
        if 'data' in data and 'subscribers' in data['data']:
            count = data['data']['subscribers']
            return count
        else:
            return 0
    except requests.exceptions.RequestException as e:
        return (0)
