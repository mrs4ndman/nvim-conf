vim.bo.makeprg = [[ pandoc -f markdown -t pdf -V geometry:"top=2cm, bottom=1.5cm, left=2cm, right=2cm" -o %:p:r.pdf % ]]
vim.opt.conceallevel = 1
vim.bo.spelllang = "es"
vim.cmd([[setlocal spell]])
vim.cmd([[setlocal wrap linebreak]])
vim.keymap.set("n", "j", "gj", { buffer = 0 })
vim.keymap.set("n", "k", "gk", { buffer = 0 })
