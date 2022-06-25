local bookmarks_dir = vim.fn.stdpath('data') .. "/bookmarks"
if vim.fn.isdirectory(bookmarks_dir) == 0 then
  vim.fn.mkdir(bookmarks_dir, "p", "0755")
end

vim.cmd [[
  let g:bookmark_save_per_working_dir = 1
  let g:bookmark_auto_save = 1

  function! g:BMWorkDirFileLocation()
    let b:filename = fnamemodify(finddir('.git', '.;'), ":p:h:h")
    let b:filename = substitute(b:filename, "/", "__", "g")

    let b:bookmarks_dir = stdpath('data') .. "/bookmarks"

    return b:bookmarks_dir .. '/' .. b:filename
  endfunction
]]
