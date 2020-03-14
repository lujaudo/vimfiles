call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"**********************************************
" VIM Global settings 
"**********************************************

set smartcase

" disable caffeine F15 keypress
"noremap <F15> <nop>
"noremap! <F15> <nop>


" UTF-8 must be the first
"language en
set encoding=utf-8


source $VIMRUNTIME/mswin.vim
behave mswin

" this is vim, not vi
" This option has the effect of making Vim either more Vi-compatible, or
" make Vim behave in a more useful way.
" This must be first, because it changes other options as a side effect.
set nocompatible
" set option&vim = Reset option to its Vim default value. 
" cpo is bunch of flags for changing the vim behavior for example for input
" see help cpotions
set cpo&vim 

" limit lines to 100 chars
set colorcolumn=100
" When 'wildmenu' is on, command-line completion operates in an enhanced
" mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
" the possible matches are shown just above the command line.
set wildmenu

" always open files with folds expanded
set foldlevel=20

"change localleader
let maplocalleader = "," 
let mapleader = "," 

" No backups
set nobackup
set noswapfile

let g:xml_syntax_folding=1
let g:plantuml_executable_script="c:/home/bin/plantuml.bat"
" make quickfix window always to appear with full window width
:botright cwindow

"disable toolbar icons on top of window
:set guioptions-=T

let &path ="../**"
filetype plugin on

" see <URL:vimscript:he cot>
" show menu of possible selections
" When "longest" is not present, VIM automatically selects first entry
" of the popup menu.
set completeopt=menu,longest
" Remove windows buffers from insert mode complete list.
" see help 'complete'
"set complete-=w
set complete-=i
set complete-=t

"set grep program
"if set to internal, then vimgrep is used.
set grepprg=grep\ -n

"autoread changed files
set autoread

" see <URL:vimscript:help autowrite>
set autowrite

" always have syntax highlighting in with the gui:
syntax on
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"use dark background
colorscheme candy
set background=dark
set guifont=Consolas:h16
"set shellpipe to use tee
"set shellpipe=2>&1\ \|\ tee
"set shellpipe=>
set shellpipe=>\ %s\ 2>&1


" ignore case in searches
set ignorecase

" If on, writes fail unless you use a '!'.  Protects you from
" accidentally overwriting a file.  Default on when Vim is started
set ro

set tags=./tags,../tags,tags

" no word wrap
set nowrap

"'startofline' 'sol'	boolean	(default on)
"			global
"			{not in Vi}
"	When "on" the commands listed below move the cursor to the first
"	non-blank of the line.  When off the cursor is kept in the same column
"	(if possible).  This applies to the commands: CTRL-D, CTRL-U, CTRL-B,
"	CTRL-F, "G", "H", "M", "L", gg, and to the commands "d", "<<" and ">>"
set nostartofline

" set wrap at word (if wrap is enabled)
set lbr


"options for diff  
set diffopt=filler,vertical,iwhite

" tabs
set softtabstop=2
" use spaces instead of tabs to indent
set expandtab
" cindent
set shiftwidth=2
"switch-case indenting,function parameter list
set cino=:0,(0

" You can change buffer without saving
set hid

"show matching brackets
set showmatch
" how many tenths of a second to blink matching brackets
set mat=5

" so highlight as you type incremental search
set incsearch

" visual bell
set visualbell

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch            " highlight search term

" Show tabs and trailing characters.
"set listchars=tab:»·,trail:·,eol:¬
set listchars=tab:»·,trail:·
set list

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
    syntax on
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype on
    filetype plugin indent on



    "Quickfix window always on bottom
    autocmd FileType qf wincmd J

    autocmd BufRead,BufNewFile,BufEnter *.asciidoc
        \ setlocal spell spelllang=en_us autoindent expandtab tabstop=8 softtabstop=2 shiftwidth=2 filetype=asciidoc
        \ formatoptions=tcqn
        \ formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\\|^\\s*<\\d\\+>\\s\\+\\\\|^\\s*[a-zA-Z.]\\.\\s\\+\\\\|^\\s*[ivxIVX]\\+\\.\\s\\+
        \ comments=s1:/*,ex:*/,://,b:#,:%,:XCOMM,fb:-,fb:*,fb:+,fb:.,fb:>

    autocmd BufReadPost *
                \ highlight Cursor guifg=darkblue guibg=yellow |
                \ match ExtraWhitespace /\s\+$/

    au FileType xml setlocal foldmethod=syntax

    augroup END
else
    set autoindent		" always set autoindenting on
endif " has("autocmd")


"*********************************************************
"Keyboard Mappings
"*********************************************************

"visual mode yank should go end up at the end of the selection
:vmap y ygv<Esc>

" map U to redo
map U :redo<CR>
" Format paragraph
nmap Q gq}
vmap Q gq
"J should not move the cursor
:nnoremap <silent> J :let p=getpos('.')<bar>join<bar>call setpos('.', p)<cr>

