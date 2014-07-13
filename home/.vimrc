if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
NeoBundle 'Shougo/vimproc', {
 \ 'build' : {
 \     'windows' : 'make -f make_mingw32.mak',
 \     'cygwin' : 'make -f make_cygwin.mak',
 \     'mac' : 'make -f make_mac.mak',
 \     'unix' : 'make -f make_unix.mak',
 \    },
 \ }

" My Bundles here:
" Refer to |:NeoBundle-examples|.
"
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'dag/vim2hs'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'eagletmt/neco-ghc'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'AzizLight/vis.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'klen/python-mode'
NeoBundle 'zhaocai/GoldenView.Vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'justinmk/vim-sneak'
NeoBundle 'kchmck/vim-coffee-script'

NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'

NeoBundle 'cecutil'

filetype plugin indent on     " Required!
"
" Brief help
" :NeoBundleList          - list configured bundles
" :NeoBundleInstall(!)    - install(update) bundles
" :NeoBundleClean(!)      - confirm(or auto-approve) removal of unused bundles

" Installation check.
NeoBundleCheck

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" solarized theme
syntax enable
set background=dark
colorscheme solarized

set number " line numbers

" neocomplete
let g:neocomplete#enable_at_startup = 1

" Use netrw as explorer similar to NERDTree
"
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv         = 1
let g:netrw_banner       = 0
let g:netrw_keepdir      = 0
" Default to tree mode
let g:netrw_liststyle    = 3

" Change directory to the current buffer when opening files.
set autochdir

" Open netrw on startup if no argument was specified
autocmd VimEnter * if !argc() | call ToggleVExplorer() | endif

" resize current buffer by +/- 5
nnoremap <left> :vertical resize -5<cr>
nnoremap <down> :resize +5<cr>
nnoremap <up> :resize -5<cr>
nnoremap <right> :vertical resize +5<cr>

inoremap jj <Esc> " distance to escape key too high
" less delay when I actually want to insert jj
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=200
    au InsertLeave * set timeoutlen=1000
augroup END

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab "tabs

" python-mode
let g:pymode = 1
let g:pymode_options = 1
let g:pymode_indent = 1
let g:pymode_folding = 1
let g:pymode_lint_on_fly = 1
let g:pymode_rope_lookup_project = 0 
let g:pymode_python = 'python3'

let mapleader = ' '

" powerline
" let $PYTHONPATH="/usr/lib/python3.3/site-packages"
set laststatus=2

" GoldenView
let g:goldenview__enable_default_mapping = 0
" 1. split to tiled windows
nmap <silent> <C-L>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane
" and toggle back
nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
" nmap <silent> <C-N>  <Plug>GoldenViewNext
" nmap <silent> <C-P>  <Plug>GoldenViewPrevious <-- FIXME: overwrites Ctrl-P

" size of a hard tabstop
set tabstop=4

" size of an "indent"
set shiftwidth=4

" a combination of spaces and tabs are used to simulate tab stops at a width
" other than the (hard)tabstop
set softtabstop=4

" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab
