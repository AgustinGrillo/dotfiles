require('code_runner').setup({
  -- choose mode (term, tab, float, toggle)
  mode = 'term',
  focus = true,
  term = {
    --  Position to open the terminal, this option is ignored if mode is tab
    position = "bot",
    -- window size, this option is ignored if tab is true
    size = 8,
  },
  -- put here the commands by filetype
  filetype = {
		python = "python3 -u",
	},
})
