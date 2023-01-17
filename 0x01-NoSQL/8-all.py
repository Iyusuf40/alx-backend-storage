#!/usr/bin/env python3
""" gets the documents in a db collection """


def list_all(mongo_collection):
    """ returns an iterable of documents in a db collection """
    return mongo_collection.find()
