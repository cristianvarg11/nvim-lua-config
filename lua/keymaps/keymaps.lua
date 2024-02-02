local Utils = require("utils")

-- local exprnnoremap = Utils.exprnnoremap
-- local nnoremap = Utils.nnoremap
-- local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
-- local inoremap = Utils.inoremap
-- local tnoremap = Utils.tnoremap
-- local xmap = Utils.xmap
local nmap = Utils.nmap
local imap = Utils.imap

-- Leader key
vim.g.mapleader = "["

imap(",e", "<ESC>")
nmap("qq", ":q<CR>")
nmap("qf", ":q!<CR>")
nmap(",w", ":w<CR>")
nmap(",q", ":wq<CR>")
nmap(",re", ":Rename")
nmap("<leader>t", ":NERDTreeFind<CR>")
nmap("<leader>fo", ":Prettier<CR>")
nmap("<leader>fe", ":EslintFixAll<CR>")
nmap("<leader>sp", ":vsplit<CR>")
nmap("<leader>ko", ":terminal<CR>")
nmap("<leader>st", ":Telescope telescope-tabs list_tabs<CR>")
