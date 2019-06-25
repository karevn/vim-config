" Vundle {{{
" Загружаем Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle'

" NERDTree: sidebar file tree {{{
Plugin 'scrooloose/nerdtree'
let g:NERDTreeMapChangeRoot =  "`"

nmap <Leader>] :NERDTreeTabsToggle<CR>
nnoremap <Space>c :NERDTreeCWD<CR>
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=0
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.pyc$', '\~$']
let NERDTreeShowLineNumbers = 1
let NERDTreeWinSize = 35

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()
" }}}
Plugin 'Xuyuanp/nerdtree-git-plugin'
" airline: Advanced status line {{{
Plugin 'bling/vim-airline'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0 "change 0 to 1 if you have a powerline font
set laststatus=2
set t_Co=256
"}}}
" CamelCase motions {{{
Plugin 'bkad/CamelCaseMotion'
map <Space>w <Plug>CamelCaseMotion_w
map <Space>b <Plug>CamelCaseMotion_b
map <Space>e <Plug>CamelCaseMotion_e
" }}}
" Fugitive: Git client {{{
Plugin 'tpope/vim-fugitive'
"}}}
" vim-gitgutter: Git status column at the left {{{
Plugin 'airblade/vim-gitgutter'
"}}}
" Editorconfig {{{
Plugin 'editorconfig/editorconfig-vim'
" }}}

"Plugin 'kristijanhusak/vim-multiple-cursors'
" Comment / uncomment stuff
Plugin 'joom/vim-commentary'
" Align code columns
Plugin 'vim-scripts/Align'
" Highlight matching brackets / parenthesis

" Snippets
Plugin 'valloric/MatchTagAlways'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Insert parenthesis, brackets, so on in pairs
Plugin 'jiangmiao/auto-pairs'
Plugin 'jistr/vim-nerdtree-tabs'
" Windoswap {{{
Plugin 'wesQ3/vim-windowswap'
let g:windowswap_map_keys = 0 "prevent default bindings
"}}}
Plugin 'tpope/vim-surround'
" ctrlp: Fast file search {{{
Plugin 'kien/ctrlp.vim'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
"}}}
Plugin 'ervandew/supertab'
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'gcmt/wildfire.vim'
Plugin 'Yggdroot/indentLine'

" Syntax support {{{
Plugin 'pangloss/vim-javascript'
Plugin 'ap/vim-css-color'
Plugin 'miripiruni/CSScomb-for-Vim'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'leafgarland/typescript-vim'
Plugin 'flowtype/vim-flow'
au BufRead,BufNewFile *.tsx set filetype=javascript
" au BufRead,BufNewFile *.ts set filetype=javascript
au BufRead,BufNewFile *.ts set filetype=typescript
" syntastic: syntax highlight {{{
Plugin 'vim-syntastic/syntastic'

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
" }}}
Plugin 'wavded/vim-stylus'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chr4/nginx.vim'
"}}}
Plugin 'prettier/vim-prettier'

Plugin 'Galooshi/vim-import-js'
Plugin 'ternjs/tern_for_vim'
Plugin 'Quramy/tsuquyomi'
" Color scheme {{{
"Plugin 'joshdick/onedark.vim'
Plugin 'drewtempelmeyer/palenight.vim'
"}}}
call vundle#end()            " required
" }}}



" General {{{

set ttyfast
set lazyredraw
set background=dark
colorscheme palenight
set nocompatible
filetype off
set foldmethod=marker
set linebreak

set number

syntax on
set mouse=a

filetype plugin indent on

set encoding=utf-8
set fileencodings=utf-8

set autoindent
set smartindent
set cindent
set background=dark
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set wildignore=*.pyc
set ignorecase
set smartcase
set hlsearch
set incsearch
set shiftround
set history=1000
set undolevels=1000
set noswapfile
set nobackup
set number
set linespace=3

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" }}}

" Some Useful Key Mappings {{{
let mapleader="\""
"Split swap
nmap <S-Tab> :CtrlPBuffer<CR>
nmap <Leader>f :CtrlPLine<CR>
nnoremap <silent> <Leader>sw :call WindowSwap#EasyWindowSwap()<CR>
nmap <Leader>` :call WindowSwap#EasyWindowSwap()<CR><Leader>[:call WindowSwap#EasyWindowSwap()<CR>

"for unhighlighing the selections
nmap <Space>x :let @/=''<CR>

"split switch
nnoremap <Leader>[ <C-W>w

"System clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"Keep the cursor in the same place after yank
vmap y ygv<Esc>


"New Tab
nmap <Leader>n :tabnew<CR>


"Keep selection after indent
vnoremap > ><CR>gv
vnoremap < <<CR>gv



let g:CommandTWildIgnore=&wildignore . ",*/node_modules,*/.git,*/dist"

" True colors

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif
let g:palenight_terminal_italics=1