"edit and source .vimrc
:nnoremap <leader>ev :split $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

"double click highlights the word
:map <C-LeftMouse> *b"*yw

" Select Buffer
map <F3> :BufExplorer<CR>
" Taglist
nnoremap <silent> <F12> :TagbarToggle<CR>
" C-n goes to next file 
map <C-n> :n<CR>
" C-p goes to previous file 
map <C-p> :N<CR>

" make line movement also work with wrapped lines
function! ScreenMovement(movement)
    if &wrap
        return "g" . a:movement
    else
        return a:movement
    endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

" make ,, to repeat last executed keyboard script
map <localleader>, @@

" Control+movment key to move to other window
map <C-h> <C-W>h
imap <C-h> <ESC><C-W>h
map <C-j> <C-W>j
imap <C-j> <ESC><C-W>j
map <C-k> <C-W>k
imap <C-k> <ESC><C-W>k
map <C-l> <C-W>l
imap <C-l> <ESC><C-W>l


"disable middle button past
noremap <MiddleMouse> <LeftMouse>
noremap! <MiddleMouse> <LeftMouse>
noremap <2-MiddleMouse> <LeftMouse>
noremap! <2-MiddleMouse> <LeftMouse>
noremap <3-MiddleMouse> <LeftMouse>
noremap! <3-MiddleMouse> <LeftMouse>
noremap <4-MiddleMouse> <LeftMouse>
noremap! <4-MiddleMouse> <LeftMouse>

" new tab
map <C-t> :tabnew<CR>
imap <C-t> <ESC>:tabnew<CR>

"map ctrl-tab to move next/previous tab
map <C-Tab> :tabnext <cr>
imap <C-Tab> <ESC>:tabnext <cr>
map <S-C-Tab> :tabprevious <cr>
imap <S-C-Tab> <ESC>:tabprevious <cr>

" Alt-left to previous tag
map <A-Left> :pop <CR>
" Alt-Right go to tag under cursor
map <A-Right> :lt <C-R>=expand("<cword>") <CR><CR> :lope <CR> <C-W>k
" localleader-t to preview tag
map <localleader>t :ptjump <C-R>=expand("<cword>") <CR><CR> 

map <C-Right> :tn <CR>
map <C-Left> :tp <CR>

map <A-Down> :cn <CR> 
map <C-Down> :lne <CR>
map <A-UP> :cp <CR>
map <C-UP> :lp <CR>
map <C-w>q :bd <CR>



" Folding
map <localleader>1 :set foldlevel=1<cr> 
map <localleader>2 :set foldlevel=2<cr> 
map <localleader>3 :set foldlevel=3<cr> 
map <localleader>4 :set foldlevel=4<cr> 
map <localleader>5 :set foldlevel=5<cr> 
map <localleader>6 :set foldlevel=6<cr> 
map <localleader>7 :set foldlevel=7<cr> 
map <localleader>8 :set foldlevel=8<cr> 
map <localleader>9 :set foldlevel=9<cr> 
map <localleader>0 :set foldlevel=10<cr> 

"*********************************************************
"Menu
"*********************************************************

amenu Omat.BreakPts :BreakPts<cr>

amenu Omat.Edit\ vimrc :e  $VIM/vimrc<cr>
amenu Omat.Show\ errors :messages <cr>
amenu Omat.Source\ vimrc :so $VIM/vimrc <cr> 
amenu Omat.Verbose\ map :verbose map  
function! OutputToBuffer()
    let tempfile=tempname()
    exe "set verbosefile=".tempfile
    exe "sp ".tempfile
endfunction
amenu Omat.Output\ to\ buffer :call OutputToBuffer()<cr> 
amenu Omat.Wrap\ lines<tab>set\ textwidth=78 :set textwidth=78<cr>
" Copy row or selection between windows
amenu Omat.CopyRight<tab>,cr ,cr 
amenu Omat.CopyLeft<tab>,cl ,cl 
amenu Omat.MoveRight<tab>,mr ,mr 
amenu Omat.MoveLeft<tab>,ml ,ml 

