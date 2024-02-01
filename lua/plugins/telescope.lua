local builtin = require('telescope.builtin')
local telescope = require('telescope')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

telescope.setup({
    extensions = {
        conventional_commits = {
            theme = "ivy", -- custom theme
            action = function(entry)
                -- entry = {
                --     display = "feat       A new feature",
                --     index = 7,
                --     ordinal = "feat",
                --     value = feat"
                -- }
                vim.print(entry)
            end,
            include_body_and_footer = true, -- Add prompts for commit body and footer
        },
    },
})

local function create_conventional_commit()
    local actions = require("telescope._extensions.conventional_commits.actions")
    local picker = require("telescope._extensions.conventional_commits.picker")
    local themes = require("telescope.themes")

    -- if you use the picker directly you have to provide your theme manually
    picker({
        action = actions.prompt,
        include_body_and_footer = true,
        -- theme = themes["get_ivy"]() -- ivy theme
    })
end

vim.keymap.set(
  "n",
  "<leader>cc",
  create_conventional_commit,
  { desc = "Create conventional commit" }
)


telescope.load_extension("conventional_commits")
