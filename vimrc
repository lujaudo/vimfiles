call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


" UTF-8 must be the first
"language en
set encoding=utf-8


source $VIMRUNTIME/mswin.vim
behave mswin

" this is vim, not vi
" This option has the effect of making Vim either more Vi-compatible, or
" make Vim behave in a more useful way.
set nocompatible
" set option&vim = Reset option to its Vim default value. 
" cpo is bunch of flags for changing the vim behavior for example for input
" see help cpotions
set cpo&vim 

" When 'wildmenu' is on, command-line completion operates in an enhanced
" mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
" the possible matches are shown just above the command line.
set wildmenu

" always open files with folds expanded
set foldlevel=20

" do not treat '[' and ']' as a valid parts of filename with gf
"set isfname-=[,]


"change localleader
let maplocalleader = "," 
let mapleader = "," 

" No backups
set nobackup

" make quickfix window always to appear with full window width
:botright cwindow



"*********************************************************
"Keyboard Mappings
"*********************************************************
" map ö to go-to-start-of-line
map ö ^
" map ä to go-to-end-of-line
map ä $
" Format paragraph
"map Q gwap

" Reformat paragraphs and list.
"nnoremap R gq}

" Delete trailing white space and Dos-returns and to expand tabs to spaces.
"nnoremap S :set et<CR>:retab!<CR>:%s/[\r \t]\+$//<CR>

" Grep with word under cursor
"map <localleader>vv :call Grepfiles(expand("<cword>")) <cr> 

" Copy line from current window to right left
map <localleader>cr Y :wincmd l<cr>O<ESC>gp:wincmd h<cr>
map <localleader>cl Y :wincmd h<cr>O<ESC>gp:wincmd l<cr>
map <localleader>mr D :wincmd l<cr>O<ESC>gp:wincmd h<cr>
map <localleader>ml D :wincmd h<cr>O<ESC>gp:wincmd l<cr>

" Select Buffer
map <leader>b :SelectBuf<CR>
"NerdTree
nmap <silent> <F2> :NERDTreeToggle<CR>
nmap <silent> <S-F2> :exe 'NERDTree '.getcwd() <CR> 
" Taglist
nmap <silent> <F12> :TlistToggle <CR>
" Project
nmap <silent> <F1> <Plug>ToggleProject
"insert current date
imap <C-d> <C-R>=strftime("%y%m%d %H:%M ")<CR>
map <C-d> i<C-R>=strftime("%y%m%d %H:%M ")<CR>
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

"map <LocalLeader>n :tnext<cr>
"map <LocalLeader>N :tprevious<cr>

" Control+movment key to move to other window
map <C-h> <C-W>h
imap <C-h> <ESC><C-W>h
map <C-j> <C-W>j
imap <C-j> <ESC><C-W>j
map <C-k> <C-W>k
imap <C-k> <ESC><C-W>k
map <C-l> <C-W>l
imap <C-l> <ESC><C-W>l

"the following will map <Tab> to either actually insert a <Tab> if
"the current line is currently only whitespace, or start/continue a CTRL-N
"completion operation:
function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
        return "\<Tab>"
    else
        return "\<C-N>"
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>

" call goto implementation function (crete implementation from function
" prototype)
map  <localleader>gi :GOTOIMPL<CR>

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

" <localleader>t to taglist and open locallist.
"map <localleader>t :lt <C-R>=expand("<cword>") <CR><CR> :lope <CR> 

" Alt-left to previous tag
map <A-Left> :pop <CR>
" Alt-Right go to tag under cursor
map <A-Right> :lt <C-R>=expand("<cword>") <CR><CR> :lope <CR> <C-W>k

map <C-Right> :tn <CR>
map <C-Left> :tp <CR>

map <A-Down> :cn <CR> 
map <C-Down> :lne <CR>
map <A-UP> :cp <CR>
map <C-UP> :lp <CR>
map <C-w>q :bd <CR>