" grep
amenu Omat.grep\ word<tab>,vv ,vv
amenu Omat.grep<tab>:Grep :Grep

" IdUtils
"amenu Omat.MkId :exe '!"H:&&cd H:\&&mkid -m '.$home.'\var\id-utils\id-lang.map '.'-o '.getcwd().'\ID '.getcwd().'"'<cr> 
"amenu Omat.MkId :exe '!"cd '.getcwd().'&&mkid -m '.$home.'\var\id-utils\id-lang.map'<cr> 


"amenu Omat.VimRexx<tab>:Vimrex :Vimrex<cr>
" Highlight current line 
"amenu  Omat.Highlight.currentline<tab>,hh :call <SID>Highlight("h")<cr>
" Advance color for next line highlight
"amenu  Omat.Highlight.advance\ Color<tab>,hn :call <SID>Highlight("a")
" Clear last line highlight
"amenu  Omat.Highlight.Clear\ Last\ Highlight<tab>,hk :call <SID>Highlight("r")

"amenu Omat.Comment\ visual\ block<tab>,co ,co

" Highlight all lines having word under cursor (whole word match)
"amenu  Omat.Highlight.Highlight\ all\ with\ word\ under\ cursor<tab>,hw :call <SID>Highlight("f")
" Highlight all lines having word under cursor (partial word match)
" Highlight last search pattern
"amenu  Omat.Highlight.Highlight\ last\ search\ pattern<tab>,hs :call <SID>Highlight("s")
" Clear last pattern highlight
"amenu  Omat.Highlight.clear\ last\ pattern\ highlight<tab>,hp :call <SID>Highlight("d")

" Clear all highlights
"amenu  Omat.Highlight.clear\ all\ highlights<tab>,hq :call <SID>Highlight("n")

" Nerdtree
"amenu Omat.Nerdtree.Open\ in\ cwd :exe 'NerdTree .' getcwd()

amenu Omat.Lock\ scroll :exe set scrollbind
amenu Omat.Scroll\ to\ cursor<tab>zs zs

" Diff commands 
map <localleader>dd :VersDiff -t<cr>
amenu Omat.diff.diffChanges<tab>,dd ,dd

map <localleader>dc :VersDiff -c<cr>
amenu Omat.diff.diffClose<tab>,dc ,dc 

map <localleader>dp :VersDiff -<cr>
amenu Omat.diff.diffPrevious<tab>,dp ,dp 

map <localleader>dn :VersDiff +<cr>
amenu Omat.diff.diffNext<tab>,dn ,dn

"Doxygen
"amenu Omat.Doxygen.generate\ comment\ block<tab>:Dox :Dox<cr>

" amenu Omat.marks.Toggle\ showmarks<tab>,mt ,mt
" amenu Omat.marks.Hide\ mark<tab>,mh ,mh
" amenu Omat.marks.Hide\ all<tab>,ma ,ma
" amenu Omat.marks.add\ mark<tab>,mm ,mm
amenu Omat.Insert\ Line\ Numbers :%s/^/\=printf('%-4d', line('.'))
amenu Omat.Insert\ Numbers :put =map(range(0,9), 'printf(''0x%02x'', v:val)')
amenu Omat.Insert\ Numbers :put =map(range(0,9), 'printf(''0x%02x'', v:val)')
amenu Omat.Format_JSON :%!python -m json.tool<cr>
amenu Omat.DiffOrig :DiffOrig<cr>

"***********************************************************************************
"******************************************************************************

"****************STATUS line ********************************
set laststatus=2 "force status line on
set statusline=
"set statusline+=%#MyColor1#
"set statusline+=%n                   " buffer number
"set statusline+=%#MyColor2#
"set statusline+=%{'/'.bufnr('$')}\   " total buffers
"set statusline+=%#MyColor3#
set statusline+=%<[%1.30{fnamemodify(getcwd(),':t')}] " pwd
set statusline+=\ %<%1.30F             " filename
"set statusline+=%#MyColor1#
"set statusline+=%#MyColor3#
set statusline+=\ %y%h%w             " filetype, help, example flags
" the current branch and the currently edited file's commit.
"set statusline+=%{fugitive#statusline()}
"set statusline+=%#MyColor4#
set statusline+=%r%m                 " read-only, modified flags
"set statusline+=%#MyColor3#
set statusline+=%=\                  " indent right
"set statusline+=%#MyColor1#
set statusline+=%l                   " line number
"set statusline+=%#MyColor2#
set statusline+=/%{line('$')}        " total lines
set statusline+=%#MyColor2#
set statusline+=,
set statusline+=%#MyColor1#
set statusline+=%c%V                 " [virtual] column numberV
"set statusline+=%#MyColor2#
"set statusline+=\                    "
"set statusline+=%#MyColor3#
"set statusline+=%<%P                 " percent
"highlight MyColor1 guifg=#fff guibg=#00a ctermfg=white   ctermbg=black
"highlight MyColor2 guifg=#aaa guibg=#007 ctermfg=gray    ctermbg=black
"highlight MyColor3 guifg=#7f7 guibg=#007 ctermfg=green   ctermbg=black
"highlight MyColor4 guifg=#ff0 guibg=#905 ctermfg=magenta ctermbg=black




