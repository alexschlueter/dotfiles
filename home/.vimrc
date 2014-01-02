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
set timeoutlen=200 " sometimes I want to insert jj 
