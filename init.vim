syntax enable

colorscheme apprentice
"set background=dark
"set nowrap
"set number
set ai
set autochdir
set expandtab
set foldlevel=99
set foldmethod=indent
set lazyredraw
set mat=1
set shiftwidth=4
set showmatch
set showmatch
set si
set sidescroll=1
set sidescrolloff=4
set smarttab
set statusline=
set statusline+=
set tabstop=4

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
" let g:syntastic_html_checkers = ['w3']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_check_on_wq = 0
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 2
let NERDTreeToggle=0
let NERDTreeWinSize=38
let g:tex_flavour = "context"
let loaded_matchparen=1

" Indent guide colors for \ig
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#252525
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#272727

filetype plugin on
filetype indent on

call plug#begin('~/.nvim/plugged')
Plug 'digitaltoad/vim-pug'
Plug 'ervandew/matchem'
Plug 'ervandew/supertab'
Plug 'fidian/hexmode'
Plug 'junegunn/vim-easy-align'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'peterhoeg/vim-qml'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
call plug#end()

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

if exists("g:loaded_statline_plugin")
    finish
endif
let g:loaded_statline_plugin = 1


" always display statusline (iss #3)
set laststatus=2


" ====== colors ======

" using link instead of named highlight group inside the statusline to make it
" easier to customize, reseting the User[n] highlight will remove the link.
" Another benefit is that colors will adapt to colorscheme.

"filename
hi default link User1 Identifier
" flags
hi default link User2 Statement
" errors
hi default link User3 Error
" fugitive
hi default link User4 Special



" ====== basic info ======

" ---- number of buffers : buffer number ----

function! StatlineBufCount()
    if !exists("s:statline_n_buffers")
        let s:statline_n_buffers = len(filter(range(1,bufnr('$')), 'buflisted(v:val)'))
    endif
    return s:statline_n_buffers
endfunction

if !exists('g:statline_show_n_buffers')
    let g:statline_show_n_buffers = 1
endif

if g:statline_show_n_buffers
    set statusline=[%{StatlineBufCount()}\:%n]\ %<
    " only calculate buffers after adding/removing buffers
    augroup statline_nbuf
        autocmd!
        autocmd BufAdd,BufDelete * unlet! s:statline_n_buffers
    augroup END
else
    set statusline=[%n]\ %<
endif


" ---- filename (relative or tail) ----

if exists('g:statline_filename_relative')
    set statusline+=%1*[%f]%*
else
    set statusline+=%1*[%t]%*
endif


" ---- flags ----

" (h:help:[help], w:window:[Preview], m:modified:[+][-], r:readonly:[RO])
set statusline+=%2*%h%w%m%r%*


" ---- filetype ----

set statusline+=\ %y


" ---- file format → file encoding ----

if &encoding == 'utf-8'
    let g:statline_encoding_separator = '→ '
else
    let g:statline_encoding_separator = ':'
endif

if !exists('g:statline_show_encoding')
    let g:statline_show_encoding = 1
endif
if !exists('g:statline_no_encoding_string')
    let g:statline_no_encoding_string = 'No Encoding'
endif
if g:statline_show_encoding
    set statusline+=[%{&ff}%{g:statline_encoding_separator}%{strlen(&fenc)?&fenc:g:statline_no_encoding_string}]
endif


" ---- separation between left/right aligned items ----

set statusline+=%=


" ---- current line and column ----

" (-:left align, 14:minwid, l:line, L:nLines, c:column)
set statusline+=%-14(\ L%l/%L:C%c\ %)


" ----  scroll percent ----

set statusline+=%P


" ---- code of character under cursor ----

if !exists('g:statline_show_charcode')
    let g:statline_show_charcode = 0
endif
if g:statline_show_charcode
    " (b:num, B:hex)
    set statusline+=%9(\ \%b/0x\%B%)
endif



" ====== plugins ======


" ---- RVM ----

if !exists('g:statline_rvm')
    let g:statline_rvm = 0
endif
if g:statline_rvm
    set statusline+=%{exists('g:loaded_rvm')?rvm#statusline():''}
endif


" ---- rbenv ----

if !exists('g:statline_rbenv')
    let g:statline_rbenv = 0
endif
if g:statline_rbenv
    set statusline+=%{exists('g:loaded_rbenv')?rbenv#statusline():''}
endif


" ---- Fugitive ----

if !exists('g:statline_fugitive')
    let g:statline_fugitive = 0
endif
if g:statline_fugitive
    set statusline+=%4*%{exists('g:loaded_fugitive')?fugitive#statusline():''}%*
endif


" ---- Syntastic errors ----

if !exists('g:statline_syntastic')
    let g:statline_syntastic = 1
endif
if g:statline_syntastic
    set statusline+=\ %3*%{exists('g:loaded_syntastic_plugin')?SyntasticStatuslineFlag():''}%*
endif



" ====== custom errors ======


" based on @scrooloose whitespace flags
" http://got-ravings.blogspot.com/2008/10/vim-pr0n-statusline-whitespace-flags.html


" ---- mixed indenting ----

if !exists('g:statline_mixed_indent')
    let g:statline_mixed_indent = 1
endif

if !exists('g:statline_mixed_indent_string')
    let g:statline_mixed_indent_string = '[mix]'
endif

"return '[&et]' if &et is set wrong
"return '[mixed-indenting]' if spaces and tabs are used to indent
"return an empty string if everything is fine
function! StatlineTabWarning()
    if !exists("b:statline_indent_warning")
        let b:statline_indent_warning = ''

        if !&modifiable
            return b:statline_indent_warning
        endif

        let tabs = search('^\t', 'nw') != 0

        "find spaces that arent used as alignment in the first indent column
        let spaces = search('^ \{' . &ts . ',}[^\t]', 'nw') != 0

        if tabs && spaces
            let b:statline_indent_warning = g:statline_mixed_indent_string
        elseif (spaces && !&et) || (tabs && &et)
            let b:statline_indent_warning = '[&et]'
        endif
    endif
    return b:statline_indent_warning
endfunction

if g:statline_mixed_indent
    set statusline+=%3*%{StatlineTabWarning()}%*

    " recalculate when idle and after writing
    augroup statline_indent
        autocmd!
        autocmd cursorhold,bufwritepost * unlet! b:statline_indent_warning
    augroup END
endif


" --- trailing white space ---

if !exists('g:statline_trailing_space')
    let g:statline_trailing_space = 1
endif

function! StatlineTrailingSpaceWarning()
    if !exists("b:statline_trailing_space_warning")
        if search('\s\+$', 'nw') != 0
            let b:statline_trailing_space_warning = '[\s]'
        else
            let b:statline_trailing_space_warning = ''
        endif
    endif
    return b:statline_trailing_space_warning
endfunction

if g:statline_trailing_space
    set statusline+=%3*%{StatlineTrailingSpaceWarning()}%*

    " recalculate when idle, and after saving
    augroup statline_trail
        autocmd!
        autocmd cursorhold,bufwritepost * unlet! b:statline_trailing_space_warning
    augroup END
endif


