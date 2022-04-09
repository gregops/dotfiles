# PRC (pull request comments)

This script fetches specific user's Bitbucket pull request comments, in the
order they were added, and outputs the combined text on stdout. Only contents
of code blocks comments are fetched.

This helps legibility in cases where long comments created by automation (e.g.
Atlantis) are automatically split up by Bitbucket and sorted in the web UI in
descending order.

## Install

Download the [`prc`](https://github.com/gregops/dotfiles/raw/master/bin/prc) script and add to your `PATH`. Or clone and symlink as desired.

You must also have [`jq`](https://stedolan.github.io/jq/) available in `PATH`.

## Configure

1. Set the `PRC_BB_REPO_URI` environment variable to the HTTPS or SSH
remote of a Bitbucket repo.

    Examples:

    * `PRC_BB_REPO_URI="https://<host>/bitbucket/scm/<project>/<repo>.git"`
    * `PRC_BB_REPO_URI="ssh://git@<host>:7999/<project>/<repo>.git"`

1. Set the `PRC_BB_FILTER_USER` environment variable to the Bitbucket user whose comments you wish to fetch. Defaults to `atlantis`.

1. Create a Bitbucket access token (a personal, read-only, expiring token can be created at `https://<host>/bitbucket/plugins/servlet/access-tokens/manage`).

    Store it in one of the following locations:

    1. `PRC_BB_TOKEN` environment variable.
    1. `~/.prc-bb-token` file (use `PRC_BB_TOKEN_FILE` env var to specify another file).
    1. 1Password with CLI installed, and set `PRC_BB_TOKEN_OP_VAULT=<1p-vault-name>` and `PRC_BB_TOKEN_OP_ITEM=<1p-item-name>` (you can optionally set `PRC_BB_TOKEN_OP_FIELD=<1p-item-field>`, which defaults to 'password').

## Use

```
$ prc

Use:

  prc <pr-number>  # Output code block comments for <pr-number>
  prc -l           # List PRs (sort by last activity)
  prc -L           # List PRs (sort by creation time / PR number)
```
