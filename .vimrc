"enable plugin
execute pathogen#infect()
"filetype plugin on

syntax on
filetype plugin indent on

"no launch nerdtree if file opened
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" launch nerdtree
"autocmd vimenter * NERDTree

"close NerdTree if only window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"start nerdtree by ctrl n
map <C-n> :NERDTreeToggle<CR>

" dont comment automatically
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"use space instead tab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" set autoindentation
set autoindent

"no newline at the end of file
:set nofixendofline

" set number line
"set number
noremap <F2> :set number!<CR>
inoremap <F2> <C-o>:set number!<CR>
cnoremap <F2> <C-c>:set number!<CR>

"map the change of tabs
map <C-Left> <Esc>:tabprev<CR>
map <C-Right> <Esc>:tabnext<CR>
map <C-Up> <Esc>:tabnew
map <C-Down> <Esc>:q

"buffer https://stackoverflow.com/questions/102384/using-vims-tabs-like-buffers
set hidden

"support mouse
"set mouse=a

"tabline.vim   https://vimawesome.com/plugin/tabline-vim
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
let g:tablineclosebutton=1

" nerdtree-git
let g:NERDTreeShowIgnoredStatus = 1
"set shell=sh
let NERDTreeMapOpenInTab='<ENTER>'

" enable matchit jump with % to html div
runtime macros/matchit.vim

" nerdcommenter change leader
let mapleader=","
set timeout timeoutlen=1500


"display not visible chars and hide on F3
"set list
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»
" hide on F3 : https://stackoverflow.com/questions/12534313/vim-set-list-as-a-toggle-in-vimrc
noremap <F3> :set list! <CR>
inoremap <F3> <C-o>:set list! <CR>
cnoremap <F3> <C-c>:set list! <CR>


"netrw
let g:netrw_banner = 1
let g:netrw_browse_split = 3
let g:netrw_altv = 1
let g:netrw_winsize = 25


"vim-vue https://vimawesome.com/plugin/vim-vue-fearless
autocmd FileType vue syntax sync fromstart
let g:vue_disable_pre_processors=1
" https://github.com/posva/vim-vue#how-can-i-use-nerdcommenter-in-vue-files
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction
