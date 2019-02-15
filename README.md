
This modules creates an S3 backed website.

*Note* This is different than our [S3 CDN Module](https://github.com/MITLibraries/tf-mod-cdn-s3/)

Bucket access policy documents should be created and attached outside of this module. [AWS only supports a single bucket policy](https://github.com/hashicorp/terraform/issues/10543).

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cors\_allowed\_headers | List of allowed headers | list | `<list>` | no |
| cors\_allowed\_methods | List of allowed methods (e.g. ` GET, PUT, POST, DELETE, HEAD`) | list | `<list>` | no |
| cors\_allowed\_origins | List of allowed origins (e.g. ` example.com, test.com`) | list | `<list>` | no |
| cors\_expose\_headers | List of expose header in the response | list | `<list>` | no |
| cors\_max\_age\_seconds | Time in seconds that browser can cache the response | string | `"3600"` | no |
| error\_document | An absolute path to the document to return in case of a 4XX error | string | `"404.html"` | no |
| force\_destroy | Delete all objects from the bucket so that the bucket can be destroyed without error (e.g. `true` or `false`) | string | `""` | no |
| hostname | Name of website bucket in `fqdn` format (e.g. `test.example.com`). IMPORTANT! Do not add trailing dot (`.`) | string | n/a | yes |
| index\_document | Amazon S3 returns this index document when requests are made to the root domain or any of the subfolders | string | `"index.html"` | no |
| name | The Name of the application or solution  (e.g. `bastion` or `portal`) | string | n/a | yes |
| parent\_zone\_id | ID of the hosted zone to contain the record | string | `""` | no |
| redirect\_all\_requests\_to | A hostname to redirect all website requests for this bucket to. If this is set `index_document` will be ignored. | string | `""` | no |
| region | AWS region this bucket should reside in | string | `""` | no |
| routing\_rules | A json array containing routing rules describing redirect behavior and when redirects are applied | string | `""` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')`) | map | `<map>` | no |
| versioning\_enabled | State of versioning (e.g. `true` or `false`) | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| hostname | Bucket hostname |
| s3\_bucket\_arn | Name of of website bucket |
| s3\_bucket\_domain\_name | Name of of website bucket |
| s3\_bucket\_hosted\_zone\_id | The Route 53 Hosted Zone ID for this bucket's region |
| s3\_bucket\_name | DNS record of website bucket |
| s3\_bucket\_website\_domain | The domain of the website endpoint |
| s3\_bucket\_website\_endpoint | The website endpoint URL |
