augroup onsave
    autocmd!
    autocmd BufWritePost <buffer> silent Pandoc -f markdown -t docx -o %:r.docx
augroup end
