def batch_iterable(iterable, n=None):
    length = len(iterable)
    if n is None:
        n = length

    for index in range(0, length, n):
        yield iterable[index : min(index + n, length)]
