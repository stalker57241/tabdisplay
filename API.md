# TabDisplay API

## Lifecycle

### `setup(tabviewapi)`

- Returns API

Returned right after `require`

### `init()`

Gets active window from `tabview`

Subscribes to `vis.events.WIN_STATUS` event

## Configuration

### `set_prefix(path)`

Specifies extra part of filename in editor.

- `path`: `string` | `nil` - when `nil`, lefts only filename in tablist

## Commands

### `:tab_toggle`

Toggles visibility.

When visible, overrides main window statusbar with tabs
