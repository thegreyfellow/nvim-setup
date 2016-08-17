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
set tabstop=8
set termguicolors


let NERDTreeToggle=0
let NERDTreeWinSize=26
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
let g:python3_host_skip_check = 1
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_css_checkers = ['csslint']
"let g:syntastic_html_checkers = ['w3']
"let g:syntastic_javascript_checkers = ['eslint']
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0
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
    autocmd FileType c          setlocal omnifunc=ccomplete#Complete
    autocmd FileType css        setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html       setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
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
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"

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
"Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'chun-yang/vim-action-ag'
Plug 'benekastah/neomake'
Plug 'carlitux/deoplete-ternjs'
Plug 'digitaltoad/vim-pug'
Plug 'ervandew/matchem'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'fidian/hexmode'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'peterhoeg/vim-qml'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-litecorrect'
Plug 'reedes/vim-pencil'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'shougo/deoplete.nvim'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'zchee/deoplete-jedi'
call plug#end()



" ============================================================================
" File:        statline.vim
" Maintainer:  Miller Medeiros <http://blog.millermedeiros.com/>
" Description: Add useful info to the statusline and basic error checking.
" Last Change: 2011-11-10
" License:     This program is free software. It comes without any warranty,
"              to the extent permitted by applicable law. You can redistribute
"              it and/or modify it under the terms of the Do What The Fuck You
"              Want To Public License, Version 2, as published by Sam Hocevar.
"              See http://sam.zoy.org/wtfpl/COPYING for more details.
" ============================================================================
"
"if exists("g:loaded_statline_plugin")
"    finish
"endif
"let g:loaded_statline_plugin = 1
"
"
"" always display statusline (iss #3)
"set laststatus=2
"
"
"" ====== colors ======
"
"" using link instead of named highlight group inside the statusline to make it
"" easier to customize, reseting the User[n] highlight will remove the link.
"" Another benefit is that colors will adapt to colorscheme.
"
""filename
"hi default link User1 Identifier
"" flags
"hi default link User2 Statement
"" errors
"hi default link User3 Error
"" fugitive
"hi default link User4 Special
"
"
"
"" ====== basic info ======
"
"" ---- number of buffers : buffer number ----
"
"function! StatlineBufCount()
"    if !exists("s:statline_n_buffers")
"        let s:statline_n_buffers = len(filter(range(1,bufnr('$')), 'buflisted(v:val)'))
"    endif
"    return s:statline_n_buffers
"endfunction
"
"if !exists('g:statline_show_n_buffers')
"    let g:statline_show_n_buffers = 1
"endif
"
"if g:statline_show_n_buffers
"    set statusline=[%{StatlineBufCount()}\:%n]\ %<
"    " only calculate buffers after adding/removing buffers
"    augroup statline_nbuf
"        autocmd!
"        autocmd BufAdd,BufDelete * unlet! s:statline_n_buffers
"    augroup END
"else
"    set statusline=[%n]\ %<
"endif
"
"
"" ---- filename (relative or tail) ----
"
"if exists('g:statline_filename_relative')
"    set statusline+=%1*[%f]%*
"else
"    set statusline+=%1*[%t]%*
"endif
"
"
"" ---- flags ----
"
"" (h:help:[help], w:window:[Preview], m:modified:[+][-], r:readonly:[RO])
"set statusline+=%2*%h%w%m%r%*
"
"
"" ---- filetype ----
"
"set statusline+=\ %y
"
"
"" ---- file format → file encoding ----
"
"if &encoding == 'utf-8'
"    let g:statline_encoding_separator = '→ '
"else
"    let g:statline_encoding_separator = ':'
"endif
"
"if !exists('g:statline_show_encoding')
"    let g:statline_show_encoding = 1
"endif
"if !exists('g:statline_no_encoding_string')
"    let g:statline_no_encoding_string = 'No Encoding'
"endif
"if g:statline_show_encoding
"    set statusline+=[%{&ff}%{g:statline_encoding_separator}%{strlen(&fenc)?&fenc:g:statline_no_encoding_string}]
"endif
"
"
"" ---- separation between left/right aligned items ----
"
"set statusline+=%=
"
"
"" ---- current line and column ----
"
"" (-:left align, 14:minwid, l:line, L:nLines, c:column)
"set statusline+=%-14(\ L%l/%L:C%c\ %)
"
"
"" ----  scroll percent ----
"
"set statusline+=%P
"
"
"" ---- code of character under cursor ----
"
"if !exists('g:statline_show_charcode')
"    let g:statline_show_charcode = 0
"endif
"if g:statline_show_charcode
"    " (b:num, B:hex)
"    set statusline+=%9(\ \%b/0x\%B%)
"endif
"
"
"
"" ====== plugins ======
"
"
"" ---- RVM ----
"
"if !exists('g:statline_rvm')
"    let g:statline_rvm = 0
"endif
"if g:statline_rvm
"    set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}
"endif
"
"
"" ---- rbenv ----
"
"if !exists('g:statline_rbenv')
"    let g:statline_rbenv = 0
"endif
"if g:statline_rbenv
"    set statusline+=%{exists('g:loaded_rbenv')?rbenv#statusline():''}
"endif
"
"
"" ---- Fugitive ----
"
"if !exists('g:statline_fugitive')
"    let g:statline_fugitive = 0
"endif
"if g:statline_fugitive
"    set statusline+=%4*%{exists('g:loaded_fugitive')?fugitive#statusline():''}%*
"endif
"
"
"" ---- Syntastic errors ----
"
"if !exists('g:statline_syntastic')
"    let g:statline_syntastic = 1
"endif
"if g:statline_syntastic
"    set statusline+=\ %3*%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}%*
"endif
"
"
"
"" ====== custom errors ======
"
"
"" based on @scrooloose whitespace flags
"" http://got-ravings.blogspot.com/2008/10/vim-pr0n-statusline-whitespace-flags.html
"
"
"" ---- mixed indenting ----
"
"if !exists('g:statline_mixed_indent')
"    let g:statline_mixed_indent = 1
"endif
"
"if !exists('g:statline_mixed_indent_string')
"    let g:statline_mixed_indent_string = '[mix]'
"endif
"
""return '[&et]' if &et is set wrong
""return '[mixed-indenting]' if spaces and tabs are used to indent
""return an empty string if everything is fine
"function! StatlineTabWarning()
"    if !exists("b:statline_indent_warning")
"        let b:statline_indent_warning = ''
"
"        if !&modifiable
"            return b:statline_indent_warning
"        endif
"
"        let tabs = search('^\t', 'nw') != 0
"
"        "find spaces that arent used as alignment in the first indent column
"        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0
"
"        if tabs && spaces
"            let b:statline_indent_warning = g:statline_mixed_indent_string
"        elseif (spaces && !&et) || (tabs && &et)
"            let b:statline_indent_warning = '[&et]'
"        endif
"    endif
"    return b:statline_indent_warning
"endfunction
"
"if g:statline_mixed_indent
"    set statusline+=%3*%{StatlineTabWarning()}%*
"
"    " recalculate when idle and after writing
"    augroup statline_indent
"        autocmd!
"        autocmd cursorhold,bufwritepost * unlet! b:statline_indent_warning
"    augroup END
"endif
"
"
"" --- trailing white space ---
"
"if !exists('g:statline_trailing_space')
"    let g:statline_trailing_space = 1
"endif
"
"function! StatlineTrailingSpaceWarning()
"    if !exists("b:statline_trailing_space_warning")
"        if search('\s\+$', 'nw') != 0
"            let b:statline_trailing_space_warning = '[\s]'
"        else
"            let b:statline_trailing_space_warning = ''
"        endif
"    endif
"    return b:statline_trailing_space_warning
"endfunction
"
"if g:statline_trailing_space
"    set statusline+=%3*%{StatlineTrailingSpaceWarning()}%*
"
"    " recalculate when idle, and after saving
"    augroup statline_trail
"        autocmd!
"        autocmd cursorhold,bufwritepost * unlet! b:statline_trailing_space_warning
"    augroup END
"endif
"
"
