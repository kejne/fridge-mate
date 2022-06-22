### Request certificate

The certificate needs to be handled in a different stack than the rest, since it requires some manual steps with your DNS provider.

## Usage

First, run terraform in this folder to request the certs.

```
terraform init
terraform plan --var-file config.tfvars
```

The output will tell you what kind of CNAME updates you need to do at your DNS provider in order for the validation to be completed.
NOTE! The certificate will be issued in us-east-1, since this is needed for CloudFront.

Verify later if the certificate was successfully issued.