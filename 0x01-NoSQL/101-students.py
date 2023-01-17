#!/usr/bin/env python3
""" extract from nginx logs """


def top_students(mongo_collection):
    """ returns all students sorted by average score """
    pipeline = [
        {"$unwind": "$topics"},
        {"$group": {"_id": "$_id", "averageScore": {"$avg": "$topics.score"},
                    "name":  {"$first": "$name"}}},
        {"$sort": {"averageScore": -1}}
    ]
    res = mongo_collection.aggregate(pipeline)
    return list(res)


if __name__ == "__main__":
    from pymongo import MongoClient
    import pprint
    client = MongoClient('mongodb://127.0.0.1:27017')
    students_collection = client.my_db.students
    pprint.pprint(top_students(students_collection))
