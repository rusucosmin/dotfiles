syntax enable 

set background=dark

"colorscheme solarized
"colorscheme github
colorscheme molokai
"colorscheme corporation
"colorscheme 256_jungle
"colorscheme wells-colors
"colorscheme railscasts
"colorscheme beekai
"colorscheme badwolf

let g:solarized_termcolors=256
set t_Co=256

"hi Normal ctermbg=none
"hi NonText ctermbg=none

let g:cpp_class_scope_highlight = 1
"let g:molokai_original = 1
"let g:rehash256 = 1

"Gist-vim
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1

set autoindent

set tabstop=4
set shiftwidth=4 		
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



"hi CursorColumn ctermfg=39 ctermbg=none cterm=bold
"hi Cursorline ctermfg=39 ctermbg=none cterm=bold
"hi cursorline ctermbg=none
"hi cursorcolumn ctermbg=none
"hi LineNr ctermbg=none
"hi ColumnNr ctermbg=none
"hi StatusLine ctermbg=100
"hi VertSplit 
"hi StatusLine ctermbg=12 ctermfg=whatever
"hi Visual cterm=NONE ctermbg=White ctermfg=NONE

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
let g:airline_theme='powerlineish'

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
    !g++ -O2 -std=c++11 -Dhome -Wall -static % -lm && ./a.out && rm a.out
  elseif &filetype == 'python'
    !python3 % 
  elseif &filetype == 'java'
    !javac % && java %:r
  elseif &filetype == 'php'
    !php %
  elseif &filetype == 'perl'
    !perl %
  elseif &filetype == 'sh'
    !bash %
  endif
endfunction

nnoremap ,c <ESC>:w!<CR>:call CompileAndRun()<CR>

inoremap {<CR> {<CR>}<C-o>O<Tab>

execute pathogen#infect()

autocmd vimenter * NERDTree
autocmd BufNewFile,BufRead *.md set filetype=markdown