"""PLUGINGS""""

"****************Nerdtree**************************
function! NTFinderP()
    "" Check if NERDTree is open
    let s:ntree = -1
    if exists("t:NERDTreeBufName")
        let s:ntree = bufwinnr(t:NERDTreeBufName)
    endif

    if (s:ntree != -1)
        "" If NERDTree is open, close it.
        :NERDTreeClose
        return
    endif

    if(expand("%:p")=="") 
        :exe 'NERDTree ' . fnamemodify(".",":p")
    else
        :NERDTreeFind
    endif

endfunction


"" Toggles NERDTree
imap <silent> <F2> :<ESC>call NTFinderP()<CR>
nmap <silent> <F2> :call NTFinderP()<CR>
imap <silent> <S-F2> :<ESC>:NERDTree $HOME<CR>
nmap <silent> <S-F2> :NERDTree $HOME<CR>

" show bookmarks above directory listing
let g:NERDTreeShowBookmarks=1
" Do not change pwd
let g:NERDTreeChDirMode=0


"*************************************************
"Supertab
"***********************************************

let g:SuperTabDefaultCompletionType = "<C-N>"

"**************************************
"gutentags
"**************************************
let g:gutentags_add_default_project_root=0
let g:gutentags_project_root=[".git",".vimprj"]
let g:gutentags_ctags_extra_args=["-R", "--sort=1", "--c++-kinds=+p", "--fields=+iaS", "--extra=+q"]
" lots of backslash escapes... for vim and cmd
let g:gutentags_ctags_post_process_cmd='perl -p -i.bak -e s/\\\\/\//g'
let g:gutentags_generate_on_new=0
"let g:gutentags_trace=1
"let g:gutentags_debug=1

"**************************************************
" PROJECT plugin 
"**************************************************

let g:proj_window_width = 30
let g:proj_window_increment = 50

"Project flags <URL:vimscript:he project-mappings>
"	b	Use the |browse()| when selecting directories for \c and \C.
"	c	The Project Window will automatically close when you select a file.
"	F	Float the Project Window.  That is, turn off automatic resizing and placement.
"	g	Mapping for <F12> will be created to toggle the Project Window open and closed.
"	i	Display the filename and the current working directory in the command line 
"	        when a file is selected for opening.
"	l	When present, the Project Plugin will use the |:lcd| command rather than |:cd|.
"	L	Similar to l, but install a BufEnter/Leave |:autocommand| to ensure that the 
"	        current working directory is changed to the one specified in the fold CD specification.
"	m	Turn on mapping of the |CTRL-W_o| and |CTRL-W_CTRL_O| normal  mode commands.
"	n	Line numbers will be turned on for the project window.
"	s	Enable syntax highlighting in the Project Window.
"	S	Turn on sorting for refresh and create.
"	t	When present, toggle the size of the window rather than just increase the size when
"	        pressing <space> or right-clicking.
"	T	Put Subproject folds at the top of the fold when refreshing.
"	v	When present, use :vimgrep rather than :grep when using \G.


" It's good to have the 'v' flag on since in larger projects shell's
" limit for command-line length is found quite easily.
"let g:proj_flags="mstvcgF"
let g:proj_flags="stgv"

" Project
nmap <silent> <F1> <Plug>ToggleProject
imap <silent> <F1> <ESC><Plug>ToggleProject

"if filereadable(".vimprojects")
"    let g:proj_project_filename = pwd . /.vimprojects
"endif
"*********************************
"BufExplorer
"********************************
let g:bufExplorerFindActive=0   " Allow opening same buffer in multiple tabs

