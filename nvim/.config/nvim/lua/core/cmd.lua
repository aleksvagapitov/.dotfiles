vim.cmd([[
	set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
	set list
	" 4 spaces indentation
	set tabstop=4 softtabstop=0 expandtab shiftwidth=4

	" Deal with unwanted white spaces (show them in red)
	highlight ExtraWhitespace ctermbg=red guibg=red
	match ExtraWhitespace /\s\+$/
	autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
	autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
	autocmd InsertLeave * match ExtraWhitespace /\s\+$/
	autocmd BufWinLeave * call clearmatches()
]])

vim.cmd('command NT NERDTree')
vim.cmd('command FN Telescope find_files')
vim.cmd('command FT Telescope live_grep')
