--[[-- Copy required content from this file to `user.lua`

Configuration files are loaded in the following order:
1. cfg/user.lua (system-wide configuration)
2. HOME/.zbstudio/user.lua (per-user configuration)
3. -cfg <lua code fragment|filename> (command line configuration)

See [configuration](http://studio.zerobrane.com/doc-configuration.html) page for information about location of configuration files.

--]]--

-- an example of how loaded configuration can be modified from this file
local G = ... -- this now points to the global environment in the script
local luaspec = G.ide.specs['lua']
luaspec.exts[#luaspec.exts+1] = "luaz"
luaspec.keywords[1] = luaspec.keywords[1] .. ' foo'

-- to modify a key mapping; see the full list of IDs in src/editor/keymap.lua
local G = ...
keymap[G.ID_STARTDEBUG] = "Ctrl-Shift-D"

-- to change font size to 12
editor.fontsize = 12 -- this is mapped to ide.config.editor.fontsize
editor.fontname = "Courier New"
filehistorylength = 20 -- this is mapped to ide.config.filehistorylength

-- to specify full path to love2d *executable*; this is only needed
-- if the game folder and the executable are NOT in the same folder.
path.love2d = 'd:/lua/love/love'

-- to specify full path to moai *executable* if it's not in one of PATH folders
path.moai = 'd:/lua/moai/moai'
-- Moai config.lua file is searched in the following places: (1) MOAI_CONFIG,
-- (2) project directory (if set) or folder with the current file,
-- (3) folder with the moai executable.

-- to specify full path to gideros *executable* if it's not in one of PATH folders
path.gideros = 'd:/Program Files/Gideros/GiderosPlayer.exe'

-- to specify full path to corona *executable* if it's not in one of PATH folders
path.corona = 'd:/path/to/Corona SDK/Corona Simulator.exe'

-- to specify full path to lua interpreter if you need to use your own version
path.lua = 'd:/lua/lua'

-- to specify full path to GSL-shell *executable* if it's not in one of PATH folders
path.gslshell = [[D:\Lua\gsl-shell\gsl-shell.exe]]

-- to provide output filter for those engines that support redirecting
-- of "print" output to the IDE (like Corona SDK and Gideros)
debugger.outputfilter = function(m) return #m < 124 and m or m:sub(1,120).."...\n" end

-- to fix an issue with 0d0d0a line endings in MOAI examples,
-- which may negatively affect breakpoints during debugging
editor.iofilter = "0d0d0aFix"

-- to have 4 spaces when TAB is used in the editor
editor.tabwidth = 4

-- to have TABs stored in the file (to allow mixing tabs and spaces)
editor.usetabs  = true

-- to disable wrapping of long lines in the editor
editor.usewrap = false

-- to turn dynamic words on and to start suggestions after 4 characters
acandtip.nodynwords = false
acandtip.startat = 4

-- to automatically open files requested during debugging
editor.autoactivate = true

-- to specify a list of MOAI entrypoints
moai = { entrypoints = { "main.lua", "source/main.lua" } }

-- to specify language to use in the IDE (requires a file in cfg/i18n folder)
language = "ru"

-- to change background color (or other colors in the IDE);
-- see cfg/tomorrow.lua for example/details on what other colors to change
styles.text = {bg = {240,240,220}}

-- to change the default color scheme; check tomorrow.lua for the list
-- of supported schemes or use cfg/scheme-picker.lua to pick a scheme.
local G = ...
styles = G.loadfile('cfg/tomorrow.lua')('Tomorrow')
-- also apply the same scheme to Output and Console windows
stylesoutshell = styles

-- to change markers used in console and output windows
styles.marker = styles.marker or {}
styles.marker.message = {ch = wxstc.wxSTC_MARK_ARROWS, {0, 0, 0}, {240, 240, 240}}
styles.marker.output = {ch = wxstc.wxSTC_MARK_BACKGROUND, {0, 0, 0}, {240, 240, 240}}
styles.marker.prompt = {ch = wxstc.wxSTC_MARK_CHARACTER+('>'):byte(), {0, 0, 0}, {240, 240, 240}}
stylesoutshell = styles

-- to disable indicators (underlining) on function calls
editor.showfncall = false

-- to change the color of the indicator used for function calls
styles.fncall.fg = {240,0,0}

-- to change the type of the indicator used for function calls
styles.fncall.st = wxstc.wxSTC_INDIC_PLAIN
  --[[ other possible values are:
    wxSTC_INDIC_PLAIN	 Single-line underline
    wxSTC_INDIC_SQUIGGLE Squiggly underline
    wxSTC_INDIC_TT	 Line of small T-shapes
    wxSTC_INDIC_DIAGONAL Diagonal hatching
    wxSTC_INDIC_STRIKE	 Strike-out
    wxSTC_INDIC_BOX      Box
    wxSTC_INDIC_ROUNDBOX Rounded Box
  --]]

-- to enable additional spec files (like spec/cpp.lua)
load.specs(function(file) return file:find('spec[/\\]cpp%.lua$') end)

-- to specify a default EOL encoding to be used for new files:
-- `wxstc.wxSTC_EOL_CRLF` or `wxstc.wxSTC_EOL_LF`;
-- `nil` means OS default: CRLF on Windows and OSX and LF on Linux/Unix.
-- CRLF as a default on OSX is a bug and is likely to change in future versions.
editor.defaulteol = wxstc.wxSTC_EOL_LF

-- to turn off checking for mixed end-of-line encodings in loaded files
editor.checkeol = false

-- to force execution to continue immediately after starting debugging;
-- set to `false` to disable (the interpreter will stop on the first line or
-- when debugging starts); some interpreters may use `true` or `false`
-- by default, but can be still reconfigured with this setting.
debugger.runonstart = true

-- to set compact fold that doesn't include empty lines after a block
editor.foldcompact = true
