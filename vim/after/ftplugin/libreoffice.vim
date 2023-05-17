augroup onsave
    autocmd!
    autocmd BufWrite <buffer> write !pandoc -f markdown -t odt -o %:r.odt
augroup end

augroup onopen
    autocmd!
    autocmd BufReadPre <buffer> read !pandoc -f odt -t markdown %
    autocmd BufReadPost <buffer> set filetype=markdown
