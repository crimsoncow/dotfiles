set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-sensible'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'msanders/snipmate.vim'
" Remember to delete default snippets in bundles/snipmate.vim/snippets.
Bundle 'honza/vim-snippets'
Bundle 'scrooloose/nerdtree'
Bundle 'jonathanfilip/vim-lucius'
" Extra compilation steps required, see docs.
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'python.vim'
Bundle 'tmhedberg/SimpylFold'
Bundle 'flazz/vim-colorschemes'
Bundle 'hdima/python-syntax'
Bundle 'vim-scripts/SWIG-syntax'

filetype on

set background=dark
" colors darkzen
colors kellys
if has("gui_running")
    colors railscasts
    set guifont=ProggyCleanTT\ 12
    set guicursor+=a:blinkon0

    " No toolbar.
    set guioptions-=T
    " No scrollbars.
    set guioptions-=l
    set guioptions-=r
    set guioptions-=R
    set guioptions-=L

    if !exists('g:first_run')
        set columns=135
        set lines=50
    else
        let g:first_run=0
    endif
endif

" Assorted.
set hidden
set history=1000
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set textwidth=0
set nowrap
"set cursorline
set showmatch
set wildmode=longest,list,full
set wildignore=*.o,*~,*.pyc,*.log
set tags=./tags;
set colorcolumn=80
if has("gui_running")
    highlight ColorColumn guibg=LightSlateGray
else
    highlight ColorColumn ctermbg=cyan ctermfg=black
endif
runtime macros/matchit.vim

" Code folding.
set foldmethod=syntax
set foldlevelstart=99
set foldminlines=2

" Ctrl-P customizations.
let g:ctrlp_match_window_bottom=0
let g:ctrlp_match_window_reversed=1
map <F2> :CtrlPBuffer<CR>
map <F3> :CtrlPTag<CR>
"let g:ctrlp_custom_ignore = {
"    \ 'dir': '',
"    \ 'file': '\.png$\|\.gif$',
"\ }

" NERDTree customizations.
let NERDTreeIgnore = ['\.pyc$']
map <C-N> :NERDTreeToggle<CR>

" Keymaps.
map <C-J> :%s//gc<Left><Left><Left>
vmap <C-J> :s//gc<Left><Left><Left>
map <C-K> :%s/<C-R><C-W>//gc<Left><Left><Left>
imap \\ <Esc>

" Custom file types.
au BufNewFile,BufRead *.proto setf c
au BufNewFile,BufRead *.proto set sw=2 sts=2 ts=2
au BufNewFile,BufRead *.cc set sw=2 sts=2 ts=2
au BufNewFile,BufRead *.h set sw=2 sts=2 ts=2
au BufNewFile,BufRead *.cpp set sw=2 sts=2 ts=2
au BufNewFile,BufRead *.py set sw=4 sts=4 ts=4
au BufNewFile,BufRead *.py setf python
au BufNewFile,BufRead *.js set sw=4 sts=4 ts=4

