call pathogen#runtime_append_all_bundles()
call pathogen#helptags()


"**********************************************
" VIM Global settings 
"**********************************************

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

" make quickfix window always to appear with full window width
:botright cwindow

"disable toolbar icons on top of window
:set guioptions-=T

filetype plugin on

" see <URL:vimscript:he cot>
" show menu of possible selections
" When "longest" is not present, VIM automatically selects first entry
" of the popup menu.
set completeopt=menu,longest
" enter selects 

"set grep program
"if set to internal, then vimgrep is used.
set grepprg=grep\ -n

"autoread changed files
set autoread

" see <URL:vimscript:help autowrite>
set autowrite

" always have syntax highlighting in with the gui:
syntax on

"use dark background
colorscheme candy


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


" Switch syntax highlighting oon, when the terminal has colors
" Also switch off highlighting the last used search pattern (mark plugin
" handles the highlights of searches).
if &t_Co > 2 || has("gui_running")
    syntax on
    set nohlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype on
    filetype plugin indent on


    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost * 
                \ highlight Cursor guifg=darkblue guibg=yellow |
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif 
    augroup END
else
    set autoindent		" always set autoindenting on
endif " has("autocmd")


"*********************************************************
"Keyboard Mappings
"*********************************************************
" map ö to go-to-start-of-line
map ö ^
" map ä to go-to-end-of-line
map ä $
" Format paragraph
map Q gwap


" Copy line from current window to right left
map <localleader>cr Y :wincmd l<cr>O<ESC>gp:wincmd h<cr>
map <localleader>cl Y :wincmd h<cr>O<ESC>gp:wincmd l<cr>
map <localleader>mr D :wincmd l<cr>O<ESC>gp:wincmd h<cr>
map <localleader>ml D :wincmd h<cr>O<ESC>gp:wincmd l<cr>

" Select Buffer
map <leader>b :SelectBuf<CR>
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
map <localleader>t <C-W>}

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
        :NERDTree $HOME
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

"**************************************************
"omnicomplete.vim
"**************************************************
"e see <URL:vimscript:he OmniCpp_ShowPrototypeInAbbr>
set omnifunc=syntaxcomplete#Complete " override built-in C omnicomplete with C++ OmniCppComplete plugin
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_DisplayMode         = 1
let OmniCpp_ShowScopeInAbbr     = 0 "do not show namespace in pop-up
let OmniCpp_ShowPrototypeInAbbr = 1 "show prototype in pop-up
let OmniCpp_ShowAccess          = 1 "show access in pop-up
let OmniCpp_SelectFirstItem     = 1 "select first item in pop-up
set completeopt=menuone,menu,longest

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"



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
" MARK
"************************

nmap  <silent> * <Plug>MarkSet
vmap  <silent> * <Plug>MarkSet
nmap  <silent> n <Plug>MarkSearchCurrentNext
nmap  <silent> N <Plug>MarkSearchCurrentPrev
let g:mwAutoLoadMarks = 1
nmap <Plug>IgnoreMarkSearchNext <Plug>MarkSearchNext
nmap <Plug>IgnoreMarkSearchPrev <Plug>MarkSearchPrev
"***********************************************************
" showmarks.vim
"***********************************************************
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

highlight ShowMarksHLl guifg='black' guibg='red'
highlight ShowMarksHLu guifg='black' guibg='yellow'
let g:showmarks_textlower=">"
let g:showmarks_textupper=">"








command! -nargs=1 Grep :call Grepfiles(<f-args>)
function! Grepfiles(args)
    exe 'grep -I -R -i --exclude=tags "'.a:args.'" .'
    cope
endfunction


