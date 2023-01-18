#!/usr/bin/env python3
""" mod's doc string """


import string
import random
import redis
from typing import List, Set, Dict, Tuple, Any, Union


def create_rand_key() -> str:
    """ returns a random alphanumeric string of len = 9 """
    key = "".join(random.choices(string.printable[:62], k=9))
    return key


class Cache:
    """ cache class """

    def __init__(self) -> None:
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """ stores data using a rand key """
        key = create_rand_key()
        self._redis.set(key, data)
        return key
