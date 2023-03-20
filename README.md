# treeless-checkout-action

Basic script action to check out a repository with `--filter=tree:0`.

## Inputs

| Input      | Description                                                   | Default                    | Required? |
|------------|---------------------------------------------------------------|----------------------------|-----------|
| ref        | Ref to checkout (SHA, branch, tag)                            | `${{ github.ref }}`        | no        |
| repository | Repository name (foo/bar)                                     | `${{ github.repository }}` | no        |
| server-url | GitHub server url                                             | `${{ github.server_url }}` | no        |
| path       | Relative path under $GITHUB_WORKSPACE to place the repository |                            | no        |

## Example Usage

This action is used in [freddylist/antivoid-packages](https://github.com/freddylist/antivoid-packages) [CI](https://github.com/freddylist/antivoid-packages/blob/master/.github/workflows/build-pkglist.yml).

```yaml
name: Treeless Checkout Example
on:
  pull_request:

jobs:
  checkout:
    name: Checkout Repo - Treeless style
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: freddylist/treeless-checkout-action@v1
      - name: Show repo contents
        runs: ls -lR
```
