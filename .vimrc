
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set copy and paste
" sudo apt-get install vim-gnome
" sudo apt-get install vim-gui-common
" sudo aptitude install vim-full
"
" "+y  copy  
" "+p  paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"关于显示乱码的问题
set fencs=utf-8,GB18030,ucs-bom,default,latin1
"set encoding=gb18030
"设置颜色背景
colorscheme darkblue

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"设置缩进
set tabstop=2
set softtabstop=2
set shiftwidth=2
"set noexpandtab
set expandtab
set autoindent
set cindent
set nu
set hlsearch
set incsearch
"vim折叠设置
"set foldmethod=indent "set default foldmethod
"zi 打开关闭折叠
"zv 查看此行
"zm 关闭折叠
"zM 关闭所有
"zr 打开
"zR 打开所有
"zc 折叠当前行
"zo 打开当前折叠
"zd 删除折叠
"zD 删除所有折叠

"开启光亮光标行
set cursorline
""""""""""""""""""""""""""""""""""""高亮"""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

"开启文件类型侦测
filetype on
"根据侦测到的不同类型加载对应的插件
filetype plugin on
"根据侦测到的不同类型采用不同的缩进
filetype indent on


hi CursorLine cterm=NONE ctermbg=blue ctermfg=white guibg=NONE guifg=NONE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set tags

set tags=tags
set tags+=./tags
" set tags+=/usr/local/Trolltech/Qt-4.8.6/include/tags
" set tags+=/usr/include/GNUstep/tags
" set path+=/home/xkd/work/voicecall-manager/lib/src
set path+=./
"set tags+=/opt/Qt5.3.0/tags
"每次保存文件的时候更新 tags
nmap <F7> :!ctags -R --sort=yes --c++-kinds=+p  --java-kinds=+p --fields=+ialS --extra=+q .<CR>
nmap <F4> :A<CR>
nmap <C-f> :Rgrep<CR>
nmap <F10> :!lookup<CR>
nmap <S-f> :LookupFile<CR>
nmap <C-w> :q<CR>
imap kj <esc>
" "映射LookupFile为,lk
nmap laa :LUTags<cr>
 "映射LUBufs为,ll
 nmap lss :LUBufs<cr>
 "映射LUWalk为,lw
 nmap lww :LUWalk<cr>

"自动添加cscope

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set Taglist
let Tlist_Exit_OnlyWindow=1 
let Tlist_Auto_Open=0
let Tlist_WinWidth=40
let Tlist_WinHeight=100
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
"map <slient> <leader>tl :TlistToggle<cr> (没有作用)
nmap <F2> :TlistToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set NERDTree and Winmanager
let NERDTreeWinPos="right"
let NERDTreeWinSize=25
"let NERDTreeQuitOnOpen=1
"let NERDTreeWinHeight=20  （没有作用）
"let NERDTreeWinWidth=20   （没有作用）
nmap <F3> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"must have,error after wm  and add exe 'q' in winmanager file(1064)
"let g:NERDTree_title="[NERDTree]"
"let g:winManagerWindowLayout="NERDTree|TagList,BufExplorer"

function! NERDTree_Start()
         exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
        return 1
endfunction
nmap wm :WMToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"omnicppcomplete
"let 设置中有一个是设置自动补全的时候显示函数原型的
set nocp
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot = 1 " autocomplete with .
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype in popup window
let OmniCpp_GlobalScopeSearch=1 " enable the global scope search
let OmniCpp_DisplayMode=1 " Class scope completion mode: always show all members
"let OmniCpp_DefaultNamespaces=["std"]
let OmniCpp_ShowScopeInAbbr=1 " show scope in abbreviation and remove the last column
let OmniCpp_ShowAccess=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"SuperTab
let g:SuperTabDefaultCompletionType="context"  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Python
let g:pydiction_location='~/.vim/pydiction/complete-dict'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"miniBufferExplorer
let g:miniBufExplMapWindowNavVim = 1 " 按下Ctrl+h/j/k/l，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapWindowNavArrows = 1 " 按下Ctrl+箭头，可以切换到当前窗口的上下左右窗口
let g:miniBufExplMapCTabSwitchBufs = 1 " 启用以下两个功能：Ctrl+tab移到下一个buffer并在当前窗口打开；Ctrl+Shift+tab移到上一个buffer并在当前窗口打开；ubuntu好像不支持
"let g:miniBufExplMapCTabSwitchWindows = 1 " 启用以下两个功能：Ctrl+tab移到下一个窗口；Ctrl+Shift+tab移到上一个窗口；ubuntu好像不支持
let g:miniBufExplModSelTarget = 1 " 不要在不可编辑内容的窗口（如TagList窗口）中打开选中的buffer
""""""""""""""""""""""""""""""
" lookupfile setting
" """"""""""""""""""""""""""""""
 let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
 let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
 let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
 let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
 let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
 if filereadable("./lookuptags")                "设置tag文件的名字
 let g:LookupFile_TagExpr = '"./lookuptags"'
 endif

