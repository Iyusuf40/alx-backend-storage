#!/usr/bin/env python3
""" inserts a document in a collection """


def insert_school(mongo_collection, **kwargs):
    """ inserts kwargs into mongo_collectuon """
    obj = mongo_collection.insert_one(kwargs)
    return obj.inserted_id
