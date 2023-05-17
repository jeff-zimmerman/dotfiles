" New filetypes
if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
    au! Bufread, BufNewFile *.odt setfiletype libreoffice
    au! Bufread, BufNewFile *.odg setfiletype libreoffice
    au! Bufread, BufNewFile *.docx setfiletype word
augroup end
    
