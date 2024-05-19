import os


def get_dirname(path):
    return os.path.dirname(path)


def get_basename(path):
    return os.path.basename(path)


def get_filename(path):
    return get_basename(os.path.splitext(path)[0])


def get_extension(path):
    return get_basename(os.path.splitext(path)[1])


def change_extension(path, extension):
    return os.path.join(get_dirname(path), f"{get_filename(path)}.{extension}")