"*******************************************************
" Minibufexplorer 
"*******************************************************
"map <F11> :MBEToggle<cr>
"let g:miniBufExplVSplit = 20   " vertical column width in chars
"let g:miniBufExplBRSplit = 1   " Put new window below
                               " current or on the
                               " right for vertical split

"*******************************************************
" A.vim
"*******************************************************
" do not create file if it does not exist
let g:alternateNoDefaultAlternate=1

" A.vim search path
" by default:
let g:alternateSearchPath = 
            \'sfr:../source,
            \sfr:../src,
            \sfr:../include,
            \sfr:../inc,
            \sfr:../../inc,
            \sfr:../../include,
            \sfr:../../../include,
            \sfr:../../../inc'


"*************************
" vimprj
"************************
function! <SID>SetMainDefaults()

  " your default options
  "set tabstop=4
  "set shiftwidth=4
  "set expandtab
  let g:rg_path=""

  if exists('g:rg_derive_root')
    unlet g:rg_derive_root
  endif
  if exists('g:rg_highlight')
    unlet g:rg_highlight
  endif

endfunction

" apply defaults right now
call <SID>SetMainDefaults()

" initialize vimprj plugin
"call vimprj#init()

" define a hook
"function! g:vimprj#dHooks['SetDefaultOptions']['main_options'](dParams)
"    call <SID>SetMainDefaults()
"endfunction

"*************************
" MARK.vim
"************************

let g:mwDefaultHighlightingPalette = 'extended'
nmap <unique> n <Plug>MarkSearchOrCurNext
"nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
"nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev
"nmap  <silent> * :call Markword()<CR> 
"
" function! NextMatch()
"     let l:cntmatch = mark#GetNum()
"     let l:found = 0
"     for l:i in range(l:cntmatch)
"       if( mark#GetPattern(l:i) == @/ )
"         let l:found = 1
"       endif
"     endfor
"     if (l:found == 0)
"      call mark#SetMark(0,@/)
"     endif
" 
"     let markmatch = mark#CurrentMark()
"     if markmatch[2] != -1
"       call mark#SearchCurrentMark(0)
"     else
"       call mark#SearchAnyMark(0)
"     endif
" endfunction


"function! Markword()
"    call mark#MarkCurrentWord(v:count)
"    let s = histget("search", -1)
"    let s = substitute(s,'\\<',"","",)
"    let s = substitute(s,'\\>$',"","",)
"    let @/ = s
"endfunction
"
"vmap  <silent> * <Plug>MarkSet
"nmap  <silent> n :call NextMatch()<CR>zz
"nmap  <localleader> M :call mark#DoMarkAndSetCurrent(v:count, @/)<CR>
"
"
"modified the autoload/mark.vim to include the current search pattern to
"anymark search
"function! s:AnyMark()
"	return join(filter(copy(s:pattern) + [@/], '! empty(v:val)'), '\|')
"endfunction
"
"
"nmap  <silent> n <localleader>/
"nmap  <silent> n <localleader>*
"let g:mwAutoLoadMarks = 1
let g:mwDirectGroupJumpMappingNum=0






command! TC :silent !start c:\tools\totalcmd\TOTALCMD64.EXE /O %:p:h
command! CMD :silent !start cmd /k "cd %:p:h"
command! FilterQf :call QuickfixHidePath()
function! QuickfixHidePath()
  :syntax match ConcealedDetails /\v^.*[\\\/]/ conceal
  :set conceallevel=2
  :set concealcursor=nvic
endfunction

function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

command! -range Hide <line1>,<line2>call QuickfixHideVSel()
function! QuickfixHideVSel()
    let l:hide_command =  'syntax match ConcealedDetails /' . s:get_visual_selection() . '/ conceal'
    let l:hide_command = substitute(l:hide_command,'\\','\\\\','g')

  ":syntax match ConcealedDetails / . l:v_selection . / conceal
  exe(l:hide_command)
  :set conceallevel=2
  :set concealcursor=nvic
endfunction
command! -nargs=1 FindFile :call FindFile('lgrep','.',<f-args>)
function! FindFile(cmd,path,args)
   let grepprg_bak=&grepprg
   let grepformat_bak=&grepformat
   try
    let &grepprg='find ' . a:path . ' -iname *$**'
    let &grepformat="%f" 
    let cmd=a:cmd . ' ' . a:args
    "echom cmd
    silent exe cmd
  finally
    let &grepprg=grepprg_bak
    let &grepformat=grepformat_bak
  endtry
