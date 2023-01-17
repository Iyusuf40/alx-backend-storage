#!/usr/bin/env python3
""" extract from nginx logs """


from pymongo import MongoClient


def main():
    """ main functuon """
    client = MongoClient('mongodb://127.0.0.1:27017')
    col = client.logs.nginx
    docs_count = col.count_documents({})
    get_count = col.count_documents({"method": "GET"})
    post_count = col.count_documents({"method": "POST"})
    put_count = col.count_documents({"method": "PUT"})
    patch_count = col.count_documents({"method": "PATCH"})
    del_count = col.count_documents({"method": "DELETE"})
    status_check = col.count_documents({"method": "GET", "path": "/status"})
    print("{} logs".format(docs_count))
    print("Methods:")

    lst = [
        ("GET", get_count),
        ("POST", post_count),
        ("PUT", put_count),
        ("PATCH", patch_count),
        ("DELETE", del_count)
    ]

    for method, count in lst:
        print(f"\tmethod {method}: {count}")

    print("{} status check".format(status_check))

    client.close()


if __name__ == "__main__":
    main()
