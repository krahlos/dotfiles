# krahlos dotfiles

## Prerequisites

Add your `GitHub` token to your `$HOME/.netrc` file.

```shell
echo "machine github.com login <username> password <token>" >> $HOME/.netrc
```

## Installation

Then install the `chezmoi` dotfile manager and `init` it with this repository:

```shell
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:krahlos/dotfiles.git
```

## Configuration

Add the following to the `$HOME/.config/chezmoi/chezmoi.toml` file:

```toml
[data]
    name = "Marco Krahl"
    email = "marco-krahl@web.de"
    gh_user = "krahlos"
    workspaces = "~/workspaces"
    editor = "code"
```
