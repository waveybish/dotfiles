vim.pack.add{'https://github.com/nvim-tree/nvim-web-devicons'}
vim.pack.add{'https://github.com/akinsho/bufferline.nvim'}

-- Configure bufferline
require('bufferline').setup({
  options = {
    mode = "buffers", -- UI treats open buffers as tabs
    offsets = {
      {
        filetype = "neo-tree", -- Keeps tabs clean if you use Neo-tree
        text = "File Explorer",
        text_align = "left",
        separator = true,
      }
    },
  },
})

vim.keymap.set('n', 'H', '<cmd>BufferLineCyclePrev<cr>', { desc = 'Prev Buffer Tab' })
vim.keymap.set('n', 'L', '<cmd>BufferLineCycleNext<cr>', { desc = 'Next Buffer Tab' })

require('which-key').add {
  { '<leader>b', group = '[B]uffer' },
}

vim.keymap.set('n', '<leader>bd', function()
  local bd = vim.api.nvim_buf_delete
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.bo[bufnr].modified then
    vim.notify("Buffer has unsaved changes!", vim.log.levels.WARN)
    return
  end
  vim.cmd('BufferLineCyclePrev')
  bd(bufnr, { force = false })
end, { desc = 'Delete Buffer' })

vim.keymap.set('n', '<leader>bo', function()
  local current = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()
  for _, bufnr in ipairs(buffers) do
    if bufnr ~= current and vim.api.nvim_buf_is_valid(bufnr) and vim.bo[bufnr].buflisted then
      if not vim.bo[bufnr].modified then
        vim.api.nvim_buf_delete(bufnr, { force = false })
      end
    end
  end
  vim.notify("Closed other buffers", vim.log.levels.INFO)
end, { desc = 'Close Other Buffers' })
