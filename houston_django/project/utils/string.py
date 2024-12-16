import random
import string


def get_random_string(characters, length):
    return "".join(random.choice(characters) for _ in range(length))


def get_random_slug(length):
    get_random_string(string.ascii_lowercase + string.digits, length)


def truncate_text(text, length=100, ellipsis="..."):
    return (
        text
        if len(text) <= length
        else " ".join(text[: length + 1].split(" ")[0:-1]) + ellipsis
    )


def string_to_bool(val):
    val = val.lower()
    if val in ("y", "yes", "t", "true", "on", "1"):
        return 1
    elif val in ("n", "no", "f", "false", "off", "0"):
        return 0
    else:
        raise ValueError("invalid truth value %r" % (val,))


def split_name(name):
    parts = name.strip().split()

    if not parts:
        first_name = ""
        last_name = ""
    elif len(parts) == 1:
        first_name = parts[0]
        last_name = ""
    else:
        first_name = parts[0]
        last_name = " ".join(parts[1:])

    return first_name, last_name
