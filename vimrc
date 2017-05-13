
"==========================================
" Author:  wklken
" Version: 9.1
" Email: wklken@yeah.net
" BlogPost: http://www.wklken.me
" ReadMe: README.md
" Donation: http://www.wklken.me/pages/donation.html
" Last_modify: 2015-12-15
" Sections:
"       -> Initial Plugin ���ز��
"       -> General Settings ��������
"       -> Display Settings չʾ/�Ű�Ƚ����ʽ����
"       -> FileEncode Settings �ļ���������
"       -> Others ��������
"       -> HotKey Settings  �Զ����ݼ�
"       -> FileType Settings  ����ļ����͵�����
"       -> Theme Settings  ��������
"
"       -> ������ú;���������vimrc.bundles��
"==========================================

"==========================================
" Initial Plugin ���ز��
"==========================================

" �޸�leader��
let mapleader = ','
let g:mapleader = ','

"let g:python3_host_prog  = 'C:\Python36\python.exe'
" Skip the check of neovim module
"let g:python3_host_skip_check = 1



" �����﷨����
syntax on

" install bundles
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
elseif filereadable(expand("~/.config/nvim/vimrc.bundles")) " neovim
  source ~/.config/nvim/vimrc.bundles
endif

" ensure ftdetect et al work by including this after the bundle stuff
filetype plugin indent on

" NOTE: ������������ϸ˵����һЩ���Բ�ϲ������ֱ��ע���

"==========================================
" General Settings ��������
"==========================================


" history�洢����
set history=2000

" ����ļ�����
filetype on
" ��Բ�ͬ���ļ����Ͳ��ò�ͬ��������ʽ
filetype indent on
" ������
filetype plugin on
" �����Զ���ȫ
filetype plugin indent on

" �ļ��޸�֮���Զ�����
set autoread
" ������ʱ����ʾ�Ǹ�Ԯ���ڸɴ��ͯ����ʾ
set shortmess=atI

" ����,����һ��λ��. ��ֹ��ɾ, Ŀǰ��ȡ������
"set backup
"set backupext=.bak
"set backupdir=/tmp/vimbk/

" ȡ�����ݡ� ������Լ���
set nobackup
" �رս����ļ�
set noswapfile


" TODO: remove this, use gundo
" create undo file
" if has('persistent_undo')
  " " How many undos
  " set undolevels=1000
  " " number of lines to save for undo
  " set undoreload=10000
  " " So is persistent undo ...
  " "set undofile
  " set noundofile
  " " set undodir=/tmp/vimundo/
" endif

set wildignore=*.swp,*.bak,*.pyc,*.class,.svn

" ͻ����ʾ��ǰ��
set cursorcolumn
" ͻ����ʾ��ǰ��
set cursorline


" ���� �˳�vim��������ʾ���ն���Ļ, �������ڲ鿴�͸���, ����Ҫ����ȥ��
" �ô�����ɾʲô�ģ������ǰ��Ļ�򿪣������һ�
set t_ti= t_te=


" ����ݲ�����, ���̵�....
set mouse-=a
" �������
" set mouse=a
" Hide the mouse cursor while typing
" set mousehide


" �޸�ctrl+m �������ѡ���bug�����Ǹı���ctrl+v�����ַ�ѡ��ʱ����������µ��ַ�
set selection=inclusive
set selectmode=mouse,key

" change the terminal's title
set title
" ȥ������������ʾ����
set novisualbell
set noerrorbells
set t_vb=
set tm=500

" Remember info about open buffers on close
set viminfo^=%

" For regular expressions turn magic on
set magic

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"==========================================
" Display Settings չʾ/�Ű�Ƚ����ʽ����
"==========================================

" ��ʾ��ǰ���к��к�
set ruler
" ��״̬����ʾ�������������
set showcmd
" ���½���ʾ��ǰvimģʽ
set showmode

" �������ƶ����ʱ�������Ϸ����·����ٻᱣ����ʾ������
set scrolloff=7

" set winwidth=79

" �����У���״̬���£��ĸ߶ȣ�Ĭ��Ϊ1��������2
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
" Always show the status line - use 2 lines for the status bar
set laststatus=2

" ��ʾ�к�
set number
" ȡ������
set nowrap

" ����������, ��ת������һ��ƥ�������
set showmatch
" How many tenths of a second to blink when matching brackets
set matchtime=2


" ������������������ʾ
" ����search���е��ı�
set hlsearch
" ����������ģʽ,���ż��뼴ʱ����
set incsearch
" ����ʱ���Դ�Сд
set ignorecase
" ��һ�������ϴ�д��ĸʱ�Դ�Сд����
set smartcase

