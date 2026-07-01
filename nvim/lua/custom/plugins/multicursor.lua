vim.pack.add{'https://github.com/jake-stewart/multicursor.nvim'}

local mc = require("multicursor-nvim")

mc.setup()

require('which-key').add {
  { '<leader>m', group = '[M]ulti-Cursor Tools' },
}

vim.keymap.set({"n", "v"}, "<leader>mA", function()
    mc.matchAllAddCursors()
end, { desc = 'Select All Occurrences' })

vim.keymap.set("n", "<leader>m/", function()
    local search_pattern = vim.fn.getreg('/')
    if search_pattern == "" then
        vim.notify("No active search pattern found!", vim.log.levels.WARN)
        return
    end
    mc.matchAllAddCursors(search_pattern)
end, { desc = 'Cursors From Search Results' })

vim.keymap.set("n", "<Esc>", function()
    if mc.hasCursors() then
        mc.clearCursors()
    else
        vim.cmd("noh")
    end
end)

vim.keymap.set({"n", "v"}, "<C-Down>", function()
    mc.lineAddCursor(1)
end, { desc = 'Add Cursor Down' })

vim.keymap.set({"n", "v"}, "<C-Up>", function()
    mc.lineAddCursor(-1)
end, { desc = 'Add Cursor Up' })

vim.keymap.set({"n", "v"}, "<leader><C-Down>", function()
    mc.lineSkipCursor(1)
end, { desc = 'Skip Line Down' })

vim.keymap.set({"n", "v"}, "<leader><C-Up>", function()
    mc.lineSkipCursor(-1)
end, { desc = 'Skip Line Up' })


vim.keymap.set("n", "<Esc>", function()
    if mc.hasCursors() then mc.clearCursors() else vim.cmd("noh") end
end)
