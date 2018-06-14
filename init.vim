set noexpandtab
set softtabstop=0
set shiftwidth=4
set tabstop=4

set number

set list
set listchars=tab:\ \ ,nbsp:·,trail:·

highlight Visual ctermbg=237 ctermfg=None

set foldmethod=syntax
set foldlevelstart=10
set foldlevel=10

nnoremap <silent> <Space> za
nnoremap <silent> <C-Space> zA

nnoremap <C-A-Up> 		:m-2<CR>==
nnoremap <C-A-Down> 	:m+<CR>==
inoremap <C-A-Up> 		<Esc>:m-2<CR>==gi
inoremap <C-A-Down> 	<Esc>:m+<CR>==gi

"nnoremap <Up> 			gk
"nnoremap <Down> 		gj
"inoremap <Up> 			<Esc>gka
"inoremap <Down> 		<Esc>gja

nnoremap <C-S-d>	 	mzyyp`z
inoremap <C-d> 			<Esc>yypa
