#!/usr/bin/env python3
""" mod's doc string """


import redis
import requests
import time


def get_page(url: str) -> str:
    """ tracks no of times a url is visited """
    r = redis.Redis()
    key = "count:" + url
    content_key = "cont:" + url
    cached_page = r.get(content_key)
    r.incr(key)
    if cached_page:
        return cached_page.decode("utf-8")
    else:
        res = requests.get(url)
        r.setex(content_key, 10, res.text)
    return res.text


if __name__ == "__main__":
    url = "https://flexrecords.cloza.tech/"
    key = "count:" + url
    r = redis.Redis()
    for i in range(10):
        res = get_page(url)
        print(r.get(key))
        print(res[:20])
    time.sleep(10)
    print(r.get(key))
