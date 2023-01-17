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
    status_check = col.count_documents({"method": "GET", "path": "/status"})
    # print(f"{docs_count} logs")
    # print(f"Methods:")
    # print(f"    method GET: {get_count}")
    # print(f"    method POST: {post_count}")
    # print(f"    method PUT: {put_count}")
    # print(f"    method PATCH: {patch_count}")
    # print(f"    method DELETE: {del_count}")
    # print(f"{status_check} status check")
    print("{} logs".format(docs_count))
    print("Methods:")
    print("    method GET: {}".format(get_count))
    print("    method POST: {}".format(post_count))
    print("    method PUT: {}".format(put_count))
    print("    method PATCH: {}".format(patch_count))
    print("    method DELETE: {}".format(del_count))
    print("{} status check".format(status_check))
    client.close()


if __name__ == "__main__":
    main()
