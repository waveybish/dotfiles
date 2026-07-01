vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

vim.keymap.set('n', '<leader>fe', function() require('neo-tree.command').execute({ toggle = true, dir = vim.uv.cwd() }) end, { desc = 'Explorer NeoTree (CWD)', silent = true })
vim.keymap.set('n', '<leader>fE', function() require('neo-tree.command').execute({ toggle = true, dir = vim.uv.cwd() }) end, { desc = 'Explorer NeoTree (CWD)', silent = true })
vim.keymap.set('n', '<leader>e',  function() require('neo-tree.command').execute({ toggle = true, dir = vim.uv.cwd() }) end, { desc = 'Explorer NeoTree (CWD)', silent = true })
vim.keymap.set('n', '<leader>E',  function() require('neo-tree.command').execute({ toggle = true, dir = vim.uv.cwd() }) end, { desc = 'Explorer NeoTree (CWD)', silent = true })

-- Extra sources mapping (Git and Active Buffer files)
vim.keymap.set('n', '<leader>ge', function() require('neo-tree.command').execute({ toggle = true, source = 'git_status' }) end, { desc = 'Git Explorer', silent = true })
vim.keymap.set('n', '<leader>be', function() require('neo-tree.command').execute({ toggle = true, source = 'buffers' }) end, { desc = 'Buffer Explorer', silent = true })

-- 3. Configure Neo-tree internal settings
require('neo-tree').setup {
  sources = { "filesystem", "buffers", "git_status" },
  open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
  filesystem = {
    bind_to_cwd = false,
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
    window = {
      mappings = {
        ['\\'] = 'close_window',
        ["l"] = "open",
        ["h"] = "close_node",
        ["<space>"] = "none",
        ["Y"] = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          vim.fn.setreg("+", path, "c")
        end,
        ["O"] = function(state)
          local path = state.tree:get_node().path
          vim.ui.open(path)
        end,
        ["P"] = { "toggle_preview", config = { use_float = false } },
      },
    },
  },
  default_component_configs = {
    indent = {
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    git_status = {
      symbols = {
        unstaged = "  ",
        staged = "  ",
      },
    },
  },
}
