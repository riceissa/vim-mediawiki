# mediawiki.vim

![](https://raw.githubusercontent.com/riceissa/vim-mediawiki/gh-pages/actionshot.gif)

## Installation

This plugin can be installed with the usual plugin managers.

[vim-plug](https://github.com/junegunn/vim-plug):

```vim
Plug 'riceissa/vim-mediawiki'
```

[pathogen](https://github.com/tpope/vim-pathogen):

```bash
cd ~/.vim/bundle
git clone https://github.com/riceissa/vim-mediawiki.git
```

## Omni-completion

If you want omni-completion, add the following autocommand:

```vim
autocmd FileType mediawiki setlocal omnifunc=mediawikicomplete#Complete
```

Currently omni-completion supports the following:

* Ref name completion anywhere. Vim's default keyword completion with `<C-N>`
  and `<C-P>` don't work so well when ref names contain characters like `-`,
  `.`, and `:`. Setting `'iskeyword'` is one way to get around this, but doing
  so changes a lot of other things. So ref name completion deals with all the
  crazy ref names while keeping everything else the same.
* Template name completion if the character before the cursor is `{`.
* Template field name completion if the character before the cursor is `|`.
  Note that currently the "field names" are for [`{{cite web}}`][citeweb] only,
  but in the future I might add support for detecting what template one is in,
  and completing field names for that.

If you want automatic omni-completion after typing `{{` (start of a template)
or `|` (start of a template field), you can add the following:

```vim
autocmd FileType mediawiki inoremap <buffer><expr> <Char-123>
      \ getline(".")[col(".") - 2] == "{" ? "{\<C-X>\<C-O>\<C-P>" : "{"
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

This will allow you to wikilink to Wikipedia's `pagename` by typing
`<C-S>wpagename`. And because of the [pipe trick](https://en.wikipedia.org/wiki/Help:Pipe_trick),
you don't need to type `pagename` a second time following the pipe;
`[[wikipedia:pagename|]]` will be transformed to
`[[wikipedia:pagename|pagename]]` upon saving.

If you repeat ref names a lot, you might want to add the following custom
surround:

```vim
autocmd FileType mediawiki let b:surround_{char2nr('r')} = "<ref name=\"\r\" />"
```

If you've enabled omni-completion, then combined with the ref name surround,
you can type `<C-S>r<C-X><C-O>` to insert a ref, which of course you can map to
some key with `imap` if you find yourself typing that sequence a lot.

## Navigating between files

Vim has the ability to navigate between files in the file system. That means if
you are working on a wiki and have a bunch of pages that link to each other
using MediaWiki's `[[wikilink]]` syntax, you can travel between them using key
combinations like `gf` and `<C-W><C-F>`. (See e.g. `:help gf` and
`:help CTRL-W_CTRL-F`.) But for this to work, you need to set some options:

```vim
" See https://en.wikipedia.org/wiki/Wikipedia:Page_name#Technical_restrictions_and_limitations
" and
" https://en.wikipedia.org/wiki/Wikipedia:Naming_conventions_(technical_restrictions)
autocmd FileType mediawiki setlocal isfname=@,32,48-57,/,.,-,_,+,,,$,%,:,@-@,!,~,=

" Translate spaces to underscores and add a '.mediawiki' extension
autocmd FileType mediawiki setlocal includeexpr=substitute(substitute(v:fname,'\ ','_','g'),'$','.mediawiki','')
```

## TODO

- incorporate features from <https://github.com/chikamichi/mediawiki.vim>, which
  is public domain.

## License

Distributed under the same terms as Vim itself. See `:help license`.

[citeweb]: https://en.wikipedia.org/wiki/Template:Cite_web
