
:set number
:set relativenumber
:set mouse=a
:set tabstop=2
:set shiftwidth=2
:set wildmenu "when you tab a command it's being shown in a better way
:set path+=**

call plug#begin()

Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP
Plug 'habamax/vim-godot'
Plug 'liuchengxu/vim-which-key' " key displayer when you press space
Plug 'gcmt/wildfire.vim' "make space + . work
Plug 'KabbAmine/vCoolor.vim'


let g:godot_executable = '~/Godot_v4.3-stable_linux.x86_64'

:colorscheme habamax

set encoding=UTF-8

call plug#end()
  au FileType jsx let b:coc_root_patterns = ['.git', '.env', 'tailwind.config.js', 'tailwind.config.cjs']

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')


" add comments to dart
autocmd FileType dart setlocal commentstring=//\ %s

" set leader key to space
:let mapleader = "\<Space>"


let g:which_key_map = {}
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"',"i`", "i)", "i]", "i}", "ip", "it"],
    \ "html,xml,jsx" : ["i'", 'i"',"i`", "it","at", "i)", "i]", "i}"],
		\}

" key displayer when you press space
let g:which_key_map["e"] =  'explore'


map <leader>e  <C-w>v32<C-w><:E .<CR>
map <leader>fc  <C-w>v32<C-w><:E ~/.config/nvim/<CR>

let g:which_key_map["."] = ["<Plug>(wildfire-fuel)", "select next current"]
let g:which_key_map[","] = ["<Plug>(wildfire-water)", "select previous current"]

" select next closest
map <leader>. <Plug>(wildfire-fuel)

" select previous closest
vmap <leader>, <Plug>(wildfire-water)



let g:which_key_map["l"] = {
      \ 'name' : '+language' ,
      \ "a" : [':CocList diagnostics', 'all diagnostics'],
      \ "n" : [']g', 'next diagnostic'],
			\ "p" : ['[g' ,'previous diagnostic'],
			\ "f" : [':Format' ,'format'],
			\ "d" : ['K' ,'show documentation'],
			\ "s" : [':CocRestart' ,'start coc again'],
			\ "r" : ['<F2>' ,'rename'],
      \ }


let g:which_key_map["L"] = ['$', 'move to the end']
let g:which_key_map["H"] = ['^', 'move to the beginning']

vmap <space>L $
vmap <space>H ^

let g:which_key_map["u"] = ['gul', 'Uppercase inversion']
let g:which_key_map["U"] = ['gUl', 'Uppercase']
let g:which_key_map["t"] = ['g~l', 'toggle uppercase']

" escapes terminal without closing it
tnoremap <Esc> <C-\><C-n><CR>
tnoremap <C-c> <C-\><C-n><CR>



" switches windows with alt
tnoremap <A-h> <C-\><C-n><CR><C-w>h
tnoremap <A-l> <C-\><C-n><CR><C-w>l
tnoremap <A-j> <C-\><C-n><CR><C-w>j
tnoremap <A-k> <C-\><C-n><CR><C-w>k


map <A-l>  <C-w>l
map <A-h>  <C-w>h
map <A-j>  <C-w>j
map <A-k>  <C-w>k

let g:which_key_map["o"] = {
      \ 'name' : '+open' ,
      \ "f" : [':! xdg-open %', 'open current file'],
      \ "F" : [':! xdg-open .', 'open current folder'],
      \ "t" : [':terminal', 'open terminal'],
      \ }


" make functionality work when using selection mode
vmap <space>U gUl
vmap <space>u gul
vmap <space>t g~

let g:which_key_map["g"] = {
      \ 'name' : '+go-to' ,
			\ "d" : ['gd' ,'GO to definition'],
			\ "t" : ['gy' ,'GO to type-definition'],
			\ "i" : ['gi' ,'GO to implementation'],
			\ "r" : ['gr' ,'GO to references'],
      \ }


let g:which_key_map["G"] = {
      \ 'name' : '+godot' ,
			\ "r" : ['gr' ,'run godot game'],
			\ "c" : ['gc' ,'run current scene in godot'],
      \ }


map <leader>Gr :GodotRun<CR>
map <leader>Gc :GodotRunCurrent<CR>

let g:which_key_map["f"] = {
      \ 'name' : '+find' ,
			\ 'b' : 'Buffer',
			\ 'f' : 'File',
			\ 'c' : 'Config',
      \ }

map <leader>fb :b 
map <leader>ff :find *.


" this lets you go to different windows apart from Ctrl + w
let g:which_key_map["w"] = {
      \ 'name' : '+window' ,
			\ 'e' : ['<C-w>=' ,'Make windows equal'],
			\ 'h' : ['<C-w>h' ,'Go to left split'],
			\ 'j' : ['<C-w>j' ,'Go to bottom split'],
			\ 'k' : ['<C-w>k' ,'Go to top split'],
			\ 'l' : ['<C-w>l' ,'Go to right split'],
      \ }


let g:which_key_map["s"] = {
      \ 'name' : '+split/window' ,
			\ 'v' : ['<C-w>s' ,'Split vertical'],
			\ 'h' : ['<C-w>v' ,'Split horizontal'],
      \ }


let g:which_key_map["r"] = {
      \ 'name' : '+resize' ,
			\ 'h' : ['<C-w><' ,'Resize to left'],
			\ 'j' : ['<C-w>+' ,'Resize to top'],
			\ 'k' : ['<C-w>-' ,'Resize to bottom'],
			\ 'l' : ['<C-w>>' ,'Resize to right'],
      \ }

call which_key#register('<Space>', "g:which_key_map")


" makes resizing work with numbers
nnoremap <leader>rh <C-w><
nnoremap <leader>rj <C-w>+
nnoremap <leader>rk <C-w>-
nnoremap <leader>rl <C-w>>

nnoremap <leader>rl <C-w>>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <cr> to confirm completion, <C-g>u means break undo chain at current position.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)



" Use [g and ]g to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