" �����۵�
set foldenable
" �۵�����
" manual    �ֹ��۵�
" indent    ʹ��������ʾ�۵�
" expr      ʹ�ñ��ʽ�����۵�
" syntax    ʹ���﷨�����۵�
" diff      ��û�и��ĵ��ı������۵�
" marker    ʹ�ñ�ǽ����۵�, Ĭ�ϱ���� {{{ �� }}}
set foldmethod=indent
set foldlevel=99
" �����۵��Զ����ݼ� <leader>zz
let g:FoldMethod = 0
map <leader>zz :call ToggleFold()<cr>
fun! ToggleFold()
    if g:FoldMethod == 0
        exe "normal! zM"
        let g:FoldMethod = 1
    else
        exe "normal! zR"
        let g:FoldMethod = 0
    endif
endfun

" ��������
" Smart indent
set smartindent
" ���Զ�����
" never add copyindent, case error   " copy the previous indentation on autoindenting
set autoindent

" tab��ر��
" ����Tab���Ŀ��        [��ͬ�Ŀո����]
set tabstop=4
" ÿһ��������Ӧ�Ŀո���
set shiftwidth=4
" ���˸��ʱ����һ��ɾ�� 4 ���ո�
set softtabstop=4
" insert tabs on the start of a line according to shiftwidth, not tabstop ���˸��ʱ����һ��ɾ�� 4 ���ո�
set smarttab
" ��Tab�Զ�ת���ɿո�[��Ҫ����������Tab��ʱ��ʹ�� Ctrl+V + Tab]
set expandtab
" ����ʱ��ȡ�� use multiple of shiftwidth when indenting with '<' and '>'
set shiftround

" A buffer becomes hidden when it is abandoned
set hidden
set wildmode=list:longest
set ttyfast

" 00x��������ʱʹ��ʮ����
set nrformats=

" ����к�: �кű����ԣ������� nj/nk ������ת
set relativenumber number
au FocusLost * :set norelativenumber number
au FocusGained * :set relativenumber
" ����ģʽ���þ����к�, ��ͨģʽ�������
autocmd InsertEnter * :set norelativenumber number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc
nnoremap <C-n> :call NumberToggle()<cr>

" ��ֹtmux��vim�ı���ɫ��ʾ�쳣
" Refer: http://sunaku.github.io/vim-256color-bce.html
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

"==========================================
" FileEncode Settings �ļ�����,��ʽ
"==========================================
" �������ļ��ı���Ϊ UTF-8
set encoding=utf-8
" �Զ��жϱ���ʱ�����γ������±��룺
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
"set langmenu=zh_CN.UTF-8
"set enc=2byte-gb18030
" �������ֻӰ����ͨģʽ (��ͼ�ν���) �µ� Vim
set termencoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" ����Unicodeֵ����255���ı������صȵ��ո�������
set formatoptions+=m
" �ϲ���������ʱ�������м�ӿո�
set formatoptions+=B


"==========================================
" others ��������
"==========================================
" vimrc�ļ��޸�֮���Զ�����, windows
autocmd! bufwritepost _vimrc source %
" vimrc�ļ��޸�֮���Զ�����, linux
autocmd! bufwritepost .vimrc source %

" �Զ���ȫ����
" ��Vim�Ĳ�ȫ�˵���Ϊ��һ��IDEһ��(�ο�VimTip1228)
set completeopt=longest,menu

" ��ǿģʽ�е��������Զ���ɲ���
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

" �뿪����ģʽ���Զ��ر�Ԥ������
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" �س���ѡ�е�ǰ��
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
" quickfix window  s/v to open in split window,  ,gd/,jd => quickfix window => open it
autocmd BufReadPost quickfix nnoremap <buffer> v <C-w><Enter><C-w>L
autocmd BufReadPost quickfix nnoremap <buffer> s <C-w><Enter><C-w>K

" command-line window
autocmd CmdwinEnter * nnoremap <buffer> <CR> <CR>


" �������Ҽ�����Ϊ ����ʾ������Ϣ
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" ���Զ���λ�����༭��λ��, ��Ҫȷ�� .viminfo ��ǰ�û���д
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"==========================================
" HotKey Settings  �Զ����ݼ�����
"==========================================

" ��Ҫ�����ض���

" �رշ����, ǿ���Լ��� hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

"Treat long lines as break lines (useful when moving around in them)
"se swap֮��ͬ����������ֱ����
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

" F1 - F6 ����

" F1 ���������,��ֹ����ϵͳ����
" I can type :help on my own, thanks.  Protect your fat fingers from the evils of <F1>
noremap <F1> <Esc>"

" F2 �кſ��أ�������긴�ƴ�����
" Ϊ���㸴�ƣ���<F2>����/�ر��к���ʾ:
function! HideNumber()
  if(&relativenumber == &number)
    set relativenumber! number!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
" F3 ��ʾ�ɴ�ӡ�ַ�����
nnoremap <F3> :set list! list?<CR>
" F4 ���п���
nnoremap <F4> :set wrap! wrap?<CR>

" F6 �﷨���أ��ر��﷨���Լӿ���ļ���չʾ
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>

