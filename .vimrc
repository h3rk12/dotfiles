" setting
" 文字コードをUTF-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

set backspace=indent,eol,start
set clipboard+=unnamed

" theme
set number
" 現在の行を強調表示
set cursorline
" 現在の列を強調表示
set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2

" window
" nnoremap ss :split
" nnoremap sv :vsplit
nnoremap s <Nop>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap st <C-u>tabnew<CR>
nnoremap sn gt
nnoremap sp gT
nnoremap sq :<C-u>q<CR>
nnoremap sf :<C-u>Dirvish<CR>

let mapleader = "\<Space>"
nnoremap <Leader>o :CtrlP<CR>

nnoremap <silent><C-n> :NERDTreeToggle<CR>

" vim-plug

call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'AlessandroYorba/Sierra'
Plug 'justinmk/vim-dirvish'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'preservim/nerdtree'

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
Plug 'prettier/vim-prettier', {
\ 'build': 'yarn install',
\ 'on_ft': ['javascript', 'typescript', 'vue', 'css', 'scss', 'json', 'markdown']
\ }

call plug#end()

" coloscheme
syntax on
let g:sierra_Sunset = 1
colorscheme sierra
