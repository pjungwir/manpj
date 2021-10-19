$ irb
> require 'aws/s3'
> AWS::S3::Base.establish_connection!(
    :access_key_id     => 'abc',
    :secret_access_key => '123'
  )
> b = AWS::S3::Bucket.find('electnext')


curl http://169.254.169.254/latest/meta-data/iam/security-credentials/staging-db

MFA with the CLI
================

https://github.com/broamski/aws-mfa

```
pip install aws-mfa
```

Add `aws_mfa_device = ....` to your `~/.aws/credentials`.

Then say:

AWS_PROFILE=foo aws-mfa --long-term-suffix=none --short-term-suffix=mfa
AWS_PROFILE=foo-mfa aws ec2 describe-instances --region us-west-2
