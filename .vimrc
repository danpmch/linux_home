
" automatic indentation based on file type
filetype plugin indent on

" show line numbers
set number

" enable syntax highlighting
syntax enable

" enable spaces instead of tabs
set expandtab
set shiftwidth=2
set tabstop=2

" search options
set incsearch
set ignorecase
set smartcase

" format bottom status bar
set statusline=%F\ %m%r%=TYPE=%Y\ %-19(%l,%v\ %4p%%%)
set laststatus=2

" set a sweet style
set t_Co=256
colorscheme 256-grayvim

" Jump to last cursor position on opening file, unless it's invalid or in an
" event handler
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \  exe "normal g`\"" |
  \ endif

" enable/disable spell check
" <Leader> == \
map <Leader>se :setlocal spell spelllang=en_us<CR>
map <Leader>sn :setlocal nospell<CR>

" reflow paragraphs
nnoremap Q gqap

" make the command Y do what's expected given A, C, D, and P
map Y y$

" switch between .h and .cpp files when editing c++
function! SwitchSourceHeader()
  if( expand( "%:e" ) == "cpp" )
    find %:t:r.h
  else
    find %:t:r.cpp
  endif
endfunction
nmap ,s :call SwitchSourceHeader()<CR>

" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.

function! InsertTabWrapper()
  let col = col( '.' ) - 1
  if !col || getline( '.' )[ col - 1 ] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>
