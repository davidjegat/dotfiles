let mapleader=","

" NEOVUNDLE
if has('vim_starting')
  set runtimepath+=/home/djeg/.config/nvim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('/home/djeg/.config/nvim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'rakr/vim-one'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'prettier/vim-prettier', { 'do': 'yarn install' }
NeoBundle 'leafgarland/typescript-vim' " Typescript suport
NeoBundle 'scrooloose/nerdtree' " NERD Tree
NeoBundle 'airblade/vim-gitgutter' " Git gutter
NeoBundle 'Townk/vim-autoclose' " Auto close ()[]{}
NeoBundle 'SirVer/ultisnips' " Snippets
NeoBundle 'godlygeek/tabular.git' "Tabular code portion
NeoBundle 'sjbach/lusty.git'
NeoBundle 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
NeoBundle 'arnaud-lb/vim-php-namespace'
NeoBundle 'qpkorr/vim-bufkill'
NeoBundle 'elmcast/elm-vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'reasonml-editor/vim-reason-plus'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'junegunn/limelight.vim'
NeoBundle 'styled-components/vim-styled-components'
NeoBundle 'Quramy/tsuquyomi'

call neobundle#end()

filetype plugin indent on
syntax on

autocmd QuickFixCmdPost [^l]* cwindow
autocmd QuickFixCmdPost l*    cwindow
autocmd VimEnter        *     cwindow
autocmd VimEnter        *     Goyo

NeoBundleCheck
" END NEOVUNDLE

" Encoding
scriptencoding utf-8
set encoding=utf-8

" General Behavior
set nocompatible                 " Use vim defaults
set history=1000                 " Configure the history max memory
set directory=~/.tmp             " Directory to put swap files
set cursorline                   " Highlight the cursor line
set fillchars=""
set expandtab                    " Converts tabs to spaces
set autoindent                   " Automatically copy indentation from previous line
set smartindent                  " indents one extra level according to the current syntax
set tabstop=2                    " Indentation size
set shiftwidth=2                 " Indentation size for spaces tabulation
set list
set listchars=trail:‧,tab:▹∙,nbsp:ⅹ
set ls=2                         " Always shos the status line
set ruler                        " Show the cursor position
set notitle                      " Don't show title in the console title bar
set novisualbell                 " Don't use the visual bell
set showmatch                    " Show matching ()[]{}
set nonumber                       " Show line number
set clipboard+=unnamedplus       " Allow copy/past from graĥic clipboard
set incsearch                    " Incremental search
set hlsearch                     " Highlight the search
set ignorecase                   " Case insensitive search
set wildmenu                     " Better completion
set wildmode=list:longest        " BASH style completion
set scrolloff=5                  " at least 5 lines of context when moving cursor
set sidescrolloff=5              " and 5 columns of contet
set backspace=indent,eol,start   " Improve backspacing
set background=dark
set modifiable
set hidden
set rtp+=~/.fzf
set nowrap
set backup
set writebackup
set formatoptions+=or
set backupdir=/tmp
set backupcopy=yes

" Color Scheme
colorscheme molokai
set t_Co=256
hi Normal          guifg=#F8F8F2 guibg=#1C1C1C
hi Normal ctermbg=234
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=232 guibg=#2c2d27
highlight CursorColumn ctermbg=234 guibg=#2c2d27
highlight CursorLine ctermbg=233 guibg=#2c2d27
highlight LineNr ctermbg=234 guibg=#2c2d27
highlight Visual ctermbg=233

" Elm vim
let g:elm_format_autosave=0
let g:elm_setup_keybindings=1

" Tag Configuration
au FileType php set tags=php-src.tags,php-vendor.tags
au FileType javascript set tags=js-lib.tags,js-src.tags,js-modules.tags
au FileType typescript set tags=ts-lib.tags,ts-typings.tags,ts-modules.tags,ts-src.tags
au FileType python set tags=python.tags
au FileType ls set comments+=n:##

" Focus mode
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  highlight Visual ctermbg=233
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  hi Normal ctermbg=234
  highlight Visual ctermbg=233
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:goyo_width=120


" Ctrlp Configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:8,results:8'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" if executable('ag')
"   if filereadable('.agignore')
"       let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"   else
"       let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"   endif
" let g:ctrlp_use_caching = 0
" endif
"
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v([\/]\.(git|hg|svn))|([\/]vendor)|([\/]node_modules)|([\/]compiled)|([\/]dist)|([\/]app/lib)|([\/]bower_components)|([\/]doc)|([\/]jspm_packages)$',
  \ 'file': '\v\.(exe|png|jpeg|jpg|ico|svg)',
  \ }

