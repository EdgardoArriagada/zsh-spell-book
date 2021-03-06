call plug#begin('~/.config/nvim/plugged')

  Plug 'michaeljsmith/vim-indent-object'

  if exists('g:vscode')
    Plug 'asvetliakov/vim-easymotion'
  else
    Plug 'ThePrimeagen/vim-be-good', { 'on': 'VimBeGood' }
    Plug 'fatih/vim-go', { 'tag': '*' }
    Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    Plug 'mileszs/ack.vim'
    Plug 'tpope/vim-fugitive'

    " Extra tooling
    Plug 'vim-airline/vim-airline'
    Plug 'airblade/vim-gitgutter'
    Plug 'preservim/nerdtree' , { 'on': 'NERDTreeToggle' }

    " Behavior
    Plug 'psliwka/vim-smoothie'
    Plug 'tpope/vim-surround'
    Plug 'tomtom/tcomment_vim'
    Plug 'easymotion/vim-easymotion'

    " Looks
    Plug 'gruvbox-community/gruvbox'

    " Lang Support
    Plug 'rust-lang/rust.vim' , { 'for': 'rust' }
    Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
    Plug 'peitalin/vim-jsx-typescript' , { 'for': 'typescript' }

    " telescope fuzzy finder
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
  endif
call plug#end()

