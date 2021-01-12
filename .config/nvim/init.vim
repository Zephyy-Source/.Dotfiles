"Тут плагины
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } "Дерево выбора
Plug 'airblade/vim-gitgutter' "Интеграция с git, ВОЗМОЖНО ЛАГАЕТ
Plug 'tpope/vim-fugitive' "Интеграция с git
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "Улучшене nerdtree
Plug 'adimit/prolog.vim' "Prolog
Plug 'ryanoasis/vim-devicons' "Иконки 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'jiangmiao/auto-pairs' "Авто ''
Plug 'vim-airline/vim-airline' "Строка стостояния и темы под неё
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', {'branch': 'release'} "Комплишн
Plug 'sheerun/vim-polyglot' "Тут для синтаксиса
"У комплишена стоят дополнения для языков python и clang
"CocList extensions список
"CocInstall <название пакета>
call plug#end()

"настройка coc
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/gitgutter.vim

"убрать цвет лини слева
highlight! link SignColumn LineNr
highlight SignColumn ctermbg=NONE

"шрифты линии статуса 
let g:airline_powerline_fonts = 1
"цвет линии сбоку

"au g:gitgutter_git_executable = '/usr/bin/git'

"линия с цифрами
set number
set relativenumber
"отображение частичных совпадений при поиске
set is

"Тема для строки состояния
let g:airline_theme='behelit'

"Словари
set spell spelllang=ru,en

"Включение нормальной табуляции
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set mouse=a
"Поддержка синтаксиса
syntax on
filetype plugin on

"Сделать так, чтобы файлы .h читались как .c
"augroup project
 "   autocmd!
  "  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
"augroup END

"Кнопка ctrl n для перемещения по файлам
nmap <silent> <C-n> :NERDTreeToggle<CR>

"Директория для бекапа
"set backupdir=~/.vim/backup//
"set directory=~/.vim/backup//

"Убрать бэкап
set nobackup
set nowritebackup

filetype plugin indent on "Определение файлов
set nocompatible "Без поддержки ви

set encoding=UTF-8 "Для иконок

"Запуск кода python по нажатию <F9>

"Компиляция си
autocmd filetype c nnoremap <Leader>c :w <CR>:!gcc % -o %:r && ./%:r<CR>
"Компиляция си++
autocmd filetype cpp nnoremap <Leader>c :w <CR>:!g++ % -o %:r && ./%:r<CR>
"Интерпретация python
autocmd filetype python nnoremap <Leader>c :w <CR>:!python % <CR>
"Компиляция джавы
autocmd filetype java nnoremap <Leader>c :w <CR>:!javac % :r&& java %:r<CR>