" Airline configuration
let g:airline_powerline_fonts=0
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#tabline#fnamemod=':t'
let g:airline#extensions#tabline#fnamecollapse=0
let g:airline_section_c='%t'
let g:airline_section_y=''
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='jellybeans'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0

" Mapping
nmap <Leader>en :set number<CR>
nmap <Leader>dn :set nonumber<CR>
nmap <C-l> w
nmap <C-h> b
nmap <C-j> 4j
nmap <C-k> 4k
vmap <C-l> w
vmap <C-h> b
vmap <C-j> 4j
vmap <C-k> 4k
map <silent> <C-b> :CtrlPBuffer<CR>
nmap <Leader>a gg<S-v><S-g><CR>
vmap <Silent><Leader>y "yy <Bar> :call system('xclip', @y)<CR>
nmap <leader>p "+p<CR>
nmap <Leader><C-c> :!rm -rf ~/.vim/tmp/*<CR>
nmap <Leader>b <Leader>lb
nmap <Leader>ll :bn<CR>
nmap <Leader>hh :bp<CR>
nmap <Leader>q :BD<CR>
nmap <Leader>f <Leader>lr
nmap <leader>r :redraw!<cr>
nmap <silent> <leader>/ :let @/=""<cr>
nmap <leader>x :NERDTreeToggle<CR>
nmap <Leader>nf :NERDTreeFind<CR>
map <Leader>eg :GitGutterToggle<CR>
vmap <Leader>: :Tabularize /:<CR>
vmap <Leader>; :Tabularize /::<CR>
vmap <Leader>/ :Tabularize /:\zs<CR>
vmap <Leader>= :Tabularize /=<CR>
vmap <Leader>> :Tabularize /=><CR>
vmap <Leader>$ :Tabularize /\$/l1r0<CR>
vmap <Leader>\| :Tabularize /\|<CR>
nmap <Leader>a gg<S-v><S-g><CR>
nmap <silent> <Leader>j "zyiw:exe ":tj ".@z.""<CR>
nmap <silent> <Leader>J "zyiw:exe ":ptj ".@z.""<CR>
nmap <Leader>v :source /home/djeg/.config/nvim/init.vim<cr>
imap <Leader>u <C-O>:call PhpInsertUse()<CR>
nmap <Leader>u :call PhpInsertUse()<CR>
imap <Leader>e <C-O>:call PhpExpandClass()<CR>
nmap <Leader>e :call PhpExpandClass()<CR>
nmap <silent> <Leader>n :bnext<CR>
nmap <silent> <Leader>p :bprevious<CR>

" Create a directory when not exists
au BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))
function! <SID>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call system('mkdir -p '.shellescape(a:directory))
    endif
endfunction

au BufNewFile,BufRead *.twig set ft=htmljinja
au BufRead,BufNewFile *.ejs set filetype=html
au BufRead,BufNewFile *.ejs set syntax=underscore_template
au BufNewFile,BufRead *.hsc set ft=haskell
au BufNewFile,BufRead *.dart set ft=dart
au BufNewFile,BufRead *md set ft=markdown
au BufNewFile,BufRead *.ts set ft=typescript
au BufNewFile,BufRead *.tsx set ft=typescript
au BufNewFile,BufRead *.coffee set filetype=coffee
au BufNewFile,BufRead *.reason set filetype=reason
au BufNewFile,BufRead *.mjs set filetype=typescript
au BufNewFile,BufRead *.js set filetype=typescript
au BufNewFile,BufRead *.jsx set filetype=typescript
au BufNewFile,BufRead *.gql set filetype=graphql

" Strip trailing whitespace
function! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  if line("'Z") != line(".")
    echo "Stripped whitespace\n"
  endif
  normal `Z
endfunction
map <silent> <F2> :call StripTrailingWhitespace()<CR>
map! <silent> <F2> :call StripTrailingWhitespace()<CR>


" UltiSnips
let g:UltiSnipsExpandTrigger="<Leader><Tab>"
let g:UltiSnipsJumpForwardTrigger="<Leader><Tab>"
let g:UltiSnipsJumpBackwardTrigger="<Leader><S-Tab>"

" NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Tsu configuration
let g:tsuquyomi_disable_default_mappings = 1
let g:tsuquyomi_auto_open = 0

" Custom Tab Or Complete
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-p>"
  else
    return "\<Tab>"
  endif
endfunction

imap <Tab> <C-R>=Tab_Or_Complete()<CR>

" Custom Grep Command
if executable('ag')
    " Note we extract the column as well as the file and line number
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c%m
endif

" Limelight configuration
let g:limelight_paragraph_span = 1
