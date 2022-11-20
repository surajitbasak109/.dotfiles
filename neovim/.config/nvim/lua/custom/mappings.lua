local M = {}

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<leader>ww"] = { "<CMD>update<CR>", "Save file" },
    ["<leader>W"] = { "<CMD>wall<CR>", "Save all file" },
    ["<leader>["] = { "<CMD>bp<CR>", "Switch to previous buffer" },
    ["<leader>]"] = { "<CMD>bn<CR>", "Switch to next buffer" },
    ["''"] = { "<CMD>b#<CR>", "Move to last buffer" },
    ["<C-\\>"] = { "<CMD>vsplit<CR>", "Split pane vertically" },
    ["<A-\\>"] = { "<CMD>split<CR>", "Split pane horizontally" },
    ["<leader>o"] = { "o<ESC>", "Inserts blank line below" },
    ["<leader>O"] = { "O<ESC>", "Inserts blank line above" },
  },

  i = {
    ["jk"] = { "<ESC>", "escape vim" },
  },
  o = {
    ["A"] = { ":<C-U>normal! mzggVG<CR>`z", "dA = Delete all buffer" },
  },
  x = {
    ["A"] = { ":<C-U>normal! ggVG<CR>", "yA = Copy whole buffer" }
  },
}

M.truzen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "truzen ataraxis" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "truzen minimal" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "truzen focus" },
  },
}

M.treesitter = {
  n = {
    ["<leader>cu"] = { "<cmd> TSCaptureUnderCursor <CR>", "find media" },
  },
}

M.shade = {
  n = {
    ["<leader>s"] = {
      function()
        require("shade").toggle()
      end,

      "toggle shade.nvim",
    },
  },
}

M.nvterm = {
  n = {
    ["<leader>cc"] = {
      function()
        require("nvterm.terminal").send("clear && g++ -o out " .. vim.fn.expand "%" .. " && ./out", "vertical")
      end,

      "compile & run a cpp file",
    },
  },
}

return M
