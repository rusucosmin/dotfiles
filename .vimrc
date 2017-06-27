syntax enable


set t_Co=256
let g:solarized_termcolors=256
"let g:molokai_original = 1

"colorscheme github
"colorscheme molokai
"colorscheme corporation
"colorscheme 256_jungle
"colorscheme wells-colors
colorscheme railscasts
"colorscheme beekai
"colorscheme badwolf
"colorscheme solarized

"Gist-vim
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

set autoindent

set tabstop=2
set shiftwidth=2
"Replaces tabs with spaces
set expandtab
"Highlights trailing whitespaces and tabs
set list listchars=tab:>-,trail:¤

set relativenumber
set number
set ruler
set cursorline
set cursorcolumn
set wildmenu
set autoread

"For make file -> do NOT replace tabs with space
autocmd FileType make setlocal noexpandtab

hi NonText ctermbg=none
hi Normal ctermfg=252 ctermbg=none
hi NonText ctermfg=252 ctermbg=none
hi CursorColumn ctermfg=none ctermbg=none cterm=bold
hi Cursorline ctermfg=none ctermbg=none cterm=bold
hi LineNr ctermbg=none
hi ColumnNr ctermbg=none
hi StatusLine ctermbg=0 cterm=none

"autocmd VimEnter * hi Normal ctermbg=none
"hi Visual cterm=none ctermbg=White ctermfg=none

"Status Bar based on an answer from here http://stackoverflow.com/questions/5375240/a-more-useful-statusline-in-vim

"set statusline=
"set statusline+=\[%n]                                  "buffernr
"set statusline+=\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
"set statusline+=\ %<%F\                                "File+path
"set statusline+=\ %y\                                  "FileType
"set statusline+=\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
"set statusline+=\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
"set statusline+=\ %{&ff}\                              "FileFormat (dos/unix..) 
"set statusline+=\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
"set statusline+=\ %=\ Row:%l/%L\ (%p%%)\                "Rownumber/total (%)
"set statusline+=\ Column:%c\                            "Colnr

"Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

function! HighlightSearch()
  if &hls
    return 'H'
  else
    return ''
  endif
endfunction

function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction
inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

function! CompileAndRun()
  write
  if &filetype == 'c'
    !gcc % && ./a.out && rm a.out
  elseif &filetype == 'cpp'
    !g++ -O2 -std=c++11 -Dhome -Wall % && ./a.out && rm a.out
  elseif &filetype == 'lisp'
    !clisp %
  elseif &filetype == 'python'
   !python %
  elseif &filetype == 'javascript'
    !node %
  elseif &filetype == 'java'
    !javac % && java %:r
  elseif &filetype == 'php'
    !php %
  elseif &filetype == 'perl'
    !perl %
  elseif &filetype == 'sh'
    !bash %
  elseif &filetype == 'haskell'
    !ghc -o a.out % && ./a.out && rm a.out
  endif
endfunction

nnoremap ,c <ESC>:w!<CR>:call CompileAndRun()<CR>

inoremap {<CR> {<CR>}<C-o>O<Tab>

execute pathogen#infect()

autocmd vimenter * NERDTree
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd VimEnter * wincmd p

set runtimepath^=~/.vim/bundle/ctrlp.vim
