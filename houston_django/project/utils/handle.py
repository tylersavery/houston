import itertools
from collections import defaultdict

__all__ = ["handler", "call_handlers"]

registrations = defaultdict(lambda: defaultdict(list))


def handler(*, scope, event_types):
    if not isinstance(event_types, list):
        raise TypeError()

    def decorator(func):
        for event_type in event_types:
            registrations[scope][event_type].append(func)
        return func

    return decorator


def call_handlers(*, scope, event, event_type, **kwargs):
    for handler_func in itertools.chain(registrations[scope][event_type]):
        handler_func(event=event, event_type=event_type, **kwargs)
