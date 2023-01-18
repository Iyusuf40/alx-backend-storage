#!/usr/bin/env python3
""" mod's doc string """


import string
import random
import redis
from typing import List, Set, Dict, Tuple, Any, Union, Callable


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

    def get(
            self, key: str, fn: Union[Callable, None] = None
    ) -> Union[str, bytes, int, float, None]:
        """ a wrapper to redis.get to return python object """
        if fn:
            res = fn(self._redis.get(key))
            return res
        return self._redis.get(key)

    def get_int(
        self, key: str, fn: Union[Callable, None] = int
    ) -> Union[str, bytes, int, float, None]:
        """ sets self.get fn parameter with int func """
        return self.get(key, int)

    def get_str(
        self, key: str, fn: Union[Callable, None] = str
    ) -> Union[str, bytes, int, float, None]:
        """ sets self.get fn parameter with str func """
        return self.get(key, str)
