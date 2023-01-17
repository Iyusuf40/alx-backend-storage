#!/usr/bin/env python3
""" fuction in module searches a document """


def schools_by_topic(mongo_collection, topic):
    """ serches mongo_collection for schools with topic """
    query = mongo_collection.find(
        {
            "topics": topic
        }
    )
    return query