set pastetoggle=<F5>            "    when in insert mode, press <F5> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

" F5 set paste�����ѽ��, ճ������ǰ����Ҫ��F5��
" F5 ճ��ģʽpaste_mode����,�����и�ʽ�Ĵ���ճ��
" Automatically set paste mode in Vim when pasting in insert mode
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()



" ���������ƶ�, Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" http://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <Leader>z :ZoomToggle<CR>


" Go to home and end using capitalized directions
noremap H ^
noremap L $


" Map ; to : and save a million keystrokes ���ڿ��ٽ���������
nnoremap ; :


" ������ģʽ��ǿ��ctrl - a�����ף� -e ����β
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>


" �������
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
" ��������Use sane regexes"
nnoremap / /\v
vnoremap / /\v

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" ȥ����������
noremap <silent><leader>/ :nohls<CR>

" switch # *
nnoremap # *
nnoremap * #

" for # indent, python�ļ�����������ʱ#��ע�Ͳ��л�����
autocmd BufNewFile,BufRead *.py inoremap # X<c-h>#


" tab/buffer���

" �л�ǰ��buffer
nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
" ʹ�÷�����л�buffer
noremap <left> :bp<CR>
noremap <right> :bn<CR>


" tab ����
" http://vim.wikia.com/wiki/Alternative_tab_navigation
" http://stackoverflow.com/questions/2005214/switching-to-a-particular-tab-in-vim

" tab�л�
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>

map <leader>tj :tabnext<cr>
map <leader>tk :tabprev<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>

map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>

" normalģʽ���л���ȷ�е�tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
" nnoremap <leader>gt :execute 'tabnext ' . g:last_active_tab<cr>
" nnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
" vnoremap <silent> <c-o> :execute 'tabnext ' . g:last_active_tab<cr>
nnoremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" �½�tab  Ctrl+t
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>


" => ѡ�м������ļ�

" �����������Զ�ѡ�У������ٴβ���
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
map Y y$

" ����ѡ������ϵͳ���а���
vnoremap <leader>y "+y

" auto jump to end of select
" vnoremap <silent> y y`]
" vnoremap <silent> p p`]
" nnoremap <silent> p p`]

" select all
map <Leader>sa ggVG

" select block
nnoremap <leader>v V`}

" w!! to sudo & write a file
cmap w!! w !sudo tee >/dev/null %

" kj �滻 Esc
inoremap kj <Esc>

" ����Speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>


" Jump to start and end of line using the home row keys
" ��ǿtab����, ���������������, ���ǻ���
"nmap t o<ESC>k
"nmap T O<ESC>j

" Quickly close the current window
nnoremap <leader>q :q<CR>

" Quickly save the current file
nnoremap <leader>w :w<CR>

" ���� ' `, ʹ�ÿ��Կ���ʹ��'����markedλ��
nnoremap ' `
nnoremap ` '

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"==========================================
" FileType Settings  �ļ���������
"==========================================

" ����༭�ļ����͵�һ�����ã����粻Ҫ tab ��
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
autocmd FileType ruby,javascript,html,css,xml set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
autocmd BufRead,BufNewFile *.md,*.mkd,*.markdown set filetype=markdown.mkd
autocmd BufRead,BufNewFile *.part set filetype=html
" disable showmatch when use > in php
au BufWinEnter *.php set mps-=<:>



" ����python�ļ�ʱɾ������ո�
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" ���庯��AutoSetFileHead���Զ������ļ�ͷ
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "����ļ�����Ϊ.sh�ļ�
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "����ļ�����Ϊpython
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc


" ���ÿ��Ը����Ĺؼ���
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|CHANGED\|DONE\|XXX\|BUG\|HACK\)')
    autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|NOTICE\)')
  endif
endif

"==========================================
" TEMP ����, ��δȷ��Ҫ��Ҫ
"==========================================

" tmux
" function! WrapForTmux(s)
"   if !exists('$TMUX')
"     return a:s
"   endif
"
"   let tmux_start = "\<Esc>Ptmux;"
"   let tmux_end = "\<Esc>\\"
"
"   return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
" endfunction
"
" let &t_SI .= WrapForTmux("\<Esc>[?2004h")
" let &t_EI .= WrapForTmux("\<Esc>[?2004l")

" allows cursor change in tmux mode
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" if exists('$TMUX')
    " let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    " let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" endif


"==========================================
" Theme Settings  ��������
"==========================================

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco:h14
    if has("gui_gtk2")   "GTK2
        set guifont=Monaco\ 12,Monospace\ 12
    endif
    set guioptions-=T
    set guioptions+=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif



" theme����
set background=dark
set t_Co=256

colorscheme solarized
" colorscheme molokai
" colorscheme desert


" ���ñ��һ�еı�����ɫ������һ����ɫһ��
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

" for error highlight����ֹ�������б�쵼�¿�����
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
