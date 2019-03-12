colorscheme base16-tomorrow-night
syntax enable " always want syntax on

set tabstop=2 " number of visual spaces per TAB. 2 because YAML
set shiftwidth=2
set softtabstop=2
set smarttab
set noexpandtab " TABS are spaces. TAB equals shortcut for $tabstop number of spaces
set autoindent " autoindent to same level as previous line. 
"set paste " this makes insert mode 'paste' all the time...

set number " show line numbers. I like it, I don't care what you think
set showcmd " show last command entered

filetype indent on " load filetype-specific indent files

set showmatch " highlight matching [{()}]

set incsearch " testing this. search as characters are entered
set hlsearch " highlight matches. :noh is helpful here for when you are done searching.
