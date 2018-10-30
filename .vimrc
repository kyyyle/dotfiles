" basic options
set nocompatible
set spell                       " Turn on spelling
set spelllang=en_us             " Set the spelling language
set ttyfast                     " Indicates a fast terminal connection
set backspace=indent,eol,start  " Allow backspaceing over autoindent, line breaks, starts of insert
set shortmess+=I                " No welcome screen
set shortmess+=A                " No .swp warning
set backupcopy=yes              " So webpack watch consistently detects file changes


" visual things
set termguicolors
set cursorline                  " configure cursor line
hi CursorLine cterm=NONE ctermbg=253
"hi CursorLine cterm=NONE ctermbg=236
"set background&
"set background=dark
set background=light
" colorscheme monokai-soda

set t_Co=256
set number
set ruler
set showcmd                 " Show (partial) command in the last line of the screen.
if exists('+colorcolumn')
    set colorcolumn=+1        " Highlight the column after `textwidth`
endif
syntax enable
set autoread


" tabs
set expandtab                   " Use spaces when tab key is pressed
set tabstop=4                   " Tab is four spaces
set shiftwidth=4                " Reindent is four spaces
set softtabstop=4               " When hit <tab> use four columns
set shiftround
set autoindent
filetype plugin indent on   " Rely on file plugins to handle indenting
"set smartindent

inoremap X^H# X<BS>X^H#
set cinkeys-=0X^H#
set indentkeys-=0X^H#

" search
set smartcase
set hlsearch

" Mouse can resize windows
set mouse=a
set ttymouse=xterm2

noremap Q <nop>



" execute pathogen#infect()

call plug#begin('~/.vim/plugged')

" Make tab handle all completions
Plug 'ervandew/supertab'

" Syntastic: Code linting errors
Plug 'scrooloose/syntastic', { 'for': ['python', 'javascript', 'css'] }

" Fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'

" Fancy status line
Plug 'vim-airline/vim-airline'

" Split navigation that works with tmux
Plug 'christoomey/vim-tmux-navigator'

" Change brackets and quotes
Plug 'tpope/vim-surround'
" Make vim-surround repeatable with .
Plug 'tpope/vim-repeat'

" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive'

" Automatically detect indentation
Plug 'tpope/vim-sleuth'

" Only show CursorLine in current window
" Plug 'CursorLineCurrentWindow'

" Find the class/method based on cursor position
"Plug 'vim-scripts/pythonhelper'
"Plug 'pythonhelper'

" JSX syntax highlighting
" Plug 'mxw/vim-jsx'

" 'Vastly improved Javascript indentation and syntax support in Vim'
Plug 'pangloss/vim-javascript'

" Syntax file and other settings for TypeScript.
Plug 'leafgarland/typescript-vim'

" Plug 'ianks/vim-tsx'
" Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'


"Plug 'HerringtonDarkholme/yats.vim'

" Solarize color scheme
Plug 'altercation/vim-colors-solarized'

" Monokai color scheme
Plug 'sickill/vim-monokai'
" Plug 'crusoexia/vim-monokai'
Plug 'dunckr/vim-monokai-soda'

" Plug 'mitermayer/vim-prettier', {
"             \ 'do': 'npm install',
"             \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss'] }
"  
call plug#end()

" vim-jsx-pretty config
let g:vim_jsx_pretty_enable_jsx_highlight = 1
let g:vim_jsx_pretty_colorful_config = 1

" Prettier: Config
" let g:prettier#config#print_width = 110
" let g:prettier#config#tab_width = 4
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#trailing_comma = 'none'
 
" Prettier: disable autoformat only files with @format
" let g:prettier#autoformat = 0
" Prettier: run prettier on files before writing out the vim buffer to files with these extensions
" autocmd BufWritePre *.js,*.jsx,*.css,*.scss,*.less Prettier


" set filetypes as typescript.jsx
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx


" NeoBundle plugin installs

set runtimepath+=~/.vim/bundle/neobundle.vim/,~/.vim/bundle/typescript-vim/,~/.vim/bundle/yats.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" Better CursorLine
" doesn't work
" NeoBundle 'miyakogi/conoline.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" Conoline
"let g:conoline_auto_enable = 1
"let g:conoline_use_colorscheme_default_normal=1
"let g:conoline_use_colorscheme_default_insert=1


" ctrl-p
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|sass-cache|pip_download_cache|wheel_cache)$',
    \ 'file': '\v\.(png|jpg|jpeg|gif|DS_Store|pyc)$',
    \ 'link': '',
    \ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_clear_cache_on_exit = 0
" Wait to update results (This should fix the fact that backspace is so slow)
let g:ctrlp_lazy_update = 1


" If we have The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif


" Navigate between windows
nnoremap <left> <C-w>h
nnoremap <right> <C-w>l
nnoremap <up> <C-w>k
nnoremap <down> <C-w>j


" Typescript autocomplete
if !exists("g:ycm_semantic_triggers")
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
