" map key chord `jk` to <Esc>.
let g:esc_j_lasttime = 0
let g:esc_k_lasttime = 0
function! JKescape(key)
        if a:key=='j' | let g:esc_j_lasttime = reltimefloat(reltime()) | endif
            if a:key=='k' | let g:esc_k_lasttime = reltimefloat(reltime()) | endif
                let l:timediff = abs(g:esc_j_lasttime - g:esc_k_lasttime)
                    return (l:timediff <= 0.05 && l:timediff >=0.001) ? "\b\e" : a:key
                endfunction
                inoremap <expr> j JKescape('j')
                inoremap <expr> k JKescape('k')

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

" vimspectorpy config - Python Debugging with Vimspector
let g:vimspectorpy#launcher = "tmux"
