colorscheme base16-tomorrow-night
syntax enable " always want syntax on

set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab
set autoindent " autoindent to same level as previous line. 
"set paste " this makes insert mode 'paste' all the time...

set number " show line numbers. I like it, I don't care what you think
set showcmd " show last command entered

filetype indent on " load filetype-specific indent files

set showmatch " highlight matching [{()}]

set incsearch " testing this. search as characters are entered
set hlsearch " highlight matches. :noh is helpful here for when you are done searching.
