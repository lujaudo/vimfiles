" ---- Beginning of ${vimfiles}/compiler/flint.vim ----
" Compiler:     PC-lint/FlexeLint: an enhanced Lint for C and C++
" Maintainer:   James Widman <widman->gimpel>
" URL:	        http://gimpel.com
" Last Change:  2008 May 31

if exists("current_compiler")
  finish
endif
let current_compiler = "ts5"

" Note, env-vim.lnt sets Lint's error format to conform to Vim's
" default value of the 'errorformat' option.
CompilerSet errorformat=%m\ in\ line\ %l\ of\ file\ %f
"EthSwt_ConTest01169_GetPortIdentifier_InvPointer: check failed in line 10054 of file C:\work\Proje
"

let &l:makeprg=glob("../output/bin/*.exe")
"      \\ $HOME/var/lint/env_vim.lnt
"      \\ $HOME/var/lint/au-misra2.lnt
"let &l:makeprg .= ' +lnt"(cpp_options)" '
"let &l:makeprg .= ' +lnt"(inc)" '
"let &l:makeprg .= " " . expand("../EOCM/HWIOAPPL/output/Generated/mk_temp/ARM_dcc.inc") . " "
"let &l:makeprg .= " +b "
"let &l:makeprg .= " -u "
"let &l:makeprg .= ' +ppw"(warning)"'
"let &l:makeprg .= ' -estring"(793,*significant characters*)" '
"let &l:makeprg .= ' -wlib"(1)" '
""let &l:makeprg .= ' --emacro"(845,SPI_INTERNAL_BUFFER_SIZE)" '
""let &l:makeprg .= ' --emacro"(845,SPI_ID_0_BUFFER_SIZE)" '
""let &l:makeprg .= ' --emacro"(845,SPI_ID_1_BUFFER_SIZE)" '
""let &l:makeprg .= ' --efunc"(818,SetSPDD_y_TxBufferN)" '
""let &l:makeprg .= ' -e546 '
"let &l:makeprg .= " -d__asm= "
"let &l:makeprg .= " -dOS_TOOL=OS_gnu "
"let &l:makeprg .= " -dEB_STATIC_CHECK "
"let &l:makeprg .= additional_rules
""let &l:makeprg .= " -v1 -p "
"let &l:makeprg .= " % "

" ---- End of Vim compiler file ----

