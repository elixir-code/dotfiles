" References:
"     Introduction to Vim Customization - Linode
"     [https://www.linode.com/docs/tools-reference/tools/introduction-to-vim-customization/]

" Set compatibility to Vim only.
" 'compatible': make Vim either more Vi-compatible, or make Vim behave in a more useful way.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
" filetype: command to enable file type detection.
" Each time a new or existing file is edited, Vim will recognize the type of file and set the 'filetype' option. This will trigger the FileType event, which can be used to set the syntax highlighting, set options, etc.
filetype off

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
" filetype plugin indent on => filetype plugin indent, filetype plugin on
" filetype plugin on => Enable loading plugin files for specific file types, loads file ftplugin.vim in 'runtime'
" filetype plugin indent => Enable loading indent file for specific file types, loads file indent.vim in 'runtime'
filetype plugin indent on

" Turn off modelines
" modelines allows you to set variables specific to a file. By default, the first and last five lines are read by vim for variable settings.
" 'modelines' variable sets number of lines (at beginning and end of each file) vim checks for initializations.
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap
" Wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen
set linebreak

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
" Since mapping doesn't work while 'paste' is active, you need to use the 'pastetoggle' option to toggle the 'paste'  option with some key.
set pastetoggle=<F2>


" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79

" format options:
"   t   Auto-wrap text using textwidth,
"   c   Auto-wrap comments using textwidth, inserting current comment leader automatically
"   q   Allow formatting of comments with "gq"
"   r   Automatically insert the current comment leader after hitting <Enter> in Insert mode
"   n   When formatting text, recognize numbered lists. The indent of the text after the number is used for the next line
"   1   Don't break a line after a one-letter word. It's broken before it instead (if possible).
set formatoptions=tcqrn1

" tabstop: Number of spaces with which a <Tab> 'character' in the file is displayed as.
set tabstop=4
" Number of spaces to use for each step of (auto)indent.
set shiftwidth=4
" Number of spaces that a <Tab> counts for while performing editing ops - inserting <Tab> or using <BS>.
" It feels like <Tab>s are used, while actually a mix of <Tab>s (of size 'tabstop' spaces) and spaces are being used.
set softtabstop=4
" Always use appropriate number of <space> 'characters' space to insert <Tab>.
set expandtab
" shiftround => round indent to a multiple of 'shiftwidth' for < and > indent commands.
" noshiftround => insert 'shiftround' **more** spaces/Tabs for < and > indent commands instead although that might not make total number of indentation spaces a multiple of 'shiftwidth'
set noshiftround


" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
" Fixes common backspace problems - indent: allow backspacing over indentation from autoindent, eol: allow backspacing over line breaks (join lines), start: allow backspacing past the position where you started insert mode
set backspace=indent,eol,start

" Speed up scrolling in Vim / Send more characters to screen for redrawing
set ttyfast

" Status bar
set laststatus=2

" Display options
" showmode: If in Insert, Replace or Visual mode put a message of current mode on last line
set showmode
" showcmd: Show (partial) command in last line of screen.
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" List mode: Display different types of white spaces. Useful to see differences b/w tab and spaces and for trailing blanks.
set nolist
set listchars=tab:›-,trail:•,extends:#,nbsp:.

" Show line numbers
set number

" Set status line display
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Map the <Space> key to toggle a selected fold opened/closed.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Automatically save and load folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview"

" unhighlight search result
nnoremap <silent> ,<Space> :nohlsearch<CR>

" Map 'ESC' to 'Caps_Lock' for convenience
au VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

" Map ';' to ';' for convenience
nnoremap ; :
