local act = wezterm.action

-- {{{ toggle-ligature
wezterm.on("toggle-ligature", function(window, pane)
	local overrides = window:get_config_overrides() or {}
	if not overrides.harfbuzz_features then
		-- If we haven't overridden it yet, then override with ligatures disabled
		overrides.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
	else
		-- else we did already, and we should disable out override now
		overrides.harfbuzz_features = nil
	end
	window:set_config_overrides(overrides)
end)
-- }}}

config.keys = {

	-- {{{ Copy / Paste
	{
		-- Copy
		key = "C",
		mods = "CTRL",
		action = act.CopyTo("Clipboard"),
	},
	{
		-- Paste
		key = "V",
		mods = "CTRL",
		action = act.PasteFrom("Clipboard"),
	},
	-- }}}

	-- {{{ Font size
	{
		-- Increase font size
		key = ",",
		mods = "CTRL",
		action = act.IncreaseFontSize,
	},
	{
		-- Decrease font size
		key = ".",
		mods = "CTRL",
		action = act.DecreaseFontSize,
	},
	{
		-- Reset font size
		key = "-",
		mods = "CTRL",
		action = act.ResetFontSize,
	},
	--- }}}

	-- {{{ Miscellaneous
	{
		-- Toggle ligatures
		key = "+",
		mods = "CTRL",
		action = act.EmitEvent("toggle-ligature"),
	},
	-- }}}

	-- Change mode {{{
	{
		-- Enter select mode
		key = "Space",
		mods = "CTRL",
		action = act.ActivateCopyMode,
	},
	-- }}}
}

config.key_tables = {

	-- {{{ Tabs mode
	tabs_mode = {},
	-- }}}

	-- {{{ Copy mode
	copy_mode = {

		-- {{{ Modes
		{ key = "v", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "V", action = act.CopyMode({ SetSelectionMode = "Line" }) },
		{ key = "v", mods = "CTRL", action = act.CopyMode({ SetSelectionMode = "Block" }) },
		-- }}}

		-- {{{ Movements
		-- Vim
		{ key = "h", action = act.CopyMode("MoveLeft") },
		{ key = "j", action = act.CopyMode("MoveDown") },
		{ key = "k", action = act.CopyMode("MoveUp") },
		{ key = "l", action = act.CopyMode("MoveRight") },

		-- Arrows
		{ key = "LeftArrow", action = act.CopyMode("MoveLeft") },
		{ key = "RightArrow", action = act.CopyMode("MoveRight") },
		{ key = "UpArrow", action = act.CopyMode("MoveUp") },
		{ key = "DownArrow", action = act.CopyMode("MoveDown") },

		-- Shortcuts
		{ key = "w", action = act.CopyMode("MoveForwardWord") },
		{ key = "b", action = act.CopyMode("MoveBackwardWord") },
		{ key = "e", action = act.CopyMode("MoveForwardWordEnd") },

		-- Dedicated buttons
		{ key = "PageUp", action = act.CopyMode("PageUp") },
		{ key = "PageDown", action = act.CopyMode("PageDown") },
		{ key = "End", action = act.CopyMode("MoveToEndOfLineContent") },
		{ key = "Home", action = act.CopyMode("MoveToStartOfLine") },

		-- Start/end of line
		{ key = "0", action = act.CopyMode("MoveToStartOfLine") },
		{ key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
		{ key = "H", action = act.CopyMode("MoveToStartOfLine") },
		{ key = "L", action = act.CopyMode("MoveToEndOfLineContent") },

		-- Top/bottom
		{ key = "g", action = act.CopyMode("MoveToScrollbackTop") },
		{ key = "G", action = act.CopyMode("MoveToScrollbackBottom") },
		-- }}}

		-- {{{ Search
		{ key = "f", action = act.CopyMode({ JumpForward = { prev_char = false } }) },
		{ key = "F", action = act.CopyMode({ JumpBackward = { prev_char = false } }) },
		{ key = "t", action = act.CopyMode({ JumpForward = { prev_char = true } }) },
		{ key = "T", action = act.CopyMode({ JumpBackward = { prev_char = true } }) },
		{ key = ";", action = act.CopyMode("JumpAgain") },
		{ key = ",", action = act.CopyMode("JumpReverse") },
		-- }}}

		-- {{{ Close
		{ key = "Escape", action = act.CopyMode("Close") },
		{ key = "q", action = act.CopyMode("Close") },
		{ key = "y", action = act.Multiple({ { CopyTo = "ClipboardAndPrimarySelection" }, { CopyMode = "Close" } }) },
		-- }}}
	},
	-- }}}

	-- {{{ Search mode
	search_mode = {},
	-- }}}
}

