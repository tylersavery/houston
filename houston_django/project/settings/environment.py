import os

import environ

from project import __version__

BASE_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
ENV = environ.Env()

env_path = os.path.join(BASE_DIR, ".env")
if os.path.exists(env_path):
    ENV.read_env(env_path)

ENVIRONMENT = ENV.str("ENVIRONMENT", default="undefined")
VERSION = ".".join((str(value) for value in __version__))
