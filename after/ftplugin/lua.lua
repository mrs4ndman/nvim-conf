vim.bo.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2
vim.bo.expandtab = true
-- -- Format options → See [ :h 'formatoptions' ]
-- vim.opt.formatoptions = vim.opt.formatoptions
vim.opt.formatoptions:remove("t") -- No autoformatting based on `textwidth`
vim.opt.formatoptions:remove("a") -- No autoformatting, AGAIN.
vim.opt.formatoptions:remove("o") -- o / O do not continue comments if launched from within them.
vim.opt.formatoptions:remove("2") -- Not in gradeschool ;)
vim.opt.formatoptions:append("r") -- But Enter in Insertmode does.
vim.opt.formatoptions:append("n") -- Do recognize numbered lists.
vim.opt.formatoptions:append("c") -- But I do like when comments respect textwidth :D
vim.opt.formatoptions:append("j") -- Autoremove comments if possible.
