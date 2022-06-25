""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Sections:
" -> 0: vim-plug                    [插件管理]
" -> 1: nerdtree                    [目录树]
" -> 2: nerdcommenter               [注释工具]
" -> 3: vim-interestingwords        [高亮选中]
" -> 4: vim-airline                 [状态栏]
" -> 5: vim-choosewin               [窗口切换]
" -> 6: undotree                    [回退工具]
" -> 7: LeaderF                     [模糊搜索]
" -> 8: coc.nvim                    [自动补全]
" 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" => 0: vim-plug{{{
set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'lfv89/vim-interestingwords'
Plug 'vim-airline/vim-airline'
Plug 't9md/vim-choosewin'
Plug 'mbbill/undotree'
Plug 'Yggdroot/LeaderF'
Plug 'neoclide/coc.nvim'
call plug#end()
" }}}

" => 1: [F5] nerdtree {{{
nnoremap <F5> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }}}

" => 2: nerdcommenter {{{
" <leader>c<space>: toggles the comment state
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" }}}

" => 3: vim-interestingwords {{{
" <leader>k and <Leader>K
" }}}

" => 4: vim-airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" }}}

" => 5: vim-choosewin {{{
" invoke with '-'
nmap  -  <Plug>(choosewin)
" if you want to use overlay feature
let g:choosewin_overlay_enable = 1
" }}}

" => 6: [F6] undotree {{{
let g:undotree_DiffAutoOpen = 0
nnoremap <F6> :UndotreeToggle<CR>
" }}}

" => 7: Leaderf {{{
" need vim support python3，yum install python3-devel and recompile vim
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': '', 'right': '' }
let g:Lf_PreviewResult = {'Function': 1, 'BufTag': 1, 'Rg': 1, 'Gtags': 1 }
let g:Lf_RootMarkers=['.Lf_project_root_marker']
" nedd ripgrep [rg]
noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg -w --current-buffer -e %s ", expand("<cword>"))<CR><CR>
command! -bang -nargs=* -complete=file LeaderfRg exec printf("Leaderf! rg -w -e %s", escape('<args>', '\\'))
noremap <C-F> :<C-U><C-R>=printf("LeaderfRg %s ", expand("<cword>"))<CR>
noremap <leader>la :<C-U>Leaderf! rg --recall<CR>

noremap <leader>lb :<C-U>LeaderfBuffer<CR>
" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 0
noremap <leader>lr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>ld :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>lo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
" need Universal Ctags [stags]
" modify autoload/leaderf/python/leaderf/functionExpl.py --c-kinds=f will be better
noremap <leader>lf :LeaderfFunction!<CR>
" }}}

" => 8: coc.nvim {{{
" git checkout release to solve 'build/index.js not found, please compile coc.nvim by: npm run build' issues/3258
let g:coc_global_extensions = [
            \ 'coc-marketplace',
            \ 'coc-pairs']

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" }}}
