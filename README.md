# fencing.vim

Change buffer options depending on the context.

For a small example of the potential, with Vim properly configured for
HTML, and a commenter plugin like [commentary.vim][commentary-plugin], this plugin
will allow you to do this:

![fencing-commentary][example]

## Installation

This plugin requires [context_filetype.vim][context-plugin].

Install using your favorite package manager, or use Vim's built-in package support:

```sh
mkdir -p ~/.vim/pack/default/start
git clone $REPO_URL ~/.vim/pack/default/start/fencing
vim -c "helptags fencing/doc" -c q
```

## Usage

See `:help fencing`.

## License

Copyright (c) Jeremy Cantrell. Distributed under the same terms as Vim itself.
See `:help license`.

[commentary-plugin]: https://github.com/tpope/vim-commentary
[context-plugin]: https://github.com/Shougo/context_filetype.vim
[example]: https://media.giphy.com/media/LOj7sYJsecb9V7OpvM/giphy.gif "commenting fenced code"
