" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

filetype plugin on
syntax on
colorscheme SweetCandy
set mouse=r
set cursorline
set number
set relativenumber
set background="dark"

" python PEP 8 standards
set textwidth=79 " lines longer than 79 columns will be broken
set shiftwidth=4 " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4 " a hard TAB displays as 4 columns
set expandtab " insert spaces when hitting TABS
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround  " round indent to multiple of 'shiftwidth'
set autoindent " align the new line indent with the previous line
