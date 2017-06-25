# mediawiki.vim

## Installation

Install with the usual plugin managers, e.g. with
[vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'riceissa/vim-mediawiki'
```

## Omni-completion

If you want omni-completion, add the following autocommand:

```vim
autocmd FileType mediawiki setlocal omnifunc=mediawikicomplete#Complete
```

If you want automatic omni-completion after typing `{{` (start of a template)
or `|` (start of a template field), you can add the following:

```vim
" Run in exe because the open curly brace messes up syntax highlighting
exe 'autocmd FileType mediawiki inoremap <buffer><expr> { '
      \ . 'getline(".")[col(".") - 2] == "{" ? "{\<C-X>\<C-O>\<C-P>" : "{"'
" A bar at the start of a line is likely to be the start of a table separator,
" so only start the completion if it is not the first character on the line
autocmd FileType mediawiki inoremap <buffer><expr> <bar> col(".") == 1 ?
      \ "<bar>" : "<bar>\<C-X>\<C-O>\<C-P>"
```

## Surround

If you do a lot of work on a self-hosted wiki, then you might want to install
[surround.vim](https://github.com/tpope/vim-surround) and add the following
custom surround:

```vim
autocmd FileType mediawiki let b:surround_{char2nr('w')} = "[[wikipedia:\r|]]"
```

If you repeat ref names a lot, you might want to add the following custom
surround:

```vim
autocmd FileType mediawiki let b:surround_{char2nr('r')} = "<ref name=\"\r\" />"
```

If you've enabled omni-completion, then combined with the ref name surround,
you can type `<C-S>r<C-X><C-O>` to insert a ref.

## TODO

- incorporate features from <https://github.com/chikamichi/mediawiki.vim>, which
  is public domain.

## License

Distributed under the same terms as Vim itself. See `:help license`.
