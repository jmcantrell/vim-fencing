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

As a practical example of usefulness, the example above enables fenced
code support for [commentary.vim][2], allowing you to do this:

![fencing-commentary][3]

I borrowed a small amount of code from a similar plugin,
[vim-context-commentstring][4], to set up the auto-commands.

While it offers similar functionality for altering `commentstring`,
there doesn't appear to be any way to extend that plugin without
editing the original code. Conversely, this plugin avoids built-in
filetype handling, and instead defers the detection to a more general
purpose plugin. This plugin is also more general in the sense that it
allows setting other options. It simply provides a way for the user to
hook into the detection that [context_filetype.vim][1] provides.

## License

Copyright (c) Jeremy Cantrell. Distributed under the same terms as Vim
itself. See `:help license`.

[1]: https://github.com/Shougo/context_filetype.vim
[2]: https://github.com/tpope/vim-commentary
[3]: https://media.giphy.com/media/LOj7sYJsecb9V7OpvM/giphy.gif "commenting fenced code"
[4]: https://github.com/suy/vim-context-commentstring
