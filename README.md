# Sourcegraph LSIF Uploader GitHub Action

This action uploads generated LSIF data to a Sourcegraph instance.

## Usage

The following input scan be set.

| name           | default                 | description |
| -------------- | ----------------------- | ----------- |
| file           | data.lsif               | The LSIF dump file to upload. |
| endpoint       | https://sourcegraph.com | The Sourcegraph instance to target. |
| access_token   |                         | The access token to use to authenticate to the Sourcegraph instance. |
| upload_token   |                         | The upload token to use. Required only if `lsifEnforceAuth` setting is enabled. |
| ignore_failure | true                    | Exit with code 0, even when the upload fails (prevents a red X from showing up in GitHub pull request checks). |

The following is a complete example that uses the [Go indexer action](https://github.com/sourcegraph/lsif-go-action) to generate data to upload. Put this in `.github/workflows/lsif.yaml`.

```
name: LSIF
on:
  - push
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: Generate LSIF Data
        uses: sourcegraph/lsif-go-action@0.1.0-alpha
        with:
          file: data.lsif
          verbose: 'true'
      - name: Upload LSIF data
        uses: sourcegraph/lsif-upload-action@0.1.0-alpha
        with:
          file: data.lsif
          access_token: ${{ secrets.lsif_access_token }}
```