" Project toggle ON/OFF
nmap <silent> <F1> <Plug>ToggleProject


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
amenu Omat.STL\ ref.help :help stlrefvim<cr>
amenu Omat.STL\ ref.ref\ word<tab>,tr ,tr
amenu Omat.STL\ ref.example\ word<tab>,te ,te
amenu Omat.STL\ ref.ref\ ask<tab>,tw ,tw
amenu Omat.STL\ ref.TOC<tab>,tc ,tc

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
amenu Omat.MkId :exe '!"cd '.getcwd().'&&mkid -m '.$home.'\var\id-utils\id-lang.map'<cr> 


amenu Omat.VimRexx<tab>:Vimrex :Vimrex<cr>
" Highlight current line 
amenu  Omat.Highlight.currentline<tab>,hh :call <SID>Highlight("h")<cr>
" Advance color for next line highlight
amenu  Omat.Highlight.advance\ Color<tab>,hn :call <SID>Highlight("a")
" Clear last line highlight
amenu  Omat.Highlight.Clear\ Last\ Highlight<tab>,hk :call <SID>Highlight("r")

amenu Omat.Comment\ visual\ block<tab>,co ,co

" Highlight all lines having word under cursor (whole word match)
amenu  Omat.Highlight.Highlight\ all\ with\ word\ under\ cursor<tab>,hw :call <SID>Highlight("f")
" Highlight all lines having word under cursor (partial word match)
" Highlight last search pattern
amenu  Omat.Highlight.Highlight\ last\ search\ pattern<tab>,hs :call <SID>Highlight("s")
" Clear last pattern highlight
amenu  Omat.Highlight.clear\ last\ pattern\ highlight<tab>,hp :call <SID>Highlight("d")

" Clear all highlights
amenu  Omat.Highlight.clear\ all\ highlights<tab>,hq :call <SID>Highlight("n")

" Nerdtree
amenu Omat.Nerdtree.Open\ in\ cwd :exe 'NerdTree .' getcwd()

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
amenu Omat.Doxygen.generate\ comment\ block<tab>:Dox :Dox<cr>

amenu Omat.marks.Toggle\ showmarks<tab>,mt ,mt
amenu Omat.marks.Hide\ mark<tab>,mh ,mh
amenu Omat.marks.Hide\ all<tab>,ma ,ma
amenu Omat.marks.add\ mark<tab>,mm ,mm

"***********************************************************************************
"******************************************************************************


let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

highlight ShowMarksHLl guifg='black' guibg='red'
highlight ShowMarksHLu guifg='black' guibg='yellow'


"OTL settings
"let g:no_otl_maps = 1

let g:showmarks_textlower=">"
let g:showmarks_textupper=">"




let g:proj_window_width = 30
let g:proj_window_increment = 50
"let g:otl_use_viki=1
let g:otl_bold_headers=0

highlight folded guifg='white'
"disable toolbar
" see<URL:vimscript:he tb>
:set guioptions-=T

" cpp omni completion plugin
set nocp
filetype plugin on

" enable folding
"set foldmethod=syntax

" see <URL:vimscript:he cpt>
set complete=.,t,b

" see <URL:vimscript:he cot>
" show menu of possible selections
" When "longest" is not present, VIM automatically selects first entry
" of the popup menu.
set completeopt=menu,longest
" enter selects 

" see <URL:vimscript:he OmniCpp_ShowPrototypeInAbbr>
let g:OmniCpp_ShowPrototypeInAbbr = 0
let g:OmniCpp_SelectFirstItem = 1

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

"Lid
let LID_Cmd='lid.exe'

let LID_File='\ID'

"Set path
"Symbian path settings do not work with djgpp mkid ???
"let $PATH=expand("$VIM"). "\\bin\\GnuWin32\\bin;" .expand("$VIM"). "\\bin;" . "\\epoc32\\tools;\\epoc32\\gcc\\bin;" . $PATH
"let $PATH=expand("$VIM")."\\bin\\GnuWin32\\bin;".expand("$VIM")."\\bin;".$PATH


