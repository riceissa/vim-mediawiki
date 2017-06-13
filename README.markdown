# mediawiki.vim

Install with the usual plugin managers, e.g. with
[vim-plug](https://github.com/junegunn/vim-plug):

    Plug 'riceissa/vim-mediawiki'

If you want omni-completion, add the following autocommand:

    autocmd FileType mediawiki setlocal omnifunc=mediawikicomplete#Complete

If you do a lot of work on a self-hosted wiki, then you might want to install
[surround.vim](https://github.com/tpope/vim-surround) and add the following
custom surround:

    autocmd FileType mediawiki let b:surround_{char2nr('w')} = "[[wikipedia:\r|]]"

## TODO

- incorporate features from <https://github.com/chikamichi/mediawiki.vim>, which
  is public domain.

## License

Distributed under the same terms as Vim itself. See `:help license`.
