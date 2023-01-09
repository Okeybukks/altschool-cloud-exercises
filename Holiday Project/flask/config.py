import os

region = os.environ['REGION']
aws_access_key_id =os.environ['AWS_ACCESS_KEY_ID']
aws_secret_access_key = os.environ.get('AWS_SECRET_ACCESS_KEY')

print(aws_secret_access_key)
