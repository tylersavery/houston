from enum import Enum


def get_enum_values(enum):
    return list(item.value for item in enum)


def enum_has_value(enum, value):
    if not issubclass(enum, Enum):
        raise TypeError()
    return value in get_enum_values(enum)
