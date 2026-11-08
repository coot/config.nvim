-- :tselect via Telescope, with the highlights of the old print_tag_list().
local default_select = vim.ui.select
vim.ui.select = function(items, opts, on_choice)
  if opts.kind ~= 'tag' then
    return default_select(items, opts, on_choice)
  end
  local actions = require('telescope.actions')
  local state = require('telescope.actions.state')

  local function pad(s, width)
    return s .. (' '):rep(width - vim.api.nvim_strwidth(s))
  end
  local taglen = 18
  local cur -- index of the current tag match, if any
  for i, m in ipairs(items) do
    taglen = math.max(taglen, vim.api.nvim_strwidth(m.tag) + 2)
    if m.cur then
      cur = i
    end
  end

  local done = false
  require('telescope.pickers')
    -- No current tag: the top row, i.e. the last match (results are listed bottom-up).
    .new({ default_selection_index = cur or #items }, {
      prompt_title = opts.prompt,
      finder = require('telescope.finders').new_table({
        results = items,
        entry_maker = function(m)
          return {
            value = m,
            ordinal = m.tag .. ' ' .. m.file,
            display = function()
              local head = ('%s %s '):format(m.pri, pad(m.kind or '', 4))
              local tag = pad(m.tag, taglen)
              local s = head .. tag .. m.file
              local hl = {
                { { #head, #head + #m.tag }, 'Title' },
                { { #head + #tag, #s }, 'Directory' },
              } 
              if m.extra then
                hl[#hl + 1] = { { #s + 1, #s + 1 + #m.extra }, 'ModeMsg' }
                s = s .. ' ' .. m.extra
              end 
              return s, hl
            end,
          } 
        end,
      }),
      sorter = require('telescope.config').values.generic_sorter({}),
      attach_mappings = function(bufnr)
        actions.select_default:replace(function()
          local entry = state.get_selected_entry()
          done = true -- before close(), so the cancel hook below does not fire
          actions.close(bufnr)
          if entry then
            on_choice(entry.value, entry.index)
          else
            on_choice(nil, nil)
          end
        end)
        actions.close:enhance({
          post = function()
            if not done then
              done = true
              on_choice(nil, nil)
            end
          end,
        })
        return true
      end,
    })
    :find()
end
