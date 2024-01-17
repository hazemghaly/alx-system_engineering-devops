#!/usr/bin/python3
"""
a function that queries the Reddit
API and returns the number of subscribers
"""

import requests


def number_of_subscribers(subreddit):
    """a function that queries the Reddit"""
    url = f'https://www.reddit.com/r/{subreddit}/about.json'
    user_agent = {'User-Agent': 'api_advanced-project'}
    response = requests.get(url, headers=user_agent, allow_redirects=False)
    if response.status_code == 404:
        return 0
    data = response.json().get("data")
    count = data.get("subscribers")
    return count
