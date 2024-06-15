colorscheme base16-tomorrow-night
syntax enable " always want syntax on

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
set autoindent " autoindent to same level as previous line. 
filetype indent on " load filetype-specific indent files
filetype plugin on " load filetype-specific indent files

set number " show line numbers.
set showcmd " show last command entered

set ruler
set showmatch " highlight matching [{()}]

set incsearch " testing this. search as characters are entered
set hlsearch " highlight matches. :noh is helpful here for when you are done searching.
highlight LineNr ctermbg=NONE ctermfg=White
set listchars=tab:→\ ,space:·,nbsp:␣,trail:•,eol:¶,precedes:«,extends:»

