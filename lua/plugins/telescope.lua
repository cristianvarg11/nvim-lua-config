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

----------------------------------------------------------------
-- local builtin = require('telescope.builtin')
-- local telescope = require('telescope')
-- local pickers = require('telescope.pickers')
-- local finders = require('telescope.finders')
-- local actions = require('telescope.actions')
-- local conf = require("telescope.config").values
-- local action_state = require "telescope.actions.state"
--
-- local gitmojis = {
--     {"🎨", ":art:", "Improve structure / format of the code."},
--     {"⚡️", ":zap:", "Improve performance."},
--     -- Agrega aquí el resto de gitmojis
-- }
--
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
--
-- telescope.setup({
--     extensions = {
--         conventional_commits = {
--             theme = "ivy", -- custom theme
--             action = function(entry)
--                 vim.print(entry)
--             end,
--             include_body_and_footer = true, -- Add prompts for commit body and footer
--         },
--     },
-- })
--
-- local function display_gitmojis()
--     pickers.new({}, {
--         prompt_title = 'Gitmojis',
--         finder = finders.new_table({
--             results = gitmojis,
--             entry_maker = function(entry)
--                 return {
--                     value = entry[2],
--                     ordinal = entry[2] .. " " .. entry[3],
--                     display = entry[1] .. " " .. entry[2] .. " - " .. entry[3],
--                 }
--             end,
--         }),
--         sorter = require('telescope.sorters').get_generic_fuzzy_sorter(),
--      --    attach_mappings = function(_, map)
--      --        map('i', '<CR>', function(prompt_bufnr)
--      --            -- local selection = actions.state.get_selected_entry(prompt_bufnr)
--      --            actions.close(prompt_bufnr)
-- 					-- 				local selection = action_state.get_selected_entry()
-- 					-- 				vim.api.nvim_put({ selection[1] }, "", false, true)
-- 					-- 				-- vim.api.nvim_command('let @+ = "' .. selection.value .. '"')
-- 					-- 				-- print('Copied ' .. selection.value .. ' to clipboard')
-- 					-- 		end)
-- 					-- 		return true
-- 					-- end,
--
-- 				attach_mappings = function(prompt_bufnr, map)
-- 					actions.select_default:replace(function()
-- 						actions.close(prompt_bufnr)
-- 						local selection = action_state.get_selected_entry()
-- 						print(vim.inspect(selection))
-- 						vim.api.nvim_put({ selection[1] }, "", false, true)
-- 				end)
-- 				return true
-- 			end,
-- 			}):find()
-- 	end
--
--
--
-- 	vim.keymap.set(
-- 		"n",
-- 		"<leader>gm",
-- 		display_gitmojis,
-- 		{ desc = "Display gitmojis" }
-- 	)
--
-- 	------------ our picker function: colors
-- -- 	local colors = function(opts)
-- -- 		opts = opts or {}
-- -- 		pickers.new(opts, {
-- -- 			prompt_title = "colors",
-- -- 			finder = finders.new_table {
-- -- 				results = { "red", "green", "blue" }
-- -- 			},
-- -- 			sorter = conf.generic_sorter(opts),
-- -- 			attach_mappings = function(prompt_bufnr, map)
-- -- 				actions.select_default:replace(function()
-- -- 					actions.close(prompt_bufnr)
-- -- 					local selection = action_state.get_selected_entry()
-- -- 					-- print(vim.inspect(selection))
-- -- 					vim.api.nvim_put({ selection[1] }, "", false, true)
-- --       end)
-- --       return true
-- --     end,
-- --   }):find()
-- -- end
-- --
-- --
-- -- colors(require("telescope.themes").get_dropdown{})
-- -- -- to execute the function
-- -- colors()
-- -------------------
--
-- -- Load extensions
-- telescope.load_extension("conventional_commits")
