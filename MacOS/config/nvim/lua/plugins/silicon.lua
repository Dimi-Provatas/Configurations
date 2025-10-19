return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  main = "nvim-silicon",
  init = function()
    local wk = require("which-key")
    wk.add({
      mode = { "v" },
      { "<leader>s", group = "Silicon" },
      {
        "<leader>sc",
        function()
          require("nvim-silicon").clip()
        end,
        desc = "Copy code screenshot to clipboard",
      },
      {
        "<leader>sf",
        function()
          require("nvim-silicon").file()
        end,
        desc = "Save code screenshot as file",
      },
    })
  end,
  opts = {
    line_offset = function(args)
      return args.line1
    end,
    background = "#9925bb",
    font = "MesloLGS Nerd Font=32",
    theme = "Dracula",
    window_title = function()
      return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
    end,
    output = function()
      return "~/Pictures/Code_Screenshots/"
        .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
        .. "_"
        .. os.date("!%Y-%m-%dT%H-%M-%SZ")
        .. "_code.png"
    end,
  },
}
