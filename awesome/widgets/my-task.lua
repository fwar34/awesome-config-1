local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local clickable_container = require('widgets.clickable-container')

local dpi = require('beautiful').xresources.apply_dpi

-- define module table
local task_list = {}

task_list.create = function(s)
	return awful.widget.tasklist(
	s,
	awful.widget.tasklist.filter.currenttags,
	tasklist_buttons,
	{
		border_width = 1,
		border_color = "#777777",
		shape        = gears.shape.rounded_bar,
	},
	{
		spacing = 10,
		spacing_widget = {
			{
				forced_width = 5,
				shape        = gears.shape.circle,
				widget       = wibox.widget.separator
			},
			valign = "center",
			halign = "center",
			widget = wibox.container.place,
		},
		layout  = wibox.layout.flex.horizontal
	},
	-- Notice that there is *NO* wibox.wibox prefix, it is a template,
	-- not a widget instance.
	{
		{
			{
				{
					{
						id     = "icon_role",
						widget = wibox.widget.imagebox,
					},
					margins = 2,
					widget  = wibox.container.margin,
				},
				{
					id     = "text_role",
					widget = wibox.widget.textbox,
				},
				layout = wibox.layout.fixed.horizontal,
			},
			left  = 10,
			right = 10,
			widget = wibox.container.margin
		},
		id     = "background_role",
		widget = wibox.container.background,
	}
	)
end

return task_list
