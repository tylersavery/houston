import pprint
from functools import wraps
from timeit import default_timer as timer

from django.db import connection, reset_queries


def analyze_queries(f):
    @wraps(f)
    def wrapper(*args, **kwargs):
        reset_queries()

        start = timer()
        result = f(*args, **kwargs)
        end = timer()

        print()
        print(f"{f.__qualname__}")
        print(f"-" * 20)
        pprint.pprint(connection.queries)
        print(f"Queries: count={len(connection.queries)}")
        print(f"Execution: {float(format(end - start, '.5f'))}s")
        print()

        reset_queries()
        return result

    return wrapper
