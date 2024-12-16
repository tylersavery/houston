def batch_queryset(queryset, n=None):
    queryset = queryset.order_by("pk")
    start = 0
    while True:
        if not queryset.filter(pk__gt=start).exists():
            break

        try:
            end = queryset.filter(pk__gt=start).values_list("pk", flat=True)[n - 1]
        except IndexError:
            end = queryset.values_list("pk", flat=True).last()

        yield queryset.filter(pk__gt=start).filter(pk__lte=end)
        start = end
