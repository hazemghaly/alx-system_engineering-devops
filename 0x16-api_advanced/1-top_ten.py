#!/usr/bin/python3
"""
a function that queries the Reddit
API and returns the number of subscribers
"""

import requests


def top_ten(subreddit):
    """a function that queries the Reddit"""
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {
        "User-Agent": "linux:0x16.api.advanced:v1.0.0 (by /u/bdov_)"
    }
    params = {
        "limit": 10
    }
    response = requests.get(
        url, headers=headers, params=params, allow_redirects=False)
    if response.status_code == 404:
        print("None")
        return
    data = response.json()
    po = data.get("data").get("children")
    for p in po:
        title = p.get("data").get("title")
        print(title)
