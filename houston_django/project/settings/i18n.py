from project.settings.environment import ENV

# Internationalization (i18n)
# https://docs.djangoproject.com/en/3.0/topics/i18n/

LANGUAGES = [("en", "English")]
LANGUAGE_CODE = ENV.str("LANGUAGE_CODE", default="en")
TIME_ZONE = ENV.str("TIME_ZONE", default="UTC")
USE_I18N = True
USE_L10N = True
USE_TZ = True
