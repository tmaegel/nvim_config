local merge_tb = require("theme").merge_tb
local colors = require("theme").get_theme_tb "base_30"

local highlights = {}

-- push hl_dir file names to table
local hl_files = vim.fn.stdpath "data" .. "/site/pack/packer/start/base46/lua/base46/integrations"

for _, file in ipairs(vim.fn.readdir(hl_files)) do
  local integration = require("base46.integrations." .. vim.fn.fnamemodify(file, ":r"))
  highlights = merge_tb(highlights, integration)
end

-- polish theme specific highlights
local polish_hl = require("theme").get_theme_tb "polish_hl"

if polish_hl then
  highlights = merge_tb(highlights, polish_hl)
end

-- fg = "white" set by user becomes fg = colors["white"]
-- so no need for the user to import colors

for group, _ in pairs(user_highlights) do
  for key, val in pairs(user_highlights[group]) do
    if key == "fg" or key == "bg" then
      if val:sub(1, 1) == "#" or val == "none" or val == "NONE" then
        user_highlights[group][key] = val
      else
        user_highlights[group][key] = colors[val]
      end
    end
  end
end

highlights = merge_tb(highlights, user_highlights)

return highlights