let $EPOCROOT="\\"

"set grep program
"if set to internal, then vimgrep is used.
set grepprg=grep\ -n


"correct common mispellings
ab lenght length
ab aLenght aLength
ab Kerrnone KErrNone
ab KerrNone KErrNone
ab KErrnone KErrNone
ab KErrnotfound KErrNotFound
ab KErrnotFound KErrNotFound
ab KErrNotfound KErrNotFound
ab Kerrnotfound KErrNotFound
ab KerrNotfound KErrNotFound
ab KerrNotFound KErrNotFound



"for search funcition
set path=.,./../inc,./../src

"autoread changed files
set autoread

"no swapfile
"set noswapfile

" see <URL:vimscript:help autowrite>
set autowrite

" always have syntax highlighting in with the gui:
syntax on

"use dark background
colorscheme candy


"********************
"Compilation
"********************
"set makeprg=make.exe
set makeprg=abdl\ build\ armv5

" When compiling for emulator, use makefile
" with stderr redirected to stdout. Otherwise
" CPP errors does not get printed.
"
" quickfix and gnu-make/RVCT/winscw
set errorformat=
            \%Dmake[%*\\d]:\ Entering\ directory\ `%f',
            \%Dmake[%*\\d]:\ Leaving\ directory\ `%f',
            \\\"%f\\"%\\,\ line\ %l:%m,
            \%f:%l:%m


" ignore case in searches
set ignorecase

set ro

set tags=./tags,../tags,tags,h:\home\reference\Programming\STL\STL_tags

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

" set wrap at word (if it is enabled)
set lbr
let g:lctags_cmd=$VIM . '\bin\gnuwin32\bin\ctags.exe'
let ctags_cmd=g:lctags_cmd . ' -R .'
let Tlist_Ctags_Cmd=g:lctags_cmd 
let Tlist_Use_Right_Window=1


"options for diff see <url:vimscript:help diffopt>
set diffopt=filler,vertical,iwhite

"" Writebackup
"function! MyResolveBackupDir(originalFilespec, isQueryOnly)
"    let currentdir=substitute(expand(a:originalFilespec),"[/\\\\][^/\\\\]*$","","")
"    let backupdir=currentdir.'/.backup'
"
"    if (!a:isQueryOnly && strlen(finddir(backupdir)) == 0)
"            call mkdir (backupdir, "p", 0770)
"    endif
"    return backupdir
"endfunction
"
"let g:WriteBackup_CompareShellCommand = 'diff -q'
"let g:WriteBackup_BackupDir = function('MyResolveBackupDir')

"set diffexpr=MyDiff()
"function! MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  if &sh =~ '\<cmd'
"    execute '!diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
"  else
"    execute '!diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"  endif
"endfunction


" tabs
set softtabstop=4
" use spaces instead of tabs to indent
set expandtab
" cindent
set shiftwidth=4

" You can change buffer without saving
set hid

"show matching brackets
set showmatch
" how many tenths of a second to blink matching brackets
set mat=5
" do not highlight searched for phrases
"
set nohlsearch
" so highlight as you type incremental search
set incsearch
" 40 lines tall
"set lines=40
" 80 columns
"set columns=80
" visual bell
set visualbell




" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

"set backup		" keep a backup file
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")


" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

let g:netrw_browsex_viewer="start "

