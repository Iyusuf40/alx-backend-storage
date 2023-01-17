#!/usr/bin/env python3
""" extract from nginx logs """


from pymongo import MongoClient


def main():
    """ main functuon """
    client = MongoClient()
    col = client.logs.nginx
    docs_count = col.count_documents({})
    get_count = col.count_documents({"method": "GET"})
    post_count = col.count_documents({"method": "POST"})
    put_count = col.count_documents({"method": "PUT"})
    patch_count = col.count_documents({"method": "PATCH"})
    del_count = col.count_documents({"method": "DELETE"})
    status_check = col.count_documents({"path": "/status"})
    print(f"{docs_count} logs")
    print(f"Methods:")
    print(f"\tmethod GET: {get_count}")
    print(f"\tmethod POST: {post_count}")
    print(f"\tmethod PUT: {put_count}")
    print(f"\tmethod PATCH: {patch_count}")
    print(f"\tmethod DELETE: {del_count}")
    print(f"{status_check} status check")
    client.close()


if __name__ == "__main__":
    main()
