# tf-mod-s3-website

*NOTE*: This module is slated for deletion! DO NOT USE!
*NOTE*: This module is still in use by the mitlib-terraform/apps/libstaff code, so it can't be archived or deleted yet

This modules creates an S3 backed website.

*Note* This is different than our [S3 CDN Module](https://github.com/MITLibraries/tf-mod-cdn-s3/)

Bucket access policy documents should be created and attached outside of this module. [AWS only supports a single bucket policy](https://github.com/hashicorp/terraform/issues/10543).

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_label"></a> [label](#module\_label) | github.com/mitlibraries/tf-mod-name | 0.13 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.domain_hostname](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_s3_bucket.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cors_allowed_headers"></a> [cors\_allowed\_headers](#input\_cors\_allowed\_headers) | List of allowed headers | `list(string)` | ```[ "*" ]``` | no |
| <a name="input_cors_allowed_methods"></a> [cors\_allowed\_methods](#input\_cors\_allowed\_methods) | List of allowed methods (e.g. ` GET, PUT, POST, DELETE, HEAD`) | `list(string)` | ```[ "GET" ]``` | no |
| <a name="input_cors_allowed_origins"></a> [cors\_allowed\_origins](#input\_cors\_allowed\_origins) | List of allowed origins (e.g. ` example.com, test.com`) | `list(string)` | ```[ "*" ]``` | no |
| <a name="input_cors_expose_headers"></a> [cors\_expose\_headers](#input\_cors\_expose\_headers) | List of expose header in the response | `list(string)` | ```[ "ETag" ]``` | no |
| <a name="input_cors_max_age_seconds"></a> [cors\_max\_age\_seconds](#input\_cors\_max\_age\_seconds) | Time in seconds that browser can cache the response | `string` | `"3600"` | no |
| <a name="input_error_document"></a> [error\_document](#input\_error\_document) | An absolute path to the document to return in case of a 4XX error | `string` | `"404.html"` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Delete all objects from the bucket so that the bucket can be destroyed without error (e.g. `true` or `false`) | `bool` | `"false"` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | Name of website bucket in `fqdn` format (e.g. `test.example.com`). IMPORTANT! Do not add trailing dot (`.`) | `string` | n/a | yes |
| <a name="input_index_document"></a> [index\_document](#input\_index\_document) | Amazon S3 returns this index document when requests are made to the root domain or any of the subfolders | `string` | `"index.html"` | no |
| <a name="input_name"></a> [name](#input\_name) | The Name of the application or solution  (e.g. `bastion` or `portal`) | `string` | n/a | yes |
| <a name="input_parent_zone_id"></a> [parent\_zone\_id](#input\_parent\_zone\_id) | ID of the hosted zone to contain the record | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region this bucket should reside in | `string` | `""` | no |
| <a name="input_routing_rules"></a> [routing\_rules](#input\_routing\_rules) | A json array containing routing rules describing redirect behavior and when redirects are applied | `string` | `""` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags (e.g. `map('BusinessUnit','XYZ')`) | `map(string)` | `{}` | no |
| <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled) | State of versioning (e.g. `true` or `false`) | `bool` | `"true"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hostname"></a> [hostname](#output\_hostname) | Bucket hostname |
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | Name of of website bucket |
| <a name="output_s3_bucket_domain_name"></a> [s3\_bucket\_domain\_name](#output\_s3\_bucket\_domain\_name) | Name of of website bucket |
| <a name="output_s3_bucket_hosted_zone_id"></a> [s3\_bucket\_hosted\_zone\_id](#output\_s3\_bucket\_hosted\_zone\_id) | The Route 53 Hosted Zone ID for this bucket's region |
| <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name) | DNS record of website bucket |
| <a name="output_s3_bucket_website_domain"></a> [s3\_bucket\_website\_domain](#output\_s3\_bucket\_website\_domain) | The domain of the website endpoint |
| <a name="output_s3_bucket_website_endpoint"></a> [s3\_bucket\_website\_endpoint](#output\_s3\_bucket\_website\_endpoint) | The website endpoint URL |