" use the current line's indent level to set the indent level of new lines.
set autoindent

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype on
    filetype plugin indent on

    " Disable highlighting of folded text
    "    augroup otl
    "      autocmd BufReadPost *.otl highlight Folded NONE
    "       autocmd BufEnter *.otl set tabstop=2 shiftwidth=2 softtabstop=0 noexpandtab
    "       autocmd BufLeave *.otl set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
    "    augroup END

    "au BufNewFile,BufRead *.ahk setf ahk 

    "augroup cpp 
    "    autocmd BufRead *.cpp set cinoptions={1s,^-s,(0,f1s,=0 cindent shiftwidth=4 tabstop=8
    "augroup END      

    " Put these in an autocmd group, so that we can delete them easily.
    "  augroup vimrcEx
    "  au!
    "  autocmd BufRead *.otl set filetype=otl
    " *.txt is not regognized by default...
    "autocmd BufNewFile,BufRead *.txt setlocal filetype=text
    " For all text files set 'textwidth' to 78 characters.
    " autocmd FileType text setlocal textwidth=78 wrap


    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost * 
                \ highlight Cursor guifg=darkblue guibg=yellow |
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif 
    " Reload vimrc automatically after write
    "autocmd! bufwritepost vimrc source %
    "
    "autocmd BufWritePre * :WriteBackup 

    autocmd bufWritePre * call WriteToHg()
    autocmd bufWritePost * call WriteToHgPost() 

augroup END

else

    set autoindent		" always set autoindenting on

endif " has("autocmd")


"""PLUGINGS""""

