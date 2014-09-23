"vi Compatible OFF
set nocompatible

"Display
set number
"set showmatch
let loaded_matchparen = 1
syntax on
set background=dark
colorscheme hybrid
"set guioptions+=r
set clipboard+=unnamed

"Input
set backspace=2
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab

"Encode
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,ucs-2le,ucs-2,cp932


augroup filetypedetect
    au! BufRead,BufNewFile *.inc setfiletype php
augroup END

nnoremap Q <Nop>
map t :tabnext<CR>
map T :tabprevious<CR>
imap <C-t> <ESC>:tabnew
map <C-t> :tabnew
vnoremap i i
noremap j 5h
noremap k 5j
nnoremap i 5k
noremap l 5l
noremap h ^
noremap ; $
noremap J h
noremap K j
noremap I k
noremap L l
"insertモード
noremap f a
noremap F A
noremap a i
noremap A I
noremap S :%s/
"分割関係
noremap xh :split<CR>
noremap xv :vsplit<CR>
noremap x :vsplit<CR>
"ペインを閉じる
noremap xc <C-w>c
"ペインを右に移動
noremap xl <C-w>l
"ペインを上に移動
noremap xi <C-w>k
"ペインを下に移動
noremap xk <C-w>j
"ペインを左に移動
noremap xj <C-w>h
"ペインを次に移動
noremap xn <C-w>n

nnoremap <BS> X
nnoremap <C-w><C-w> viw
nnoremap <C-w><C-d> vi"
nnoremap <C-w><C-s> vi'
noremap <C-n> <C-d>
inoremap <C-n> <ESC><C-d>i
noremap <C-m> <C-u>
inoremap <C-m> <ESC><C-u>i
nnoremap <C-c> yy
vnoremap <C-c> y
inoremap <C-c> <ESC>yya
noremap <C-d> dd
inoremap <C-d> <ESC>ddi
noremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
inoremap <CR> <CR>
inoremap <C-a> <ESC>0i
noremap <C-a> 0
inoremap <C-e> <ESC>$a
noremap <C-e> $
noremap <C-f> /
nnoremap <Space><C-a> ggVG
noremap <Space>sv :source ~/.vimrc
noremap <Space>sg :source ~/.gvimrc
noremap <Space>d :NERDTree<CR>
noremap <Space>r :QuickRun<CR>
noremap <Space>p :set paste<CR>
noremap <Space>P :set nopaste<CR>


"括弧自動補完
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>


" filetype=cpp が設定された時に呼ばれる関数
"Vim で C++ の設定を行う場合はこの関数内で記述する
" ここで設定する項目は各自好きに行って下さい
function! s:cpp()
    " インクルードパスを設定する
    " gf などでヘッダーファイルを開きたい場合に影響する
    " setlocal path+=D:/home/cpp/boost,D:/home/cpp/sprout

    "タブ文字の長さ
    setlocal tabstop=4
    setlocal shiftwidth=4

    " 空白文字ではなくてタブ文字を使用する
    " setlocal noexpandtab

    " 括弧を構成する設定に <> を追加する
    " template<> を多用するのであれば
    setlocal matchpairs+=<:>

    " 最後に定義された include 箇所へ移動してを挿入モードへ
    nnoremap <buffer><silent> <Space>ii :execute "?".&include<CR> :noh<CR> o

    " BOOST_PP_XXX 等のハイライトを行う
    syntax match boost_pp /BOOST_PP_[A-z0-9_]*/
    highlight link boost_pp cppStatement
endfunction


augroup vimrc-cpp
    autocmd!
    " filetype=cpp が設定された場合に関数を呼ぶ
    autocmd FileType cpp call s:cpp()
augroup END


set rtp+=$HOME/dotfiles/.vim/
runtime! conf.d/*.vim

