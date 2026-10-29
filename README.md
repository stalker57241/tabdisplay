# TabDisplay

Frontend for `tabview` plugin

<img width="1898" height="917" alt="image" src="https://github.com/user-attachments/assets/837b03d3-ca5e-4437-9dde-8988ca7bf4de" />

# Installation

## Download

```sh
git clone https://github.com/stalker57241/tabdisplay ~/.config/vis/plugins/tabdisplay
```

## Using `vis-plug`

```lua
local plug = require('plugins/vis-plug')

local plugins = {
  {'stalker57241/tabview'},
  {'stalker57241/tabdisplay'}
}
plug.init(plugins, true)
```

# Usage

## From source

```lua
local tabview = require('plugins/tabview')
-- Gives you plugin api only if you give it your tabview
-- Ensure, that it isn't nil
local tabdisplay = require('plugins/tabdisplay')
tabdisplay.setup(tabview)

-- for your path prefix to shorten path /home/user/projects/lua/proj1/init.lua to init.lua if you give `/home/user/projects/lua/proj1/`
tabdisplay.set_prefix('/')
```
## Using `vis-plug`
```lua
local tabview = plug.plugins.tabview
local tabdisplay = plug.plugins.tabdisplay
tabdisplay.setup(tabview)

tabdisplay.set_prefix('/')
```

## Using `plugin_register`
```lua
require('plugins/plugin_register')
local tabview = load('plugins/tabview')
local tabdisplay = load('plugins/tabdisplay')
tabdisplay.setup()
tabdisplay.set_prefix('/')
```

## Starting plugins up
```lua
vis.events.subscribe(vis.events.INIT, function()
  tabview.init()
end)

vis.events.subscribe(vis.events.START, function()
  tabdisplay.setup()
end)
```

# Commands

Available in [API](https://github.com/stalker57241/tabdisplay/blob/075dfd79163e36cfb31c500be22d19cec0148b0d/API.md)

# Bindings

```lua
-- tt is shortword of tabs toggle
vis:map(vis.modes.NORMAL, "tt", function()
  vis:command('tab_toggle')
end)
```

# Dependencies

- **[tabview](https://github.com/stalker57241/tabview) - Required**
- *[plugin_register](https://github.com/stalker57241/plugin_register) - Optional*