"""""""""""""Patchreview plugin """"""""""""
"The Patch Review plugin allows easy single or multipatch code or diff reviews.
let g:patchreview_tmpdir = 'c:\\tmp'
let g:patchreview_filterdiff = $Home . '\\bin\\filterdiff.bat'
let g:patchreview_patch = $HOME .'\\bin\\patch.bat'

function! Get_patchreview_input()
  call inputsave()
  let g:patch_review_input = input("patch file: ", "", "file")
  call inputrestore()
endfunction
amenu Omat.Patchreview :call Get_patchreview_input()<cr>:exe "PatchReview " . g:patch_review_input<cr>

""" CTAGS """"
"function! ExecuteCtags()
"    :!ctags -R -I CLASS=class -I EXPORT_MACRO -I __declspec+ --c++-kinds=+p --fields=+iaS --extra=+q  
"endfunction
"" Update Ctags
"map <localleader>tt :call ExecuteCtags()<cr>
"amenu Omat.C++Tags<tab>,tt :call ExecuteCtags()<cr>


"*************A.vim************
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

" do not create file if it does not exist
let g:alternateNoDefaultAlternate=1



function! WriteToHg()
"test if the file exists, if not crete it
    if !filereadable("%:p")
        exe "silent!echo " . '"" > '.'"' .  expand("%:p") . '"'
    endif
    
    let addcmd="hg add " .'"'. expand("%:p") .'"'
    let output=system(addcmd)

    " add and commit the file, it does not matter if the file already exists
    let statuscmd='hg status ' .'"'. expand('%:p').'"'
    let output=system(statuscmd)
    " if file is not added, add it
    if(output =~ '^A.*')
        let commitcmd="hg commit ". ' -m "autoadd ' . expand("%:p") .'"' .' "'. expand("%:p") .'"' 
        try
            let output=system(commitcmd)
            if output == "abort: cannot commit over an applied mq patch\n"
                let qrefreshcmd='hg qrefresh -s -m "' . "autoadd " .'" '.' "' .expand('%:p').'"'
                let output=system(qrefreshcmd)
            endif
            redraw | echom output 
        endtry
    endif
endfunction


function! WriteToHgPost()

    let statuscmd='hg status ' . '"' .expand('%:p').'"'
    let output=system(statuscmd)
    if(output =~ '^M.*')
        let logentry= input(expand('%:p').": Log or (d)iff:  ")
        if logentry==""
            redraw | echom "\n no commit"
            return
        endif
        if logentry=='diff' || logentry =='d'
            let logcmd='hg bc3diff '.'"' .expand('%:p').'"'
            let output=system(logcmd)
            let logentry= input(output . " log:"  )
        endif
            let commitcmdpost="hg commit ". ' -m "'.logentry.'"' . ' "'.expand("%:p") .'"'
            let output=system(commitcmdpost)

        if output == "" 
            redraw | echom "Commit succesfull"
        elseif output == "abort: cannot commit over an applied mq patch\n"
            let qrefreshcmd='hg qrefresh -s -m "' . logentry .'" '.' "' .expand('%:p').'"'
            let output=system(qrefreshcmd)
        else
            redraw | echom output
        endif
    else
        redraw | echo "no changes to commit"
    endif
endfunction



function! GuiTabLabel()
    let label=''
    if exists("t:title")
        let label=t:title
    endif
    return label
endfunction

function! SetTitle(newLabel)
    let t:title=a:newLabel
    set guitablabel=%{GuiTabLabel()}
endfunction

command! -nargs=1 TabTitle :call SetTitle(<f-args>)

command! -nargs=1 Grep :call Grepfiles(<f-args>)
function! Grepfiles(args)
    exe 'grep -I -R -i --exclude=tags "'.a:args.'" .'
    cope
endfunction




function! RunFnId2()
    let id_file = g:LID_File

    let skip_pat = ''
    let match_pat = ''

    " Get the identifier from the user, if it is not already supplied
    let id = input('Lookup identifier: ', expand('<cword>'))
    if id == ''
        return
    endif


    echo "\n"


    if !filereadable(id_file)
        echo "check g:LID_File setting"
    endif
    let old_efm = &efm
    set efm=%f

    let cmd = 'fnid' . ' -S newline --file ' . id_file . ' '
    let cmd = cmd . g:LID_Shell_Quote_Char . id . g:LID_Shell_Quote_Char

    execute 'silent! cex system(cmd)'

    let &efm = old_efm
    cope
endfunction

command! -nargs=? -complete=tag FnId call RunFnId2(<f-args>)


"fu! s:readline(f)
"    let line = remove(a:f,0)
"    if line =~ '.*\\$'
"        "echo "readline: " . line
"        let line = substitute(line,'\\$','','')
"        return line . s:readline(a:f)
"    else
"        return line
"    endif
"endfu

fu! s:readline(f)
    let output = ''
    " Do while we have '\' at the end of line
    while a:f[0] =~ '.*\\$'
        let line = remove(a:f,0)
        let line = substitute(line,'\\$','','')
        let output = output . line
    endwhile
    " Add last line without '\' to output
    return (output . remove(a:f,0))
endfu



fu! OpenMakefile(filename)
    let regexp='\([\\$().A-Za-z0-9_ ]\+\)[=:]\s\+\(.*\)'
    let values={}
    let files=[]
    let Makefile=readfile(a:filename)

    while 1
        let line = s:readline(Makefile)
        if len(Makefile)==0
            break
        endif

        if len(line) == 0
            continue
        endif
        "echo "line:" . line
        let m=matchstr(line,regexp)
        "echo "m:" . m
        if len(m) != 0
            "echo m
            let name = substitute(line,regexp,'\1','')
            let name = substitute(name,'^\s*','','') "remove leading spaces
            let name = substitute(name,'\s*$','','') "remove trailing spaces

            for item in split(name)
                let value= substitute(line,regexp,'\2','')
                if has_key(values,item)
                    let values[item]=values[item] . ' ' . value 
                else
                    let values[item] = value
                endif
            endfor
        endif 
    endwhile
    "echo values 
    for obj in split(values['LINK_OBJSUDEB'])
        for i in split(values[obj])
            if count(files,i) < 1
                call add(files,i)
            endif
        endfor
    endfor
    return files
endfunction

fu! OpenMakefileARMV5(filename)
    let regexp='\([\\$().A-Za-z0-9_ ]\+\)[=:]\s\+\(.*\)'
    let values={}
    let files=[]
    let Makefile=readfile(a:filename)

    while 1
        let line = s:readline(Makefile)
        if len(Makefile)==0
            break
        endif

        if len(line) == 0
            continue
        endif
        let m=matchstr(line,regexp)
        if len(m) != 0
            "echo m
            let name = substitute(line,regexp,'\1','')
            let name = substitute(name,'^\s*','','') "remove leading spaces
            let name = substitute(name,'\s*$','','') "remove trailing spaces

            for item in split(name)
                let value= substitute(line,regexp,'\2','')
                if has_key(values,item)
                    let values[item]=values[item] . ' ' . value 
                else
                    let values[item] = value
                endif
            endfor
        endif 
    endwhile
    "echo values 
    for obj in split(values['OBJECTSUDEB'])
        for i in split(values[obj])
            if count(files,i) < 1
                call add(files,i)
            endif
        endfor
    endfor
    return files
endfunction


fu! s:groupFiles(f)
    let files={}
    for file in a:f
        let path=substitute(file,'\(\\.*\)\\\(.*\)','\1','')
        "echo path
        let fileName=substitute(file,'\(\\.*\\\)\(.*\)','\2','')
        "echo fileName
        if has_key(files,path)
            let files[path]=files[path] . ' ' . fileName 
        else
            let files[path]=fileName
        endif
    endfor
    return files
endfu

fu! s:createProject(fileList,f)
    let projectName=substitute(a:f,'.mmp$','','')
    let path = getcwd() 
    let driveletter=split(path,'\\')[0]
    let p=[]
    let p += [ projectName . '=' . path . ' IN=' . projectName . '_in.vim CD=' . path . ' {' ]
    for path in keys(a:fileList)
        let p += [' ' . path . '=' . driveletter . path . " {"]
        let tmp = split(a:fileList[path]) " list of files
        let files =  sort(tmp) " Sorted list of files in project
        " echo join(files)
        for file in files
            let p += ['  ' . file ]
        endfor
        let p += [" }"]
    endfor
    let p += ["}"]
    Project
    call append(0,p)

endfu


fu! s:createInVim(paths,f)
    let project=substitute(a:f,'.mmp$', '','')

    let ctagsParams=[] 
    let ctagsParams += [ '--fields=+iaS' ]
    let ctagsParams += [ '--extra=+q' ]
    let ctagsParams += [ '--c-kinds=+lpx' ]
    let ctagsParams += [ '--langmap=c++:+.hrh.HRH -h +.hrh.HRH' ]
    let ctagsParams += [ '-I NONSHARABLE_CLASS=class' ]
    let ctagsParams += [ '-I IMPORT_C' ]
    let ctagsParams += [ '-I EXPORT_C' ]
    let ctagsParams += [ ' -L ' . project . "_files.txt" ]

    let g:ctagsCmd = g:lctags_cmd . ' ' . join(ctagsParams) 
    let p = []
    let p += [ "let g:CurrProject='" .project . "'" ]
    let p += [ "let g:ctagsCmd='" . g:ctagsCmd ."'"]
    let p += [ "set path=" . a:paths ]
    let p += [ "set tags=" . getcwd() . "\\tags,./tags" ] 
    let p += [ "let g:proj_run1='cd %D | call UpdateTags(g:CurrProject ." . '".mmp")' ."'" ]
    let p += [ "let g:proj_run2='cd %D | call system(g:ctagsCmd)"  ."'" ]
    call writefile(p, project. '_in.vim')
endfu

fu! UpdateTags(f)
    call ProcessDepFiles(a:f)
    call system(g:ctagsCmd)
endfu

fu! ProcessDepFiles(f)
    let cwd=getcwd()

    let cmd = "cd " . cwd . "&perl -S makmake.pl " . a:f . " winscw"
    let ret=system(cmd)
    if v:shell_error
        echo 'error ' . ret
        return
    endif	
    let project=substitute(a:f,'.mmp$', '','')
    let makeFile=substitute(a:f,'mmp$', 'winscw','')
    let files=OpenMakefile(makeFile)
    call writefile(files, project . '_files.txt')
    call delete(makeFile)
    return files
endfu

fu! ProcessDepFilesARMV5(f)
    let cwd=getcwd()

    let cmd = "cd " . cwd . "&perl -S makmake.pl " . a:f . " ARMV5"
    let ret=system(cmd)
    if v:shell_error
        echo 'error ' . ret
        return
    endif	
    let project=substitute(a:f,'.mmp$', '','')
    let makeFile=substitute(a:f,'mmp$', 'ARMV5','')
    let files=OpenMakefileARMV5(makeFile)
    call writefile(files, project . '_files.txt')
    call delete(makeFile)
    return files
endfu


fu! OpenMMP(f, ...)
    if a:0 == 0 " WINSCW
        let files=ProcessDepFiles(a:f)
    elseif a:1 == 'ARMV5'
        let files=ProcessDepFilesARMV5(a:f)
    else
        return
    endif

    let fileList =  s:groupFiles(files)
    call s:createInVim(join(keys(fileList),','), a:f)
    call s:createProject(fileList,a:f)
    call system(g:ctagsCmd)
endfu

command! -nargs=+ -complete=file MMP call OpenMMP(<f-args>)
fu! LogClean()
    " remove ^M lines
    silent %s/
    //
    " put trace lines together
    silent %s/\(<D>.*\)\n\?\(.*<\)\n\?\(\/\)\n\?\(D\)\n\?\(>\)/\1\2\3\4\5
    " separate different lnes
    silent %s/<\/D>/<\/D>
    /g
    " remove empty lines
    silent %s/^\n//g

    let filename=@% " get current file 

    "let tmpfile = tempname()
    exe "silent write! " . filename
    "exe "silent bd!"
    exe "silent vimgrep /<D>/ " . filename
    exe "silent cope"

endfu
command! CL call LogClean()

"au! CursorHold *.cpp nested call PreviewWord()
"func PreviewWord()
"    if &previewwindow			" don't do this in the preview window
"        return
"    endif
"    let w = expand("<cword>")		" get the word under cursor
"    if w =~ '\a'			" if the word contains a letter
"
"        " Delete any existing highlight before showing another tag
"        silent! wincmd P			" jump to preview window
"        if &previewwindow			" if we really get there...
"            match none			" delete existing highlight
"            wincmd p			" back to old window
"        endif
"
"        " Try displaying a matching tag for the word under the cursor
"        try
"            exe "ptag " . w
"        catch
"            return
"        endtry
"
"        silent! wincmd P			" jump to preview window
"        if &previewwindow		" if we really get there...
"            if has("folding")
"                silent! .foldopen		" don't want a closed fold
"            endif
"            call search("$", "b")		" to end of previous line
"            let w = substitute(w, '\\', '\\\\', "")
"            call search('\<\V' . w . '\>')	" position cursor on match
"            " Add a match highlight to the word at this position
"            hi previewWord term=bold ctermbg=green guibg=green
"            exe 'match previewWord "\%' . line(".") . 'l\%' . col(".") . 'c\k*"'
"            wincmd p			" back to old window
"        endif
"    endif
"endfun
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
            \ | wincmd p | diffthis

command! -nargs=1 DIFFSPLIT diffsplit <args>

"http://vim.wikia.com/wiki/Display_shell_commands%27_output_on_Vim_window
"The new :Shell command works just like :! except that it opens a Vim scratch window 
"and prints the command output there. The scratch window will be wiped out completely when it's closed
command! -complete=file -nargs=+ Shell call RunShellCommand(<q-args>)
function! RunShellCommand(cmdline)
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    setlocal nowrap
    call setline(1,a:cmdline)
    call setline(2,substitute(a:cmdline,'.','=','g'))
    execute 'silent 2read !'.escape(a:cmdline,'%#')
    setlocal nomodifiable
    1
endfunction

