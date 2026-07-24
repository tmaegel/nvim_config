local keymap = vim.keymap

-- Prevent dd override you last yank if its an empty string/line.
local function smart_dd()
  if vim.api.nvim_get_current_line():match "^%s*$" then
    return '"_dd'
  else
    return "dd"
  end
end

-- Keep the cursor position while forward-searching a word.
-- Reference: https://github.com/NvChad/NvChad/issues/1224
keymap.set("n", "*", function()
  vim.fn.setreg("/", "\\<" .. vim.fn.expand "<cword>" .. "\\>")
  vim.opt.hlsearch = true
end, { desc = "Constant cursor position in hlsearch", silent = true, noremap = true })

keymap.set("n", "U", "<cmd> redo<CR>", { desc = "Redo" })

-- buffer
keymap.set("n", "<Tab>", "<cmd> bnext <CR>", { desc = "Go to next buffer" })
keymap.set("n", "<S-Tab>", "<cmd> bprevious <CR>", { desc = "Go to previous buffer" })
keymap.set("n", "bn", "<cmd> enew <CR>", { desc = "New buffer" })
keymap.set("n", "bd", "<cmd> Bdelete <CR>", { desc = "Close buffer" })

-- tabs
keymap.set("n", "<leader><Left>", "<cmd> tabprevious <CR>", { desc = "Tab left" })
keymap.set("n", "<leader><Right>", "<cmd> tabnext <CR>", { desc = "Tab right" })
keymap.set("n", "<leader>tn", "<cmd> tabnew <CR>", { desc = "New tab" })
keymap.set("n", "<leader>tq", "<cmd> tabclose <CR>", { desc = "Close tab" })
keymap.set("n", "<leader>tc", "<cmd> tabclose <CR>", { desc = "Close tab (alt. mapping)" })
keymap.set("n", "<leader>td", "<cmd> windo bd <CR>", { desc = "Close and delete tab and its buffers" })
keymap.set("n", "<leader>tm", "<cmd> +tabmove <CR>", { desc = "Move tab to the right" })
keymap.set("n", "<leader>tM", "<cmd> -tabmove <CR>", { desc = "Move tab to the left" })

keymap.set("n", "<ESC>", "<cmd> noh <CR><ESC>", { desc = "Escape and clear hlsearch" })
keymap.set("n", "<leader>qq", "<cmd> qa <CR>", { desc = "Quit all" })
keymap.set({ "n", "i", "v", "s" }, "<C-s>", "<cmd> silent w <CR><ESC>", { desc = "Save file" })

keymap.set("n", "dd", smart_dd, { noremap = true, silent = true, expr = true })

-- Move lines/blocks
keymap.set("n", "+", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "-", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "+", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "-", ":m '<-2<cr>gv=gv", { desc = "Move up" })

keymap.set("i", "ESC", "<cmd> noh <CR><ESC>", { desc = "Escape and clear hlsearch" })
