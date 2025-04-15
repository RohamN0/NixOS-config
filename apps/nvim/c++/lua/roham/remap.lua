vim.g.mapleader = " "
vim.keymap.set("n", "<leader>rt", vim.cmd.Ex)
vim.keymap.set("n", "<F5>", ":terminal ./run.sh<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>s", ":so /home/roham/.config/nvim/lua/roham/packer.lua<CR>:PackerCompile /home/roham/.config/nvim/lua/roham/packer.lua<CR>")
