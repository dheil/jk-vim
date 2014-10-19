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
Plugin 'sk1418/last256'
"autocmd BufWinEnter * call matchadd("Important","!Important!")
"autocmd BufWinEnter * call matchadd("MK1","!MARK1")
"autocmd BufWinEnter * call matchadd("MK2","!MARK2")
"autocmd BufWinEnter * call matchadd("MK3","!MARK3")
"autocmd BufWinEnter * call matchadd("FIXME","FIXME")

Plugin 'croaky/vim-colors-github'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'nanotech/jellybeans.vim'
Plugin 'w0ng/vim-hybrid'

"" Define bundles via Github repos
"Plugin 'christoomey/vim-run-interactive'
"" Add this to your vimrc to provide a shortcut
"nnoremap <leader>ri :RunInInteractiveShell<space>

" snipmate
"
Plugin 'msanders/snipmate.vim'

Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/ctags.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/tComment'

if filereadable(expand("~/.vimrc.bundles.local"))
  source ~/.vimrc.bundles.local
endif

call vundle#end()
filetype on
