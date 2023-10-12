local keymap = vim.keymap

-- Prevent dd override you last yank if its an empty string/line.
local function smart_dd()
  if vim.api.nvim_get_current_line():match "^%s*$" then
    return '"_dd'
  else
    return "dd"
  end
end

-- Switch between windows and tmux panes
keymap.set("n", "<A-Left>", "<cmd> TmuxNavigateLeft <CR>", { desc = "Focus split left" })
keymap.set("n", "<A-Right>", "<cmd> TmuxNavigateRight <CR>", { desc = "Focus split right" })
keymap.set("n", "<A-Down>", "<cmd> TmuxNavigateDown <CR>", { desc = "Focus spit down" })
keymap.set("n", "<A-Up>", "<cmd> TmuxNavigateUp <CR>", { desc = "Focus split up" })
keymap.set("n", "<A-Tab>", "<cmd> b# <CR>", { desc = "Alternate between two buffers" })
-- ["<A-BS>", "<A-p>", "<cmd> TmuxNavigatePrevious <CR>", { desc = "Focus previews split" })
keymap.set("n", "<A-f>", "<cmd> FocusMaximise <CR>", { desc = "Temporarily maximises the focussed window" })
keymap.set("n", "<A-g>", "<cmd> FocusSplitNicely <CR>", { desc = "Split a window based on the golden ratio rule" })

-- Keep the cursor position while forward-searching a word.
-- Reference: https://github.com/NvChad/NvChad/issues/1224
-- TODO: map # key as well and activate backward search
-- TODO: Set mapping via laod_mappings. Does not work yet.
keymap.set("n", "*", function()
  vim.fn.setreg("/", "\\<" .. vim.fn.expand "<cword>" .. "\\>")
  vim.opt.hlsearch = true
end, { desc = "Constant cursor position in hlsearch", silent = true, noremap = true })

-- Remap: Insert new line without enter insert mode
keymap.set("n", "o", "o<ESC>", { desc = "Insert new line after (without enter insert mode)" })
keymap.set("n", "O", "O<ESC>", { desc = "Insert new line above (without enter insert mode)" })

keymap.set("n", "U", "<cmd> redo<CR>", { desc = "Redo" })

keymap.set("n", "<leader>a", "ggVG", { desc = "Select all text in curent buffer" })
-- ["<leader>e", "%", "Go to matching pair" })
-- ["<leader>f", "^", "Go to first character in line" })
-- ["<leader>l", "g_", "Go to last character in line" })

-- buffer
-- ["<TAB>", "<cmd> bnext <CR>", "Cycle next buffer" })
-- ["<S-Tab>", "<cmd> bprevious <CR>", "Cycle prev buffer" })
keymap.set("n", "<leader>bn", "<cmd> enew <CR>", { desc = "New buffer" })
keymap.set("n", "<leader>bh", "<cmd> sp <CR>", { desc = "Horizontal split window" })
keymap.set("n", "<leader>bv", "<cmd> vsp <CR>", { desc = "Vertical split window" })
keymap.set("n", "<leader>bq", "<cmd> quit <CR>", { desc = "Close buffer" })
keymap.set("n", "<leader>bc", "<cmd> quit <CR>", { desc = "Close buffer (alt. mapping)" })
keymap.set("n", "<leader>bd", "<cmd> Bdelete <CR>", { desc = "Close and delete buffer" })
--
-- tabs
keymap.set("n", "<leader><Left>", "<cmd> tabprevious <CR>", { desc = "Tab left" })
keymap.set("n", "<leader><Right>", "<cmd> tabnext <CR>", { desc = "Tab right" })
keymap.set("n", "<leader>tf", "<cmd> tabfirst <CR>", { desc = "Tab first" })
keymap.set("n", "<leader>tl", "<cmd> tablast <CR>", { desc = "Tab last" })
keymap.set("n", "<leader>tn", "<cmd> tabnew <CR>", { desc = "New tab" })
keymap.set("n", "<leader>tq", "<cmd> tabclose <CR>", { desc = "Close tab" })
keymap.set("n", "<leader>tc", "<cmd> tabclose <CR>", { desc = "Close tab (alt. mapping)" })
keymap.set("n", "<leader>td", "<cmd> windo bd <CR>", { desc = "Close and delete tab and its buffers" })
keymap.set("n", "<leader>tm", "<cmd> +tabmove <CR>", { desc = "Move tab to the right" })
keymap.set("n", "<leader>tM", "<cmd> -tabmove <CR>", { desc = "Move tab to the left" })

-- Diff and merge
keymap.set("n", "<leader>gl", "<cmd> diffget LOCAL <CR>", { desc = "Apply local changes" })
keymap.set("n", "<leader>gr", "<cmd> diffget REMOTE <CR>", { desc = "Apply remote changes" })

keymap.set("n", "<ESC>", "<cmd> noh <CR><ESC>", { desc = "Escape and clear hlsearch" })
keymap.set("n", "<leader>qq", "<cmd> qa <CR>", { desc = "Quit all" })
keymap.set("n", "<C-s>", "<cmd> w <CR><ESC>", { desc = "Save file" })

keymap.set("n", "dd", smart_dd, { noremap = true, silent = true, expr = true })

-- Move lines/blocks
keymap.set("n", "+", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "-", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "+", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "-", ":m '<-2<cr>gv=gv", { desc = "Move up" })

keymap.set("i", "ESC", "<cmd> noh <CR><ESC>", { desc = "Escape and clear hlsearch" })

keymap.set("i", "C-s", "<cmd> w <CR><ESC>", { desc = "Save file" })
keymap.set("v", "C-s", "<cmd> w <CR><ESC>", { desc = "Save file" })
keymap.set("s", "C-s", "<cmd> w <CR><ESC>", { desc = "Save file" })

keymap.set("x", "<leader>e", "%", { desc = "Go to matching pair" })
