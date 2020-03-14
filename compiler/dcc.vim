" Vim compiler file
" Compiler:		bcc - Borland C
" Maintainer:	Emile van Raaij (eraaij@xs4all.nl)
" Last Change:	2004 Mar 27

if exists("current_compiler")
  finish
endif
let current_compiler = "dcc"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" -------------------------------------
" Diab-Data-Compiler, Assembler, Linker
" -------------------------------------
" dcc_info, dcc_warning, dcc_error, dcc_fatal
set errorformat=\"%f\"\\,\ line\ %l:\ %t%.%#\ \(dcc:%n\):%m
" dcc_fatal
set errorformat+=\"%f\"\\,\ line\ %l:\ %tatal\ error\ \(dcc:%n\):%m
set errorformat+=%tatal\ error\ \(dcc:%n\):%m
" das_error
set errorformat+=\"%f\"\\,\ line\ %l:\ %t[a-z]:%m
set errorformat+=\"%f\"\\,\ line\ %l:\ %m
" dld_error
set errorformat+=dld:\ \"%f\"\\,\ line\ %l:%m
set errorformat+=dld.exe:\ \"%f\"\\,\ line\ %l:%m
set errorformat+=%Dmake[1]:\ Entering\ directory\ '%f'
set errorformat+=%Dmake[1]:\ Leaving\ directory\ '%f'

"shellpipe stderror to stdout and tee in windows
CompilerSet shellpipe=2>&1\ \|\ tee
"alternate routing of stderr to stdout in windows
"CompilerSet shellpipe=>\ %s\ 2>&1
" default make
CompilerSet makeprg=make
