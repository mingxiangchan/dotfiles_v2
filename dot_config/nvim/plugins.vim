let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.vim/plugged')
" Basics
Plug 'scrooloose/nerdcommenter' "comment lines/blocks
Plug 'tpope/vim-surround' "handle brackets, html tags

"Niceties
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'sickill/vim-pasta' "paste from clipboard and respect indentation
Plug 'Yggdroot/indentLine' "show indent markers
Plug 'simnalamburt/vim-mundo' "UI for navigating vim's branching undo history
Plug 'godlygeek/tabular' "align things with 2 sides, e.g. JSON colons
Plug 'junegunn/vim-peekaboo' "show registers when press @ or ctrl+r
Plug 'honza/vim-snippets' "snippets for all languages
Plug 'alok/notational-fzf-vim'
Plug 'plasticboy/vim-markdown'
Plug 'dkarter/bullets.vim' "handle numbered/unumbered lists in md
Plug 'alvan/vim-closetag'

" Fuzzy Search
"Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'junegunn/fzf.vim'

" Color and StatusLine
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kaicataldo/material.vim'
Plug 'cormacrelf/vim-colors-github'

"General Language Utilities (syntax highlighting, autoformatting)
Plug 'sheerun/vim-polyglot'

"JS
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'

"Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'marlonfan/coc-phpls', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'iamcco/coc-angular', {'do': 'yarn install --frozen-lockfile && yarn build'}
Plug 'liuchengxu/vista.vim'
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}

call plug#end()
