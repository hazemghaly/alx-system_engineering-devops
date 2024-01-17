#!/usr/bin/python3
"""
a function that queries the Reddit
API and returns the number of subscribers
"""

import requests


def recurse(subreddit, hot_list=[]):
    """a function that queries the Reddit"""
    after = ""
    count = 0
    url = f'https://www.reddit.com/r/{subreddit}/hot/.json'
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"
    }
    params = {
        "after": after,
        "count": count,
        "limit": 100
    }
    if after:
        params['after'] = after
    response = requests.get(
        url, headers=headers, params=params, allow_redirects=False)
    if response.status_code == 404:
        return None
    d = response.json().get("data")
    for c in d.get("children"):
        hot_list.append(c.get("data").get("title"))
        after = d.get('data', {}).get('after')
        if after:
            return recurse(subreddit, hot_list)
        else:
            return hot_list
    else:
        return None
