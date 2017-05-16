 "----------------------------------------------------------------------------
 "使用 vim-Plugin 管理插件
 "vim plugin vim-plug control, command model
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
call plug#begin('~/AppData/Local/nvim/plug')
    " 自动补全单引号，双引号等
    Plug 'Raimondi/delimitMate'
    " easymotion
    "更高效的移动 [,, + w/fx/h/j/k/l]
    Plug 'Lokaltog/vim-easymotion'
    "%跳转到匹配的标签
    Plug 'vim-scripts/matchit.zip'
    " 显示marks - 方便自己进行标记和跳转
    " m[a-zA-Z] add mark
    " '[a-zA-Z] go to mark
    " m<Space>  del all marks
    " m/        list all marks
    Plug 'kshenoy/vim-signature'
    " view
    " airline
    " 状态栏增强展示
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " rainbow_parentheses
    " 括号显示增强
    Plug 'kien/rainbow_parentheses.vim'
    " 主题 solarized
    " solarized
    Plug 'altercation/vim-colors-solarized'
    " molokai
    " 主题 molokai
    Plug 'tomasr/molokai'

    
call plug#end()


" 自动补全单引号，双引号等
" delimitMate {{{
    " for python docstring ",优化输入
    au FileType python let b:delimitMate_nesting_quotes = ['"']
    au FileType php let delimitMate_matchpairs = "(:),[:],{:}"
    " 关闭某些类型文件的自动补全
    "au FileType mail let b:delimitMate_autoclose = 0
" }}}

" ################### 快速移动 ###################
    " easymotion {{{
        let g:EasyMotion_smartcase = 1
        "let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
        map <Leader><leader>h <Plug>(easymotion-linebackward)
        map <Leader><Leader>j <Plug>(easymotion-j)
        map <Leader><Leader>k <Plug>(easymotion-k)
        map <Leader><leader>l <Plug>(easymotion-lineforward)
        " 重复上一次操作, 类似repeat插件, 很强大
        map <Leader><leader>. <Plug>(easymotion-repeat)
    " }}}

" ################### 显示增强 ###################
    " airline {{{
        if !exists('g:airline_symbols')
            let g:airline_symbols = {}
        endif
        let g:airline_left_sep = '▶'
        let g:airline_left_alt_sep = '❯'
        let g:airline_right_sep = '◀'
        let g:airline_right_alt_sep = '❮'
        let g:airline_symbols.linenr = '¶'
        let g:airline_symbols.branch = '⎇'
        " 是否打开tabline
    "    let g:airline#extensions#tabline#enabled = 1
    " }}}

" rainbow_parentheses {{{
    " 不加入这行, 防止黑色括号出现, 很难识别
    " \ ['black',       'SeaGreen3'],
    let g:rbpt_colorpairs = [
        \ ['brown',       'RoyalBlue3'],
        \ ['Darkblue',    'SeaGreen3'],
        \ ['darkgray',    'DarkOrchid3'],
        \ ['darkgreen',   'firebrick3'],
        \ ['darkcyan',    'RoyalBlue3'],
        \ ['darkred',     'SeaGreen3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['brown',       'firebrick3'],
        \ ['gray',        'RoyalBlue3'],
        \ ['darkmagenta', 'DarkOrchid3'],
        \ ['Darkblue',    'firebrick3'],
        \ ['darkgreen',   'RoyalBlue3'],
        \ ['darkcyan',    'SeaGreen3'],
        \ ['darkred',     'DarkOrchid3'],
        \ ['red',         'firebrick3'],
        \ ]
    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    au VimEnter * RainbowParenthesesToggle
    au Syntax * RainbowParenthesesLoadRound
    au Syntax * RainbowParenthesesLoadSquare
    au Syntax * RainbowParenthesesLoadBraces
" }}}

" ################### 显示增强-主题 ###################"
    " solarized {{{
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="normal"
        " let g:solarized_termcolors=256
    " }}}
    " molokai {{{
        " monokai原始背景色
        let g:molokai_original = 1
        let g:rehash256 = 1
    " }}}
