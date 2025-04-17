# krahlos dotfiles

## Prerequisites

Add your `GitHub` token to your `$HOME/.netrc` file.

```shell
echo "machine github.com login <username> password <token>" >> $HOME/.netrc
```

## Installation

Then install the `chezmoi` dotfile manager and `init` it with this repository:

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:$GITHUB_USERNAME/dotfiles.git
```

## Configuration

Add the following to the `$HOME/.config/chezmoi/chezmoi.toml` file:

```toml
[data]
    name = "Jon Doe"
    email = "jon.doe@example.org"
    gh_user = "jondoe47"
    workspaces = "/home/jon/workspaces"
    editor = "nvim"
```
