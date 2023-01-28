# treeless-checkout-action

Basic script action to check out a repository with `--filter=tree:0`.

## Inputs

| Input      | Description                        | Default                    | Required? |
|------------|------------------------------------|----------------------------|-----------|
| ref        | Ref to checkout (SHA, branch, tag) | `${{ github.ref }}`        | no        |
| repository | Repository name (foo/bar)          | `${{ github.repository }}` | no        |
| server-url | GitHub server url                  | `${{ github.server_url }}` | no        |
