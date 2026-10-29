--[[
AUTHOR: stalker32021 (also known as stalker57241)
DESCRIPTION: Frontend for tabview. Linked by plugin_register
--]]
local vis = _G.vis
local tabview = nil
local activewin = nil
local enabled = false
local prefix = nil
local module = {
	meta = generate_meta("tabdisplay", "1.0.0")
}

local function getfilename(filepath)
	local fname
	local prefixpos = nil
	if prefix ~= nil then
		prefixpos = string.find(filepath, prefix, 1, true)
	end	
	if prefix == nil or prefixpos == nil or prefixpos > 1 then
		fname = filepath:match(".*/(.-)$")
	else
		fname = filepath:sub(#prefix + 1)
	end
	return fname
end

local function statusline(win)
	local tabline = ""
	local activetab = tabview.get_active_tab()
	local tabcount = tabview.get_tab_count()
	if tabcount == 1 then
		tabline = getfilename(tabview.get_tab_name_at(1))
		win:status(tabline)
	else
		for idx = 1, tabcount do
			local name = getfilename(tabview.get_tab_name_at(idx))
			if (activetab ~= nil and idx == activetab + 1) or tabcount == 1 then
				tabline = tabline .. "[" .. name .. "]"
			else
				tabline = tabline .. " " .. name .. " "
			end
		end
		win:status(tabline, "[" .. activetab + 1 .. "/" .. tabcount .. "]")
	end
end

function module.set_prefix(prefix_)
	prefix = prefix_
end
function module.setup(tabviewapi)
	if tabviewapi ~= nil then
		tabview = tabviewapi
	else
		tabview = getbyname('tabview')
	end
	return
end
function module.init()
	if tabview == nil then return end
	activewin = tabview.active_window()
	if activewin == nil then 
		return
	end
	vis:command_register("tab_toggle", function() enabled = not enabled end)
	vis.events.subscribe(vis.events.WIN_STATUS, function(win)
		if tabview == nil then return false end
		if activewin == nil then return false end
		if win ~= activewin then return false end
		if enabled == false then return false end
		statusline(win)
		return true
	end)
end
return module
