return {
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = { enabled = true },
      panel = { enabled = false },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      {
        "zbirenbaum/copilot-cmp",
        opts = {},
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "copilot" }, { name = "emoji" } }))

      -- opts.mapping = {
      --   ["<Tab>"] = cmp.mapping(function(fallback)
      --     if cmp.visible() then
      --       cmp.select_next_item()
      --     elseif vim.snippet.active({ direction = 1 }) then
      --       vim.schedule(function()
      --         vim.snippet.jump(1)
      --       end)
      --     elseif has_words_before() then
      --       cmp.complete()
      --     else
      --       fallback()
      --     end
      --   end, { "i", "s" }),
      --   ["<S-Tab>"] = cmp.mapping(function(fallback)
      --     if cmp.visible() then
      --       cmp.select_prev_item()
      --     elseif vim.snippet.active({ direction = -1 }) then
      --       vim.schedule(function()
      --         vim.snippet.jump(-1)
      --       end)
      --     else
      --       fallback()
      --     end
      --   end, { "i", "s" }),
      -- }
    end,
  },
}
