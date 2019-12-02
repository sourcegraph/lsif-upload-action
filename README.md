# Sourcegraph LSIF Uploader GitHub Action

This action uploads generated LSIF data to a Sourcegraph instance.

## Usage

The following input scan be set.

| name                     | default                   | description |
| ------------------------ | ------------------------- | ----------- |
| file                     | data.lsif                 | The LSIF dump file to upload. |
| endpoint                 | `https://sourcegraph.com` | The Sourcegraph instance to target. |
| github_token             |                           | A GitHub access token with `repo` or `public_repo` scope (necessary when uploading to Sourcegraph.com, or any Sourcegraph instance with `lsifEnforceAuth` set to true). The example below uses `secrets.GITHUB_TOKEN`, which is automatically populated by GitHub. To use a different token (such as one with only `public_repo` scope), [create a repository secret](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets) and refer to that. |
| ignore_failure           | true                      | Exit with code 0, even when the upload fails (prevents a red X from showing up in GitHub pull request checks). |

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
        uses: sourcegraph/lsif-go-action@master
        with:
          verbose: "true"
      - name: Upload LSIF data
        uses: sourcegraph/lsif-upload-action@master
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          endpoint: https://sourcegraph.com
```
