local auto_indentation_format = vim.api.nvim_create_augroup("AutoIndentationFormat", { clear = true })

vim.api.nvim_create_autocmd('BufRead', {
	pattern = '*/impactct/*',
	command = "set noexpandtab",
	group = auto_indentation_format
})

