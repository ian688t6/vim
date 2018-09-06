"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Maintainer: 

"       Amir Salihefendic

"       http://amix.dk - amix@amix.dk

"

" Version: 

"       5.0 - 29/05/12 15:43:36

"

" Blog_post: 

"       http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github

"

" Awesome_version:

"       Get this config, nice color schemes and lots of plugins!

"

"       Install the awesome version from:

"

"           https://github.com/amix/vimrc

"

" Syntax_highlighted:

"       http://amix.dk/vim/vimrc.html

"

" Raw_version: 

"       http://amix.dk/vim/vimrc.txt

"

" Sections:

"    -> General

"    -> VIM user interface

"    -> Colors and Fonts

"    -> Files and backups

"    -> Text, tab and indent related

"    -> Visual mode related

"    -> Moving around, tabs and buffers

"    -> Status line

"    -> Editing mappings

"    -> vimgrep searching and cope displaying

"    -> Spell checking

"    -> Misc

"    -> Helper functions

"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => General

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember

set history=700

set nocompatible

" Set mouse
" set mouse=a

" Enable filetype plugins

" filetype plugin on

" filetype indent on


" Set to auto read when a file is changed from the outside

set autoread


" With a map leader it's possible to do extra key combinations

" like <leader>w saves the current file

let mapleader = ","

let g:mapleader = ","


" Fast saving

nmap <leader>w :w!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => VIM user interface

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set 7 lines to the cursor - when moving vertically using j/k

set so=7


" Turn on the WiLd menu

set wildmenu


" Ignore compiled files

set wildignore=*.o,*~,*.pyc


"Always show current position

set ruler


" Height of the command bar

set cmdheight=2


" A buffer becomes hidden when it is abandoned

set hid


" Configure backspace so it acts as it should act

set backspace=eol,start,indent

set whichwrap+=<,>,h,l


" Ignore case when searching

set ignorecase


" When searching try to be smart about cases 

set smartcase


" Highlight search results

set hlsearch


" Makes search act like search in modern browsers

set incsearch


" Don't redraw while executing macros (good performance config)

set lazyredraw


" For regular expressions turn magic on

set magic


" Show matching brackets when text indicator is over them

set showmatch

" How many tenths of a second to blink when matching brackets

set mat=2


" No annoying sound on errors

set noerrorbells

set novisualbell

set t_vb=

set tm=500

set autoindent

set nu

if filereadable(expand("~/.vimrc.bundles"))
	source ~/.vimrc.bundles
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Colors and Fonts

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting

syntax on


set ruler "开启右下角状态栏说明

colorscheme molokai " desert256v2

set background=dark

set t_Co=256

" Set extra options when running in GUI mode

if has("gui_running")

    set guioptions-=T

    set guioptions+=e

    set t_Co=256

    set guitablabel=%M\ %t

endif


" Set utf8 as standard encoding and en_US as the standard language

set encoding=utf8


" Use Unix as the standard file type

set ffs=unix,dos,mac



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Files, backups and undo

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...

set nobackup

set nowb

set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Text, tab and indent related

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set ts=4
set noexpandtab


" Be smart when using tabs ;)

"set smarttab

    
" 1 tab == 4 spaces

" set shiftwidth=4

" set softtabstop=4


" Linebreak on 500 characters

set lbr

set tw=500


set ai "Auto indent

set si "Smart indent

set wrap "Wrap lines



""""""""""""""""""""""""""""""

" => Visual mode related

""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection

" Super useful! From an idea by Michael Naumann

vnoremap <silent> * :call VisualSelection('f')<CR>

vnoremap <silent> # :call VisualSelection('b')<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Moving around, tabs, windows and buffers

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)

map j gj

map k gk


" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)

map <space> /

map <c-space> ?


" Disable highlight when <leader><cr> is pressed

map <silent> <leader><cr> :noh<cr>


" Smart way to move between windows

map <C-j> <C-W>j

map <C-k> <C-W>k

map <C-h> <C-W>h

map <C-l> <C-W>l


" Close the current buffer

map <leader>bd :Bclose<cr>


" Close all the buffers

map <leader>ba :1,1000 bd!<cr>


" Useful mappings for managing tabs

map <leader>tn :tabnew<cr>

map <leader>to :tabonly<cr>

map <leader>tc :tabclose<cr>

map <leader>tm :tabmove


" Opens a new tab with the current buffer's path

" Super useful when editing files in the same directory

map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


" Switch CWD to the directory of the open buffer

map <leader>cd :cd %:p:h<cr>:pwd<cr>


" Specify the behavior when switching between buffers 

try

  set switchbuf=useopen,usetab,newtab

  set stal=2

catch

endtry



" Remember info about open buffers on close

set viminfo^=%



""""""""""""""""""""""""""""""

" => Status line

""""""""""""""""""""""""""""""

" Always show the status line

set laststatus=2


" Format the status line

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


inoremap " ""<ESC>i