endfunction

command! -nargs=1 TFile :call TresosFindFile(<f-args>)
command! -nargs=1 Tfile :call TresosFindFile(<f-args>)
function! TresosFindFile(args)
    if exists("$TRESOS_BASE") && exists("$PROJECT_ROOT")
        let plugins_dir=$TRESOS_BASE . "\\plugins"
        call FindFile('grep',$PROJECT_ROOT , a:args)
        call FindFile('grepadd', plugins_dir , a:args)
    elseif exists("$BASE_DIR") && exists("$PROJECT_ROOT")
        let plugins_dir=$BASE_DIR . "\\EOCM\\Tresos\\plugins"
        call FindFile('grep',$PROJECT_ROOT , a:args)
        call FindFile('grepadd',plugins_dir , a:args)
    else
        echom "no tresos env set"
    endif
    cope
endfunction
command! -nargs=1 Grep :call Grepfiles(<f-args>)
function! Grepfiles(args)
    let search_dir = input("search DIR: ", expand("%:p:h"), "dir")
    silent exe 'Ag ' . a:args . ' ' . search_dir
endfunction


command! -nargs=0 Gword :call Grepword(<f-args>)
function! Grepword()
    call Markword()
    if exists("$PROJECT_ROOT")
        call TresosGrep(expand("<cword>"))
    else
        let search_dir = input("search DIR: ", expand("%:p:h"), "dir")
        silent exe 'Ag "<cword>" ' . search_dir
    endif
endfunction

command! -nargs=1 TGrep :call TresosGrep(<f-args>)
command! -nargs=1 Tgrep :call TresosGrep(<f-args>)
function! TresosGrep(args)
    let l:command = 'LAg '. a:args . ' ' . $PROJECT_ROOT
    "echom l:command 
    silent exe l:command 
    if exists("$TRESOS_BASE")
        let plugins_dir=$TRESOS_BASE . "\\plugins"
    elseif exists("$BASE_DIR")
        let plugins_dir=$BASE_DIR . "\\EOCM\\Tresos\\plugins"
    endif
    let l:cmd = 'LAgAdd ' . a:args .' ' . plugins_dir
    "echom l:cmd 
    silent exe l:cmd 
endfunction

function! PComment() range
	let line=getline(a:firstline)
	if (line =~ '^#if')
		" remove if block
		execute a:firstline . "normal dd"
		let emb=0
		let i = a:firstline+1
		while i<=line("$")
			let line=getline(i)
			if line =~ '^#if'
				let emb=emb+1
			endif
			if line =~ '^#else'
				if emb == 0
					" not an embedded else so turn else
					" into an #if 0 to match following
					" #endif
					let newline=substitute(line,"^#else","#if 0","")
					call setline(i,newline)
					break
				endif
			endif
			if line =~ '^#endif'
				if emb > 0
					let emb=emb-1
				else
					" found matching endif; remove it
					execute i . "normal dd"
					execute a:firstline
					break
				endif
			endif
			let i=i+1
		endwhile
	else
		" add block
		call append((a:firstline-1),"#if 0")
		call append(a:lastline+1,"#endif")
	endif
endfunction
map <leader>c :call PComment()<CR>
vmap <leader>c :call PComment()<CR>gv<Esc>

"Something for tagbar
let g:tagbar_type_xdm = {
    \ 'ctagstype' : 'xdm',
    \ 'kinds'     : [
        \ 't:tag'
    \ ]
\ }

function! Days()
  let start_day = input("Starting day:")
  let year_month = strftime('%Y-%m-')
  call append(0, year_month . start_day . "\t" )
endfunction


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
          \ | wincmd p | diffthis
endif

"disable stupid macvim keyboard remappings
if has("gui_macvim")
  let macvim_skip_cmd_opt_movement = 1
endif

"unity error format

"set efm=%f(%l)\ :\ %t%*\D%n:\ %m,%*[^"]"%f"%*\D%l:\ %m,%f(%l)\ :\ %m,%*[^ ]\ %f\ %l:\ %m,%f:%l:%c:%m,%f(%l):%m,%*[.]%f:%l:%m,%f|%l|\ %m
"set efm=TEST(%*[^)])%f:%l:%m,%f:%l:%c:%m,%f:%l:%m
"set efm=ctc\ E%n:\ \[\"%f\"\ %l/%m
"ceedling
set efm=%f:%l:%m
set efm+=%m\ in\ line\ %l\ of\ file\ %f
