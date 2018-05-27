set showcmd			" show (partial) command in status line
set showmatch		" show matching brackets
set incsearch		" incremental search
set autowrite		" automatically save before commands like :next and :make
set nocompatible	" use vim defaults instead of 100% vi compatibility
set backspace=indent,eol,start	" more powerful backspacing
set autoindent		" always set autoindenting on
set linebreak		" don't wrap words by default
set textwidth=0		" don't wrap lines by default
set ruler			" show the cursor position all the time
set helplang=cn
set number
set hlsearch		" search high light "
set ignorecase		"搜索忽略大小写"
set smartcase		"智能大小写搜索，只有输入单词含大写时，只搜索大写"
set nowrapscan      "禁止循环搜索"
set paste

set tabstop=4       "表示一个tab显示出来是多少个空格的长度.
set softtabstop=4   "表示在编辑模式的时候按退格键的时候退回缩进的长度，当使用expandtab时特别有用.
set shiftwidth=4    "表示每一级缩进的长度,一般设置成跟 softtabstop一样.
set noexpandtab       "当设置成 expandtab 时,缩进用空格来表示，noexpandtab则是用制表符表示一个缩进。当在写Makefile的时候要设置成noexpandtab

"------------------------------------------------------
"字符编码
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-bom,cp936


"在新buffer中切换到c/h文件
nnoremap <silent> <F12> :A<CR> 


"set mouse=a"
" use mouse"

""自动补全功能
""autocomplpop插件,一个字母即可补全  
"let g:acp_behaviorKeywordLength = 1
"let g:AutoComplPop_MappingDriven = 1
""color  
"hi Pmenu guibg=#444444
"hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff


"------------------------------------------------------
"打开文件后自动跳到上次关闭处
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"------------------------------------------------------
"颜色相关
syntax enable
syntax on
colorscheme desert

"------------------------------------------------------
"let g:winManagerWindowLayout='FileExplorer|TagList'
let g:winManagerWindowLayout='FileExplorer'
nmap wm :WMToggle<cr>

if exists('$ITERM_PROFILE')
  if exists('$TMUX') 
      let &t_SI = "\<Esc>[3 q"
      let &t_EI = "\<Esc>[0 q"
  else
      let &t_SI = "\<Esc>]50;CursorShape=1\x7"
      let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  endif
end

"------------------------------------------------------
"ctags相关配置
" 按下F5重新生成tag文件，并更新taglist
map <F5> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
set tags=tags
set tags+=./tags " 表示在当前工作目录下搜索tags文件
"set tags+=~/arm/linux-2.6.24.7/tags "表示在搜寻tags文件的时候，也要搜寻~/arm/linux-2.6.24.7/文件夹下的tags文件
"set tags+=~/YeelightWorkspace/mijia_box/package/mijia/tags
"set tags+=~/YeelightWorkspace/mijia_box/package/yeelight/alexa/source/tags
set tags+=/home/rex/YeelightWorkspace/wifi-light/firmware/mw300/tags


"------------------------------------------------------
"-- Taglist setting --
"设置tl为打开Taglist的快捷键
nmap tl :Tlist<cr>
let Tlist_Ctags_Cmd='ctags' "因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=1 "让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0 "让taglist可以同时展示多个文件的函数列表
let Tlist_File_Fold_Auto_Close=1 "非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1 "当taglist是最后一个分割窗口时，自动推出vim
"是否一直处理tags.1:处理;0:不处理
let Tlist_Process_File_Always=1 "实时更新tags
let Tlist_Inc_Winwidth=0


"------------------------------------------------------
"-- Cscope setting --
set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set csverb 
    set cspc=3
    "add any database in current dir
    if filereadable("cscope.out")
        cs add cscope.out
    "else search cscope.out elsewhere
    else
       let cscope_file=findfile("cscope.out", ".;")
       let cscope_pre=matchstr(cscope_file, ".*/")
       if !empty(cscope_file) && filereadable(cscope_file)
           exe "cs add" cscope_file cscope_pre
       endif
     endif
endif
"光标停在待查处，按下Ctrl+shift+_ 然后迅速按下s等
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

"------------------------------------------------------
"-- quickfix setting --
"修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height = 15
nmap <F6> :cp<cr>
nmap <F7> :cn<cr>
"上下切换查询的结果
nmap <C-n> :cnext<CR>
nmap <C-p> :cprev<CR> 
