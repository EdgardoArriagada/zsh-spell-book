"Set this file as local options so it override any plugin
filetype plugin indent on

set tabstop=2 softtabstop=2 "Amount of spaces when pressing tab
set shiftwidth=2 "when indenting with '>', use 2 spaces width
set expandtab "On pressing tab, insert 2 spaces
set smartindent
set relativenumber "Relative numbers to current cursor
set number "Show line numbers
set hlsearch "Enable search highlighting.
set incsearch "Highlight as you search (use :noh to clear)
set laststatus=2 "Always display the status bar.
set scrolloff=8 "Start scolling x lines before hitting top/bottom
set colorcolumn=80,120
set signcolumn=yes

highlight ColorColumn ctermbg=235 guibg=#2c2d27

"Fix vim colors if tmux default-terminal is 'screen-256color'
set background=dark

set path+=** "Better search when :e
set wildmenu "Allow tab in menu when searching for a file

" Mappings
nnoremap Y y$
nnoremap S vg_hs
vnoremap Z "xy'>"xp
vnoremap q g_

"Search and replace matches for highlighted text
vnoremap <C-r> "hy:.,$s/<C-r>h//gc<left><left><left>
"Move highlighted text down 'Shift j'
vnoremap J :m '>+1<CR>gv=gv
"Move highlighted text up 'Shift k'
vnoremap K :m '<-2<CR>gv=gv
"
set pastetoggle=<F2>

"Custom commands
command Q execute ":q"
command W execute ":w"
command Pjson execute ":%!python3 -m json.tool"
command Snn execute ":set nonu nornu"
command Srr execute ":set nu rnu"

" if tmux default-terminal is 'screen-256color'
" this will prevent <Ctrl+Arrow> form deleting
" random amount of lines under the cursor
" (tmux will send xterm-style keys when its xterm-keys option is on)
if &term =~ '^screen'
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

