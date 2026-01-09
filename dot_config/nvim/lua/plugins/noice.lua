return {
  {
    "folke/noice.nvim",
    cond = EcoVim.plugins.experimental_noice.enabled,
    lazy = false,
    opts = {
      messages = { enabled = false },
      cmdline = {
        view = "cmdline_popup",
        format = {
          -- Disable treesitter highlighting for substitute to avoid Neovim 0.11 errors
          substitute = { pattern = "^:%%?s/", icon = " ", ft = "" },
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
          ["vim.lsp.util.stylize_markdown"] = false,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = {
          enabled = false,
        },
        hover = {
          enabled = false,
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    }
  },
}
