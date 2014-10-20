if &compatible
  set nocompatible
end

filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" NERDTree - https://github.com/scrooloose/nerdtree
Plugin 'scrooloose/nerdtree'
let NERDTreeCaseSensitiveSort = 1
map <F9> :NERDTreeToggle <CR>

" open NERDTree if no file is given
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close Vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" HTML Editing
Plugin 'gregsexton/MatchTag'

" Color Themes
"Plugin 'sk1418/last256'
"Plugin 'croaky/vim-colors-github'
"Plugin 'chriskempson/vim-tomorrow-theme'
"Plugin 'nanotech/jellybeans.vim'
"Plugin 'w0ng/vim-hybrid'
"Plugin 'tomasr/molokai'

"------------------------------------------------------------------------------
" Tagbar
" on Mac: brew install ctag
"Plugin 'majutsushi/tagbar'
"nmap <F8> :TagbarToggle<CR>

"------------------------------------------------------------------------------
" Airline {{{
" lean & mean status/tabline for vim that's light as air

Plugin 'bling/vim-airline'

set noshowmode

" find themes at: https://github.com/bling/vim-airline/wiki/Screenshots
" let g:airline_theme='powerlineish'
" let g:airline_theme='solarized'
" let g:airline_theme='tomorrow' " works best for hybrid theme
let g:airline_theme='hybrid' " works best for hybrid theme
let g:airline_enable_branch=1
let g:airline_powerline_fonts=1
let g:airline_detect_whitespace = 1
let g:airline#extensions#hunks#non_zero_only = 1

let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_min_count = 2

" }}}

"------------------------------------------------------------------------------
" snipmate
"
"Plugin 'msanders/snipmate.vim'

"------------------------------------------------------------------------------
" Syntastic - Syntax checking hacks for vim {{{

"Plugin 'scrooloose/syntastic'

" }}}

"------------------------------------------------------------------------------

" CoffeeScript support for vim
Plugin 'kchmck/vim-coffee-script'

"Plugin 'kien/ctrlp.vim'
"Plugin 'pbrisbin/vim-mkdir'
"
"Plugin 'slim-template/vim-slim'
"Plugin 'thoughtbot/vim-rspec'
"Plugin 'tpope/vim-bundler'
"Plugin 'tpope/vim-endwise'
"Plugin 'tpope/vim-eunuch'

" fugitive.vim: a Git wrapper so awesome, it should be illegal
" http://www.vim.org/scripts/script.php?script_id=2975
Plugin 'tpope/vim-fugitive'

"Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-repeat'

" surround.vim: quoting/parenthesizing made simple
" http://www.vim.org/scripts/script.php?script_id=1697
"Plugin 'tpope/vim-surround'

Plugin 'scrooloose/nerdcommenter'

"Plugin 'vim-ruby/vim-ruby'
""Plugin 'vim-scripts/ctags.vim'
"Plugin 'vim-scripts/matchit.zip'
"Plugin 'vim-scripts/tComment'

if filereadable(expand("bundles.local.vim"))
  source bundles.local.vim
endif

call vundle#end()
filetype on
