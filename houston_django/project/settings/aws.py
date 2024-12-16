from project.settings.environment import ENV

# Amazon Web Services
# https://boto3.amazonaws.com/v1/documentation/api/latest/

AWS_ACCESS_KEY_ID = ENV.str("AWS_ACCESS_KEY_ID")
AWS_DEFAULT_REGION = ENV.str("AWS_DEFAULT_REGION")
AWS_SECRET_ACCESS_KEY = ENV.str("AWS_SECRET_ACCESS_KEY")
AWS_STORAGE_BUCKET_NAME = ENV.str("AWS_STORAGE_BUCKET_NAME")
AWS_DEFAULT_ACL = "public-read"
AWS_S3_FILE_OVERWRITE = True
AWS_S3_SIGNATURE_VERSION = "s3v4"
AWS_QUERYSTRING_AUTH = False
