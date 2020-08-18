# fencing.vim

Change buffer options depending on the context.

Embedded syntax, also known as fenced code blocks, are common when
editing filetypes like HTML, which can also contain sections of CSS
and JavaScript. This plugin allows you to change buffer options
depending on the filetype of the code beneath the cursor.

The plugin [context_filetype.vim][1], a required dependency, provides
functions that detect the filetype of the syntax under the cursor.
This plugin builds on that work by detecting when the context changes,
and sets options based on the context's filetype. When the current
context is not a fenced code block, the options are restored to the
default values for the main filetype.

## Installation

This plugin requires [context_filetype.vim][1].

Install using your favorite package manager, or use Vim's built-in
package support:

```
mkdir -p ~/.vim/pack/$USER/start
cd ~/.vim/pack/$USER/start
git clone https://github.com/jmcantrell/vim-fencing.git fencing
vim -u NONE -c "helptags fencing/doc" -c q
```

## Usage

Without taking further steps, this plugin will do nothing. In order to
enable it for a particular filetype, the variable `b:fencing_options`
will need to be set to a dictionary with keys corresponding to
filetypes returned by [context_filetype.vim][1]'s
`context_filetype#get()`.

For example, to set the correct `commentstring` for fenced code blocks
within HTML files, you would add the following to a filetype plugin,
usually located at `~/.vim/ftplugin/html.vim`:

```
let b:fencing_options =
    \ {
    \ 'javascript' : { 'commentstring': '//%s' },
    \ 'css' : { 'commentstring': '/*%s*/' }
    \ }
```

Anytime the current context is not one of those filetypes,
`commentstring` will be set to the default value, which is usually
`<!--%s-->`.

Notice that the value for each filetype key is a dictionary, which can
contain multiple options.

## License

Copyright (c) Jeremy Cantrell. Distributed under the same terms as Vim
itself. See `:help license`.

[1]: https://github.com/Shougo/context_filetype.vim
