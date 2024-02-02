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
                vim.print(entry)
            end,
            include_body_and_footer = true, -- Add prompts for commit body and footer
        },
				gitmoji = {
            action = function(entry)
                -- entry = {
                --   display = "🐛 Fix a bug.",
                --   index = 4,
                --   ordinal = "Fix a bug.",
                --   value = {
                --     description = "Fix a bug.",
                --     text = ":bug:",
                --     value = "🐛"
                --   }
                -- }
                local emoji = entry.value.value
                vim.ui.input({ prompt = "Enter commit message: " .. emoji .. " "}, function(msg)
                    if not msg then
                        return
                    end
                    -- Insert text instead of emoji in message
                    local emoji_text = entry.value.text
                    vim.cmd(':G commit -m "' .. emoji_text .. ' ' .. msg .. '"')
                end)
            end,
        },
    },
})

local function create_conventional_commit()
    local actions = require("telescope._extensions.conventional_commits.actions")
    local picker = require("telescope._extensions.conventional_commits.picker")

    -- if you use the picker directly you have to provide your theme manually
    picker({
        action = actions.prompt,
        include_body_and_footer = true,
    })
end

vim.keymap.set(
  "n",
  "<leader>cc",
  create_conventional_commit,
  { desc = "Create conventional commit" }
)

-- Load extensions
telescope.load_extension("conventional_commits")
telescope.load_extension("gitmoji")
