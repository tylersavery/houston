from project.settings.environment import ENV

ALLOWED_HOSTS = ENV.list("ALLOWED_HOSTS", default=["*"], cast=str)
MAINTENANCE_MODE = ENV.bool("MAINTENANCE_MODE", default=False)
