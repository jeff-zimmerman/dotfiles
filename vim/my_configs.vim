" set nocompatible for inoremap to work
set nocompatible

" map key chord `jk` to <Esc>.
Arpeggio inoremap jk <Esc>

" add autosave
augroup AutoSave
    autocmd!
    autocmd TextChanged,TextChangedI <buffer> if &readonly == 0 && filereadable(bufname('%')) | silent write | endif
augroup end

set number
set mouse=a
set ttymouse=sgr

" Set up ALE linter
nmap ,A <Plug>(ale_previous_wrap)
let g:ale_completion_enabled = 1
let g:ale_exclude_highlights = ['line too long', 'line-too-long', 'Line Too Long', 'E501']

" NERDTree config
nmap <leader>nm :NERDTreeMirror<CR>

" Indent Guides Config
" colorscheme tir_black
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Auto Fold Config
silent! unmap F
au FileType python unmap <buffer> F

" CtrlP config
silent! unmap <C-f>
map <C-c><C-p> <Plug>(ctrlp) 

" Auto Pairs Config
let g:AutoPairsMoveCharacter = ""

" Vimspector Config
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
