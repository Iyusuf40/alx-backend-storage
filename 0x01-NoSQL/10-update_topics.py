#!/usr/bin/env python3
""" updates a document """


def update_topics(mongo_collection, name, topics):
    """ updates document whose name = name with topics """
    mongo_collection.update_many(
        {"name": name},
        {
            "$set": {
                "topics": topics
            }
        }
    )
