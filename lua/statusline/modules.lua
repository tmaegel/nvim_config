local fn = vim.fn

local modes = {
  ["n"] = { "NORMAL", "St_NormalMode" },
  ["niI"] = { "NORMAL i", "St_NormalMode" },
  ["niR"] = { "NORMAL r", "St_NormalMode" },
  ["niV"] = { "NORMAL v", "St_NormalMode" },
  ["no"] = { "N-PENDING", "St_NormalMode" },
  ["i"] = { "INSERT", "St_InsertMode" },
  ["ic"] = { "INSERT (completion)", "St_InsertMode" },
  ["ix"] = { "INSERT completion", "St_InsertMode" },
  ["t"] = { "TERMINAL", "St_TerminalMode" },
  ["nt"] = { "NTERMINAL", "St_NTerminalMode" },
  ["v"] = { "VISUAL", "St_VisualMode" },
  ["V"] = { "V-LINE", "St_VisualMode" },
  ["Vs"] = { "V-LINE (Ctrl O)", "St_VisualMode" },
  [""] = { "V-BLOCK", "St_VisualMode" },
  ["R"] = { "REPLACE", "St_ReplaceMode" },
  ["Rv"] = { "V-REPLACE", "St_ReplaceMode" },
  ["s"] = { "SELECT", "St_SelectMode" },
  ["S"] = { "S-LINE", "St_SelectMode" },
  [""] = { "S-BLOCK", "St_SelectMode" },
  ["c"] = { "COMMAND", "St_CommandMode" },
  ["cv"] = { "COMMAND", "St_CommandMode" },
  ["ce"] = { "COMMAND", "St_CommandMode" },
  ["r"] = { "PROMPT", "St_ConfirmMode" },
  ["rm"] = { "MORE", "St_ConfirmMode" },
  ["r?"] = { "CONFIRM", "St_ConfirmMode" },
  ["!"] = { "SHELL", "St_TerminalMode" },
}

local M = {}

M.sep = function()
  return "%#St_Sep#" .. " "
end

M.sep_fill = function()
  return "%#St_Sep_Fill#" .. "█"
end

M.mode = function()
  local m = vim.api.nvim_get_mode().mode
  local current_mode = "%#" .. modes[m][2] .. "#" .. "  " .. modes[m][1] .. " "

  return current_mode
end

M.tabline = function()
  local tabs = vim.api.nvim_list_tabpages()
  local tabline = ""
  local current_tab = vim.api.nvim_get_current_tabpage()
  for index, value in ipairs(tabs) do
    local tab = " " .. value .. " "
    if value == current_tab then
      tabline = tabline .. "%#St_tab_active#" .. " " .. "" .. tab
    else
      tabline = tabline .. "%#St_tab_inactive#" .. " " .. "" .. tab
    end
  end
  return tabline
end

M.cwd = function()
  -- Returns the current working directory
  local dir_icon = "%#St_cwd_icon#" .. " 󰉋 "
  local dir_name = "%#St_cwd_text#" .. fn.fnamemodify(fn.getcwd(), ":t") .. " "
  return (vim.o.columns > 85 and ("%#St_cwd_icon#" .. dir_icon .. dir_name)) or ""
end

M.buffer_dir = function()
  -- Returns the directory of the current selected buffer/file.
  local dir_icon = "%#St_cwd_icon#" .. " 󰉋 "
  local dir_name = "%#St_cwd_text#" .. vim.fn.fnamemodify(vim.fn.expand "%", ":~:h") .. " "
  return (vim.o.columns > 85 and ("%#St_cwd_icon#" .. dir_icon .. dir_name)) or ""
end

M.file_encoding = function()
  local encode = vim.bo.fenc ~= "" and vim.bo.fenc or vim.o.enc
  return " " .. encode:upper()
end

M.git = function()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0) and (" +" .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0) and (" ~" .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed ~= 0) and (" -" .. git_status.removed) or ""
  local branch_name = "  " .. git_status.head

  return "%#St_git_info#" .. branch_name .. added .. changed .. removed .. " "
end

M.lsp_diagnostics = function()
  if not rawget(vim, "lsp") then
    return ""
  end

  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  errors = (errors and errors > 0) and ("%#St_lsp_error#" .. "  " .. errors) or ""
  warnings = (warnings and warnings > 0) and ("%#St_lsp_warning#" .. "  " .. warnings) or ""
  hints = (hints and hints > 0) and ("%#St_lsp_hints#" .. "  " .. hints) or ""
  info = (info and info > 0) and ("%#St_lsp_info#" .. "  " .. info) or ""

  return errors .. warnings .. hints .. info .. " "
end

M.lsp_status = function()
  local icon = "  "
  if rawget(vim, "lsp") then
    for _, client in ipairs(vim.lsp.get_active_clients()) do
      if client.attached_buffers[vim.api.nvim_get_current_buf()] then
        return (vim.o.columns > 100 and "%#St_lsp_name#" .. icon .. client.name) or " LSP "
      end
    end
  end
end

M.file_type = function()
  local filetype_icon = "%#St_file_type_icon#"
  local filetype_text = vim.bo.filetype

  local filename = (fn.expand "%" == "" and "Empty") or fn.expand "%:t"
  if filename ~= "Empty" then
    local devicons_present, devicons = pcall(require, "nvim-web-devicons")
    if devicons_present then
      local ft_icon = devicons.get_icon(filename, fn.expand "%:e")
      if ft_icon ~= nil then
        filetype_icon = filetype_icon .. " " .. ft_icon .. " "
      else
        filetype_icon = filetype_icon .. " 󰈔 "
      end
    end
  else
    filetype_icon = filetype_icon .. " 󰈔 "
    filetype_text = "unnamed"
  end

  filetype_text = "%#St_file_type_text#" .. filetype_text .. " "
  return (vim.o.columns > 120 and filetype_icon .. filetype_text) or ""
end

M.line_column = function()
  local column = vim.fn.col "."
  return string.format("%d", column)
end

M.cursor_position = function()
  local icon = "%#St_pos_icon#" .. "  "
  local current_line = fn.line "."
  local total_line = fn.line "$"
  local pos = math.modf((current_line / total_line) * 100)
  local pos_text = string.format("%d", pos) .. "%%"

  pos_text = (current_line == 1 and "Top") or pos_text
  pos_text = (current_line == total_line and "Bot") or pos_text

  return icon .. "%#St_pos_text#" .. " " .. pos_text .. " " .. current_line .. ":" .. M.line_column() .. " "
end

return M
