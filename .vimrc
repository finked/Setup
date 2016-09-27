call plug#begin('~/.vim/plugged')

" Package to show register with " and @
Plug 'junegunn/vim-peekaboo'

" Package for autocompletion
Plug 'https://github.com/Shougo/neocomplete.vim'

" Package for code snippet inclusion
Plug 'Shougo/neosnippet' 

" Package for easy commenting and uncommenting
Plug 'scrooloose/nerdcommenter' 

" Go Language packages"
Plug 'fatih/vim-go'

call plug#end()

set nocompatible

syntax on

filetype plugin indent on

set tabstop=4       " show existing tab with 4 spaces width
set hidden          "Buffer is hidden and not closed
set nowrap          "Don't wrap lines
set backspace=indent,eol,start "Allow backspacing over everything in insert mode
set expandtab       " On pressing tab, insert 4 spaces
set autoindent
set copyindent
set shiftwidth=4
set shiftround      " when indenting with '>', use 4 spaces width
set showmatch       "set shoe matching parenthesis
set ignorecase      "ignore cas when searching
set smartcase       "ignore case if search pattern is all lowercase,
                    "case-sensitive otherwise
set smarttab        "insert tabs on the start of a line according to
                    "shiftwidth, not tabstop
set hlsearch        "highlight search terms
set incsearch       "show search matches as you type
set number          "Always show line numbers
set relativenumber  "Always show relative numbers
set nobackup        "Don't make a backup        
set noswapfile      "Don't save swap files  

set autowrite       "Save file when building it

set pastetoggle=<F2>

"Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Faster Go Error navigation"
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
    let l:file = expand('%')
    if l:file =~# '^\f\+_test\.go$'
        call go#cmd#Test(0, 1)
    elseif l:file =~# '^\f\+\.go$'
        call go#cmd#Build(0)
    endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

let g:go_list_type = "quickfix" "Only use one type of error list

"???"
nmap <silent> ,/ :nohlsearch<CR>