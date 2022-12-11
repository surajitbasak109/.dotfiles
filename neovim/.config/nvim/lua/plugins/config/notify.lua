local present, notify = pcall(require, "notify")
if not present then
  return
end

local icons = require "icons"

notify.setup {
  -- Animation style (see below for details)
  stages = "fade_in_slide_out",

  -- Function called when a new window is opened, use for changing win settings/config
  on_open = function()
  end,

  -- Function called when a window is closed
  on_close = function ()
  end,

  -- Render function for notifications. See notify-render()
  render = "default",

  -- Default timeout for notifications
  timeout = 175,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
  background_colour = "Normal",

  -- Minimum width for notification windows
  minimum_width = 10,

  -- Icons for the different levels
  icons = {
    ERROR = icons.diagnostics.Error,
    WARN = icons.diagnostics.Warning,
    INFO = icons.diagnostics.Information,
    DEBUG = icons.ui.Bug,
    TRACE = icons.ui.Pencil,
  },
}

vim.notify = notify

local notify_filter = vim.notify
vim.notify = function(msg, ...)
  if msg:match "character_offset must be called" then
    return
  end
  if msg:match "method textDocument" then
    return
  end

  notify_filter(msg, ...)
end
