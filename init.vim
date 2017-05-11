let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable
filetype plugin on
filetype indent on
highlight OverLength ctermbg=red guibg=ColorColumn
match OverLength /\%81v.\+/


colorscheme molokai


"set textwidth=80
set background=dark
set nowrap
set ai
set autochdir
set autoread
set autowrite
set completeopt+=noinsert
set completeopt+=noselect
set expandtab
set foldlevel=99
set foldmethod=indent
set laststatus=2
set lazyredraw
set mat=1
set scrolloff=12
set shiftwidth=4
set showmatch
set si
set sidescroll=5
set sidescrolloff=10
set smarttab
set softtabstop=4
set nospell
set tabstop=4
set termguicolors


let NERDTreeToggle=0
let NERDTreeWinSize=28
let loaded_matchparen=1
let g:ackprg = 'ag --vimgrep'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:indent_guides_auto_colors = 1
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level = 2
let g:neomake_css_enabled_makers = ['csslint']
let g:neomake_html_enabled_makers = ['w3']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_open_list = 2
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
let g:python3_host_skip_check = 1
let g:go_auto_type_info = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_experimental = 1
let g:go_gocode_unimported_packages = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types= 1
let g:go_highlight_fields= 1
let g:go_highlight_functions= 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods= 1
let g:go_highlight_operators = 1
let g:go_highlight_types= 1
let g:go_list_type = "quickfix"
let g:go_metalinter_autosave = 1
let g:go_term_height = 15
let g:go_term_mode = "split"
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
let g:tern#filetypes = [ 'jsx', '.pug', 'vue', 'js', 'html' ]
let g:tex_flavour = "context"


" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Start NERDTree in side-tab
nnoremap <leader>nt :NERDTreeToggle<CR>

" Custom "vim" style tab navigation shortcuts
nnoremap td :tabclose<CR>
nnoremap tl :tabnext<CR>
nnoremap tj :tablast<CR>
nnoremap tk :tabfirst<CR>
nnoremap th :tabprev<CR>
nnoremap tm :tabm<Space>
nnoremap tn :tabnew<CR>
nnoremap tt :tabedit<Space>

" Indent guide colors for \ig
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#252525
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#272727

" Indent depths for different file types
autocmd BufNewFile,FileType *.yaml, *.yml, *.html, *.js set softtabstop=2 tabstop=2 shiftwidth=2
"autocmd BufRead,BufNewFile

"Setup for Prose Writing, and configuration
"   Vim-Pencil
let g:airline_section_x = '%{PencilMode()}'
let g:pencil#mode_indicators = {'hard': '␍', 'auto': 'ª', 'soft': '⤸', 'off': '',}
let g:pencil#wrapModeDefault = 'hard'
let g:pencil#textwidth = 74
augroup pencil
    autocmd!
    autocmd FileType markdown call pencil#init()
    autocmd FileType text     call pencil#init()
    autocmd FileType tex      call pencil#init()
augroup END
"   Vim-Lexical
let g:lexical#dictionary    = ['/usr/share/dict/words']
let g:lexical#spell         = 1
let g:lexical#thesaurus     = ['~/.config/nvim/thesaurus/MobyThesaurus.txt']
let g:lexical#thesaurus_key = '<leader>T'
augroup lexical
    autocmd!
    autocmd FileType markdown call lexical#init()
    autocmd FileType text     call lexical#init()
    autocmd FileType tex      call lexical#init()
augroup END
"   Vim-Litecorrect
augroup litecorrect
    autocmd!
    autocmd FileType markdown call litecorrect#init()
    autocmd FileType text     call litecorrect#init()
    autocmd FileType tex      call litecorrect#init()
augroup END
"   Goyo.vim

"Setting up OmniComplete for various filetypes, and Neomake
augroup omnifuncs
    autocmd!
    autocmd FileType c             setlocal omnifunc=ccomplete#Complete
    autocmd FileType css,sass,scss setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html          setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript    setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python        setlocal omnifunc=pythoncomplete#Complete
    autocmd BufWritePost * update | Neomake
augroup end
set ofu=syntaxcomplete#Complete

"Suggested go-vim shortcuts and autocmds by fatih
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

"run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>



"All extension packages for NeoVim through junegunn's Plug
call plug#begin('~/.nvim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'carlitux/deoplete-ternjs', {'do': 'npm install -g tern'}
Plug 'chun-yang/vim-action-ag'
Plug 'digitaltoad/vim-pug'
Plug 'ervandew/matchem'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'fidian/hexmode'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'peterhoeg/vim-qml'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-pencil'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'shougo/deoplete.nvim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'yosssi/vim-ace'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
call plug#end()
