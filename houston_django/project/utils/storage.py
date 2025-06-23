import boto3
from botocore.errorfactory import ClientError
from django.conf import settings
from botocore.exceptions import NoCredentialsError, PartialCredentialsError

client = boto3.client(
    "s3",
    endpoint_url=(
        f"https://{settings.CLOUDFLARE_ACCOUNT_ID}.r2.cloudflarestorage.com"
        if settings.CLOUDFLARE_ACCOUNT_ID
        else None
    ),
    aws_access_key_id=settings.AWS_ACCESS_KEY_ID,
    aws_secret_access_key=settings.AWS_SECRET_ACCESS_KEY,
    region_name=settings.AWS_DEFAULT_REGION,
)


def get_presigned_url(method, key, content_type=None, expires=3600, **kwargs):

    params = {
        "Bucket": settings.AWS_STORAGE_BUCKET_NAME,
        "Key": key,
    }

    if content_type:
        params["ContentType"] = content_type

    try:
        response = client.generate_presigned_url(
            method,
            Params={
                **params,
                **kwargs,
            },
            ExpiresIn=expires,
        )

        print(response)

    except NoCredentialsError:
        print("Credentials not available")
        return None
    except PartialCredentialsError:
        print("Incomplete credentials")
        return None

    return response


def get_presigned_post(key, fields=None, conditions=None, expires=3600, **kwargs):
    kwargs["Bucket"] = settings.AWS_STORAGE_BUCKET_NAME
    kwargs["Key"] = key
    kwargs["ExpiresIn"] = expires

    if fields:
        kwargs["Fields"] = fields

    if conditions:
        kwargs["Conditions"] = conditions

    return client.generate_presigned_post(**kwargs)


def get_head_object(key):
    try:
        return client.head_object(Bucket=settings.AWS_STORAGE_BUCKET_NAME, Key=key)
    except ClientError:
        return None


def check_object_exists(key):
    return bool(get_head_object(key))


def delete_object(key):
    return client.delete_object(Bucket=settings.AWS_STORAGE_BUCKET_NAME, Key=key)
