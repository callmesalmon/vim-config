set nu
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent

noremap Y y$

let mapleader = ','
let g:mapleader = ','

nnoremap <leader>e :E<CR>

" Configuring netrw
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_banner = 0

function! NetrwToggleHidden()
  if exists('g:netrw_list_hide') && g:netrw_list_hide ==# ''
    let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
  else
    let g:netrw_list_hide = ''
  endif
  silent! e
endfunction

augroup NetrwToggleHidden
    autocmd!
    autocmd FileType netrw nnoremap <buffer> H :call NetrwToggleHidden()<CR>
augroup END

" hjkl supremacy
noremap  <Up>       <Nop>
noremap  <Down>     <Nop>
noremap  <Left>     <Nop>
noremap  <Right>    <Nop>
inoremap <Up>       <Nop>
inoremap <Down>     <Nop>
inoremap <Left>     <Nop>
inoremap <Right>    <Nop>
vnoremap <Up>       <Nop>
vnoremap <Down>     <Nop>
vnoremap <Left>     <Nop>
vnoremap <Right>    <Nop>

set statusline=%f\ [type=%Y]

hi StatusLine term=bold,reverse cterm=bold ctermfg=7 ctermbg=0
hi StatusLineNC term=reverse cterm=bold ctermfg=8

color spacemacs

hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE

augroup CFuncHighlight
    autocmd! 
    autocmd FileType c,cpp,objc syntax match cFunction /\v\zs\w+\ze\s*\(/ containedin=ALL
    autocmd FileType c,cpp,objc highlight link cFunction Function
augroup END
