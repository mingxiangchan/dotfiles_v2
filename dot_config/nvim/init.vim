scriptencoding utf-8
source ~/.config/nvim/plugins.vim

" ============================================================================ "
" ColorScheme
" ============================================================================ "
if (has("termguicolors"))
  set termguicolors
endif

if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

let g:material_terminal_italics = 1
let g:material_theme_style = 'dark'
set background=dark
colorscheme material
"colorscheme github
"let g:airline_theme = "github"

" ============================================================================ "
" Editor Settings
" ============================================================================ "
set splitright
set synmaxcol=256
set clipboard=unnamedplus
"set cmdheight=2
set expandtab
set foldmethod=indent
set foldlevel=1
"set hlsearch
set nohlsearch
set nolist
set number
set relativenumber
set shiftwidth=2
set smartcase
set t_ut=
set tabstop=2
set textwidth=0
set wrap
set wrapmargin=0
set completeopt-=preview
set shortmess+=c
set mmp=5000
" Automatically re-read file if a change was detected outside of vim
set autoread

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
endif
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup
set noswapfile

autocmd ColorScheme * hi SneakLabel cterm=bold ctermfg=15 ctermbg=4 gui=bold guifg=white guibg=Black
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
autocmd BufNewFile,BufRead *.ts set filetype=typescript.tsx
autocmd FileType php setlocal shiftwidth=4 softtabstop=4 expandtab

" ============================================================================ "
" FZF
" ============================================================================ "

let g:fzf_command_prefix = 'Fzf'

" ============================================================================ "
" NERDTree
" ============================================================================ "
let g:NERDTreeChDirMode = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowMinimalUI = 1

" ============================================================================ "
" Airline
" ============================================================================ "
let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 0
let g:airline_exclude_preview = 1
let g:airline_theme = 'material'
let g:NERDTreeStatusLine = ''


" ============================================================================ "
" IndentLine
" ============================================================================ "
let g:indentLine_char = '¦'
let g:indentLine_color_gui = '#5b5e73'

" ============================================================================ "
" Coc
" ============================================================================ "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! FloatScroll(forward) abort
  let float = coc#util#get_float()
  if !float | return '' | endif
  let buf = nvim_win_get_buf(float)
  let buf_height = nvim_buf_line_count(buf)
  let win_height = nvim_win_get_height(float)
  if buf_height < win_height | return '' | endif
  let pos = nvim_win_get_cursor(float)
  if a:forward
    if pos[0] == 1
      let pos[0] += 3 * win_height / 4
    elseif pos[0] + win_height / 2 + 1 < buf_height
      let pos[0] += win_height / 2 + 1
    else
      let pos[0] = buf_height
    endif
  else
    if pos[0] == buf_height
      let pos[0] -= 3 * win_height / 4
    elseif pos[0] - win_height / 2 + 1  > 1
      let pos[0] -= win_height / 2 + 1
    else
      let pos[0] = 1
    endif
  endif
  call nvim_win_set_cursor(float, pos)
  return ''
endfunction


autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

set shortmess+=c
set updatetime=300

" Remap keys for gotos
nmap <silent> gd :vsp<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" ============================================================================ "
" Misc
" ============================================================================ "
"
let g:vista#renderer#enable_icon = 1
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let NERDTreeWinSize = 42
let g:nv_default_extension = '.md'
let g:nv_search_paths = ['/home/mingxiangchan/wiki']
let g:nv_include_hidden = 1
let g:nv_use_ignore_files = 0
let g:nv_use_short_pathnames=1
let g:used_javascript_libs = 'react,ramda'
" Highlight jsx even in non .jsx files
let g:jsx_ext_required = 0
let g:mundo_prefer_python3 = 1
let g:tagbar_autofocus = 1
let g:sneak#label = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
  autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete
endif

" ====
" Notational Velocity
" ====
let g:nv_default_extension = '.md'
let g:nv_search_paths = ['~/wiki']
let g:nv_use_short_pathnames=0 " having pyenv causes issues with shortening path
let g:nv_show_preview = 0

" ============================================================================ "
" KeyMappings
" ============================================================================ "
"
"
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
nnoremap <Leader>nv :NV<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>cf :CocFix<CR>
nnoremap <C-T> :tabnew <CR>:te<CR>i
nnoremap <C-P> :FzfFiles<CR>
nnoremap <C-O> :FzfRg<CR>
nnoremap <C-/> :FzfLines<CR>
"nnoremap <C-O> :Clap grep2<CR>
nnoremap <C-B> :NERDTreeToggle<CR>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap Q <Nop>
nnoremap W <Nop>
cmap w!! w !sudo tee %
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