inoremap ( ()<ESC>i

inoremap [ []<ESC>i

inoremap { {}<ESC>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Editing mappings

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap VIM 0 to first non-blank character

map 0 ^


" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac

nmap <M-j> mz:m+<cr>`z

nmap <M-k> mz:m-2<cr>`z

vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z

vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z


if has("mac") || has("macunix")

  nmap <D-j> <M-j>

  nmap <D-k> <M-k>

  vmap <D-j> <M-j>

  vmap <D-k> <M-k>

endif


" Delete trailing white space on save, useful for Python and CoffeeScript ;)

func! DeleteTrailingWS()

  exe "normal mz"

  %s/\s\+$//ge

  exe "normal `z"

endfunc

autocmd BufWrite *.py :call DeleteTrailingWS()

autocmd BufWrite *.coffee :call DeleteTrailingWS()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => vimgrep searching and cope displaying

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When you press gv you vimgrep after the selected text

vnoremap <silent> gv :call VisualSelection('gv')<CR>


" Open vimgrep and put the cursor in the right position

map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>


" Vimgreps in the current file

map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>


" When you press <leader>r you can search and replace the selected text

vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>


" Do :help cope if you are unsure what cope is. It's super useful!

"

" When you search with vimgrep, display your results in cope by doing:

"   <leader>cc

"

" To go to the next search result do:

"   <leader>n

"

" To go to the previous search results do:

"   <leader>p

"

map <leader>cc :botright cope<cr>

map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg

map <leader>n :cn<cr>

map <leader>p :cp<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Spell checking

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pressing ,ss will toggle and untoggle spell checking

map <leader>sl :setlocal spell!<cr>


" Shortcuts using <leader>

map <leader>sn ]s

map <leader>sp [s

map <leader>sa zg

map <leader>s? z=



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Misc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remove the Windows ^M - when the encodings gets messed up

noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


" Quickly open a buffer for scripbble

map <leader>q :e ~/buffer<cr>


" Toggle paste mode on and off

map <leader>pp :setlocal paste!<cr>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => Helper functions

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! CmdLine(str)

    exe "menu Foo.Bar :" . a:str

    emenu Foo.Bar

    unmenu Foo

endfunction


function! VisualSelection(direction) range

    let l:saved_reg = @"

    execute "normal! vgvy"


    let l:pattern = escape(@", '\\/.*$^~[]')

    let l:pattern = substitute(l:pattern, "\n$", "", "")


    if a:direction == 'b'

        execute "normal ?" . l:pattern . "^M"

    elseif a:direction == 'gv'

        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')

    elseif a:direction == 'replace'

        call CmdLine("%s" . '/'. l:pattern . '/')

    elseif a:direction == 'f'

        execute "normal /" . l:pattern . "^M"

    endif


    let @/ = l:pattern

    let @" = l:saved_reg

endfunction



" Returns true if paste mode is enabled

function! HasPaste()

    if &paste

        return 'PASTE MODE  '

    en

    return ''

endfunction


" Don't close window, when deleting a buffer

command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()

   let l:currentBufNum = bufnr("%")

   let l:alternateBufNum = bufnr("#")


   if buflisted(l:alternateBufNum)

     buffer #

   else

     bnext

   endif


   if bufnr("%") == l:currentBufNum

     new

   endif


   if buflisted(l:currentBufNum)

     execute("bdelete! ".l:currentBufNum)

   endif

endfunction


nmap wm :WMToggle<cr>


nmap <F7>:silent! TlistUpdate<cr>

"-- Taglist setting --

let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行

let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边

let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表

let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏

let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim

"是否一直处理tags.1:处理;0:不处理

let Tlist_Process_File_Always=1 "实时更新tags

let Tlist_Inc_Winwidth=0

nmap tl :Tlist<cr>

nmap ts :split<cr>
nmap rs :vsplit<cr>

set cscopequickfix=s-,c-,d-,i-,t-,e-

"-- Cscope setting --

if has("cscope")

    set csprg=/usr/bin/cscope " 指定用来执行cscope的命令

    set csto=0 " 设置cstag命令查找次序：0先找cscope数据库再找标签文件；1先找标签文件再找cscope数据库

    set cst " 同时搜索cscope数据库和标签文件

    set nocsverb

if filereadable("cscope.out") " 若当前目录下存在cscope数据库，添加该数据库到vim

    cs add cscope.out

elseif $CSCOPE_DB != "" " 否则只要环境变量CSCOPE_DB不为空，则添加其指定的数据库到vim

    cs add $CSCOPE_DB

endif

    set csverb

endif


map <F4> :cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>

imap <F4> <ESC>:cs add ./cscope.out .<CR><CR><CR> :cs reset<CR>

" 将:cs find c等Cscope查找命令映射为<C-_>c等快捷键（按法是先按Ctrl+Shift+-, 然后很快再按下c）

map <leader>ss :cs find s <C-R>=expand("<cword>")<CR><CR>

map <leader>sg :cs find g <C-R>=expand("<cword>")<CR><CR>

map <leader>sc :cs find c <C-R>=expand("<cword>")<CR><CR>

map <leader>st :cs find t <C-R>=expand("<cword>")<CR><CR>

map <leader>se :cs find e <C-R>=expand("<cword>")<CR><CR>

map <leader>sf :cs find f <C-R>=expand("<cfile>")<CR><CR>

map <leader>si :cs find i ^<C-R>=expand("<cfile>")<CR>{1}lt;CR><ESC>

map <leader>sd :cs find d <C-R>=expand("<cword>")<CR><CR><ESC>


map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" NERDtree
map <leader>n :NERDTreeToggle<CR>

