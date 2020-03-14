" Vim compiler file
" 

if exists("current_compiler")
  finish
endif
let current_compiler = "ghs"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

" -------------------------------------
" GHS separate error and warning messages
setlocal errorformat=%E\"%f\"\\,%*[^0-9]%l:%.%#error%m,%W\"%f\"\\,%*[^0-9]%l:%.%#warning%m,%-Z\ \ %p^,%+C%.%#


"shellpipe stderror to stdout and tee in windows
CompilerSet shellpipe=2>&1\ \|\ tee
"alternate routing of stderr to stdout in windows
CompilerSet shellpipe=>\ %s\ 2>&1
" default make
CompilerSet makeprg=make
