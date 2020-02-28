# Sourcegraph LSIF Uploader GitHub Action

This action uploads generated LSIF data to a Sourcegraph instance.

## Usage

The following inputs can be set.

| name     | default                 | description |
| -------- | ----------------------- | ----------- |
| file     | dump.lsif               | The LSIF dump file to upload. |
| root     | ''                      | The root of the LSIF dump. |
| endpoint | https://sourcegraph.com | The Sourcegraph instance to target. |

The following is a complete example that uses the [Go indexer action](https://github.com/sourcegraph/lsif-go-action) to generate data to upload. Put this in `.github/workflows/lsif.yaml`.

```
name: LSIF
on:
  - push
jobs:
  index:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - name: Generate LSIF data
        uses: sourcegraph/lsif-go-action@master
      - name: Upload LSIF data
        uses: sourcegraph/lsif-upload-action@master
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```
