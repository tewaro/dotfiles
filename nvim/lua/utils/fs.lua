local Path = require("plenary.path")
local M = {}

local function ancestors(start)
  local start_abs = start and Path:new(start):absolute() or vim.loop.cwd()
  local path = Path:new(start_abs)
  if path:is_file() then path = path:parent() end
  local out = {}
  local seen = {}
  while true do 
    local abs = path:absolute()
    if seen[abs] then break end
    table.insert(out, path)
    seen[abs] = true
    local parent = path:parent()
    if not parent then break end
    local parent_abs = parent:absolute()
    if parent_abs == abs then break end
    path = parent
  end
  return out
end 


function M.find_git_root(start)
  start = start and Path:new(start):absolute() or vim.fn.getcwd()
  local path = Path:new(start)
  if path:is_file() then path = path:parent() end
  if path:joinpath(".git"):exists() then return path:absolute() end
  local curr = path
  for _, dir in ipairs(ancestors(path)) do
    print(dir)
    if dir:joinpath(".git"):exists() then return dir end
  end
  return path
end

return M
