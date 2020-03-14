if exists("current_compiler")
  finish
endif
let current_compiler = "ctc"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

set efm=ctc\ %.%n:\ \[\"%f\"\ %l/%c\]%m
