call plug#begin('~/.config/plugged')
Plug 'https://github.com/atelierbram/vim-colors_atelier-schemes'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'jez/vim-superman'
Plug 'neovim/nvim-lspconfig'
Plug 'whonore/Coqtail'
call plug#end()

set nocompatible " disable compatibility to old-time vi

"Indent Stuff
set foldmethod=syntax
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smarttab

"Number set up
set number
set colorcolumn=160
set tw=159
autocmd BufWritePre * :%s/\s\+$//e
set hlsearch
set scrolloff=5

"Speed Setup
set ttyfast
set lazyredraw

" Switch windows with CTRL-hjkl
noremap <C-J> <C-W><C-J>
noremap <C-K> <C-W><C-K>
noremap <C-L> <C-W><C-L>
noremap <C-H> <C-W><C-H>

" Close all windows with ZZ
nmap ZZ :xa<CR>

" Switch tabs with F5 and F6
inoremap <F5> <ESC>:tabp<CR>i<right>
inoremap <F6> <ESC>:tabn<CR>i<right>
nnoremap <F5> :tabp<CR>
nnoremap <F6> :tabn<CR>

" Use CTRL-T as a shortcut for make
nnoremap <C-T> :make<CR>

" Get rid of highlighting after stuff
nnoremap <CR> :noh<CR><CR>

set showmatch  " Highlight matching braces

colorscheme Atelier_HeathDark
set cursorline " Highlight current line
:hi CursorLine cterm=underline ctermbg=none ctermfg=none
set nostartofline " Vertical movement preserves horizontal position
:imap jj <Esc>
:imap kk <Esc>
:imap hh <Esc>
:imap lll <Esc>

" -----------------------------Plugins--------------------------------------
" airline
set laststatus=2 " Always show airline
let g:airline_powerline_fonts = 1 " Use fancy arrow font
let g:airline_detect_paste=1 " Show PASTE if in paste mode
let g:airline#extensions#tabline#enabled = 1 " Show airline for tabs too
let g:airline#extensions#branch#enabled = 1

" NERDtree
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1

" vim-gitgutter
let g:airline#extensions#hunks#non_zero_only = 1 " In vim-airline, only display 'hunks' if the diff is non-zero
let g:gitgutter_enabled = 1

set background=dark
set t_Co=256

if &term =~ '^xterm'
  " solid underscore
  let &t_SI .= "\<Esc>[4 q"
  " solid block
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
  " Recent versions of xterm (282 or above) also support
  " 5 -> blinking vertical bar
  " 6 -> solid vertical bar
endif

" Terminal Buffer
hi ActiveTerminal ctermfg=NONE ctermbg=16 guibg=#000000 guifg=NONE

function! TerminalSettings()
  setlocal nonumber
  setlocal winhighlight=Normal:ActiveTerminal
  setlocal notermguicolors
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  normal a
endfunction
augroup terminal
    autocmd!
    autocmd TermOpen * call TerminalSettings()
augroup END

let g:c_syntax_for_h = 1

lua << EOF
local lspconfig = require('lspconfig')


vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✘',
      [vim.diagnostic.severity.WARN] = '⚠',
      [vim.diagnostic.severity.INFO] = 'I',
      [vim.diagnostic.severity.HINT] = 'H',
    },
  },
})

lspconfig.bashls.setup{}
lspconfig.clangd.setup{}
lspconfig.cmake.setup{}
lspconfig.gopls.setup{}
lspconfig.hls.setup{}
lspconfig.ruff.setup{}
lspconfig.rust_analyzer.setup{}
lspconfig.idris2_lsp.setup{}
EOF
