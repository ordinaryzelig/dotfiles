## Setup

* Clone as `~/.dotfiles`
* symlink each file in symlink/ to `~/.` (e.g. "cd & ln -s .dotfiles/symlink/gitconfig .gitconfig")
* VIM bundles:
  * Install pathogen: https://github.com/tpope/vim-pathogen.
  * Clone bundles and update to latest: `git submodule init & git submodule update --remote`.

## Add a new VIM bundle

- `git submodule add git@github.com:chriskempson/base16-vim.git symlink/vim/bundle`
- `git submodule update` to checkout?
- Commit.

## Remove VIM bundle

- `git submodule deinit symlink/vim/bundle/[name]`
- `git rm .git/modules/.vim/bundle/[name]`
- Commit.

## Ruby

- Install ruby via homebrew.
- Install chruby via homebrew.
- Symlink rubies installed via homebrew into ~/.rubies. Start new console and check if `chruby` lists them correctly.
