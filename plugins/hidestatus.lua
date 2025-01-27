-- lite-xl 1.16
local command = require "core.command"
local StatusView = require "core.statusview"

local visible = false
local funcs = {
  [true]  = StatusView.update,
  [false] = function(self) self.size.y = 0 end,
}

function StatusView:update(...)
  funcs[visible](self, ...)
end

command.add(nil, {
  ["hide-status:toggle"] = function() visible = not visible end,
  ["hide-status:hide"]   = function() visible = false       end,
  ["hide-status:show"]   = function() visible = true        end,
})
