#!/usr/bin/env python3
""" mod's doc string """


import redis
import requests
import time


def get_page(url: str) -> str:
    """ tracks no of times a url is visited """
    res = requests.get(url)
    r = redis.Redis()
    key = "count:" + url
    content_key = "cont:" + url
    prev_count = r.get(key)
    if prev_count:
        r.incr(key)
        return r.get(content_key)
    else:
        r.setex(key, 10, 1)
        r.setex(content_key, 10, res.text)
    return res.text


if __name__ == "__main__":
    url = "https://flexrecords.cloza.tech/"
    key = "count:" + url
    r = redis.Redis()
    for i in range(10):
        res = get_page(url)
        print(r.get(key))
    time.sleep(10)
    print(r.get(key))
