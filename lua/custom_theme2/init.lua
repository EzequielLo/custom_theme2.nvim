local M = {}

local colors = {
red            ="#ef8690",
blue           ="#34cfff",
yellow         ="#CFDF30",
green          ="#80d200 ",
--constructor
Comment        ="#a8a8a8",
Constant       ="#00bcff" ,
Boolean        ="#44bc44",
Number         ="#00bcff" ,
Float          ="#00bcff" ,
String         ="#79a8ff" ,
Function       ="#feacd0" ,
Identifier     ="#00d3d0" ,
Label          ="#feacd0" ,
Tag            ="#feacd0" ,
Keyword        ="#f78fe7" ,
Character      ="#6ae4b9" ,
Type           ="#00d3d0" ,
StorageClass   ="#00d3d0" ,
Structure      ="#00d3d0" ,
Typedef        ="#6ae4b9" ,
Conditional    ="#b6a0ff" ,
Statement      ="#b6a0ff" ,
Repeat         ="#f78fe7" ,
Operator       ="#ffffff" ,
Exception      ="#eecc00" ,
Preproc        ="#f4923b" ,
PreCondit      ="#f4923b" ,
Macro          ="#f78fe7" ,
Include        ="#f4923b" ,
Define         ="#f4923b" ,
Title          ="#000000" ,
Delimiter      ="#ffffff" ,
SpecialComment ="#f0ce43",
Debug          ="#f78fe7" ,
Todo           ="#cfdf30" ,
Warning        ="#000000" ,
WarningMsg     ="#000000",
Error          ="#000000" ,
ErrorMsg       ="#000000" ,
-- general
NormalBg       ="#000000" ,
NormalFg       ="#ffffff" ,
VisualBg       ="#ffffff" ,
VisualFg       ="#000000" ,
SearchBg       ="#191a1b" ,
SearchFg       ="#ffffff",
IncSearcBg     ="#a8a8a8" ,
IncSearcFg     ="#000000" ,
StatusLineBg   ="#ffffff" ,
StatusLineFg   ="#000000" ,
StatusLineNCBg ="#191a1b" ,
StatusLineNCFg ="#a8a8a8" ,
StatusLineTermBg="#44bc44" ,
StatusLineTermFg="#000000" ,
StatusLineTermNCbg="#191a1b", 
StatusLineTermNcFg="#44bc44" ,
VertSplit       ="NONE",
TabLineBg       ="#191a1b", 
TabLineFg       ="#a8a8a8",
TabLineSebg     ="#00d3d0", 
TabLineSefg     ="#000000",
TabLineFill     ="NONE", 
MatchParenBg    ="#191a1b", 
MatchParenFg    ="#a8a8a8",
ToolbarLineBg   ="#a8a8a8", 
ToolBarLineFg   ="#000000", 
ToolBarButtonBg ="#a8a8a8", 
ToolBarButtonFg ="#000000", 
WildMenuBg      ="#000000", 
WildMenuFg      ="#ffffff", 
LineNrBg        ="#191a1b", 
LineNrFg        ="#a8a8a8",
CursorBg        ="#ffffff", 
CursorFg        ="#000000", 
CursorLineBg    ="#a8a8a8", 
CursorColumnFg  ="#000000", 
CursorLineNrBg  ="#191a1b", 
CursorLineNrFg  ="#000000", 
ColorColumnBg   ="#191a1b", 
ColorColumnFg   ="#a8a8a8", 
SignColumnBg    ="#191a1b", 
SignColumnFg    ="#a8a8a8", 
FoldedBg        ="#191a1b", 
FoldedFg        ="#a8a8a8", 
FoldColumnBg    ="#191a1b", 
FoldColumnFg    ="#a8a8a8", 
SpecialFg       ="#00cd68", 
SpecialKeyBg    ="#191a1b" ,
SpecialKeyFg    ="#a8a8a8" ,
SpecialCharFg   ="#cfdf30" ,
NonTextBg       ="#191a1b" ,
NonTextFg       ="#a8a8a8" ,
EndOfBufferFg   ="#a8a8a8" ,
DirectoryFg     ="#44bc11", 
QuestionFg      ="#cfdf30" ,
MoreMsgFg       ="#70c900" ,
ModeMsgFg       ="#44bc44" ,
IgnoreBg        ="#191a1b", 
IgnoreFg        ="#a8a8a8" ,
ConcealBg       ="#a8a8a8" ,
ConcealFg        ="#191a1b" ,
SpellBadFg      ="#000000",  
SpellCapFg      ="#000000" ,
SpellRareFg     ="#000000" ,
SpellLocalFg    ="#000000" ,
PmenuBg         ="#191a1b", 
PmenuFg         ="#ffffff" ,
PmenuSelBg      ="#a8a8a8" ,
PmenuSelFg      ="#000000" ,
PmenuSbarBg     ="#191a1b" ,
PmenuThumbBg    ="#a8a8a8" ,
}

local highlights = {

  -- Syntax Groups (descriptions and ordering from `:h w18`)
  { hg = 'Comment', fg = colors.Comment, gui = 'italic', cterm = 'italic' }, -- any comment
  { hg = 'Constant', fg = colors.Constant }, --any constant
  { hg = 'String', fg = colors.String }, --a string constant: "this is a string"
  { hg = 'Character', fg = colors.Character, gui="bold" }, --a character constant: 'c', '\n'
  { hg = 'Number', fg = colors.Number }, --a number constant: 234, 0xff
  { hg = 'Boolean', fg = colors.Boolean }, --a boolean constant: TRUE, false
  { hg = 'Float', fg = colors.Float }, --a floating point constant: 2.3e10
  { hg = 'Identifier', fg = colors.Identifier }, --any variable name
  { hg = 'Function', fg = colors.Function }, --function name (also: methods for classes)
  { hg = 'Statement', fg = colors.Statement }, --any statement
  { hg = 'Conditional', fg = colors.Conditional }, --if, then, else, endif, switch, etc.
  { hg = 'Repeat', fg = colors.Repeat, gui="bold" }, --for, do, while, etc.
  { hg = 'Label', fg = colors.Label }, --case, default, etc.
  { hg = 'Operator', fg = colors.Operator }, --sizeof", "+", "*", etc.
  { hg = 'Keyword', fg = colors.Keyword }, --any other keyword
  { hg = 'Exception', fg = colors.Exception, gui="bold" }, --try, catch, throw
  { hg = 'PreProc', fg = colors.PreProc }, --generic Preprocessor
  { hg = 'Include', fg = colors.Include }, --preprocessor #include
  { hg = 'Define', fg = colors.Define }, --preprocessor #define
  { hg = 'Macro', fg = colors.Macro, gui="bold" }, --same as Define
  { hg = 'PreCondit', fg = colors.PreCondit, gui="bold" }, --preprocessor #if, #else, #endif, etc.
  { hg = 'Type', fg = colors.Type,gui="bold" }, --int, long, char, etc.
  { hg = 'StorageClass', fg = colors.StorageClass}, --static, register, volatile, etc.
  { hg = 'Structure', fg = colors.Structure }, --struct, union, enum, etc.
  { hg = 'Typedef', fg = colors.Typedef, gui="bold" }, --A typedef
  { hg = 'Special', fg = colors.Special }, --any special symbol
  { hg = 'SpecialChar', fg = colors.SpecialChar }, --special character in a constant
  { hg = 'Tag', fg = colors.Tag }, --you can use CTRL-] on this
  { hg = 'Delimiter', fg = colors.Delimiter }, --character that needs attention
  { hg = 'SpecialComment', fg = colors.comment, gui="bold" }, --special things inside a comment
  { hg = 'Debug', fg = colors.Debug }, --debugging statements
  { hg = 'Underlined', gui = 'underline', cterm = 'underline' }, --text that stands out, HTML links
  { hg = 'Ignore', fg = colors.Ignore }, --left blank, hidden
  { hg = 'Error',  fg = colors.Error }, --any erroneous construct
  { hg = 'Todo', fg = colors.Todo }, --anything that needs extra attention; mostly the keywords TODO FIXME and XXX

  -- Highlighting Groups (descriptions and ordering from ` =h highlight-groups`) {{{
  { hg = 'ColorColumn', bg = colors.ColorColumnBg}, --used for the columns set with 'colorcolumn'
  { hg = 'Conceal', fg = colors.ConcealFg, bg = colors.ConcealBg }, --placeholder characters substituted for concealed text (see 'conceallevel')
  { hg = 'Cursor', fg = colors.CursorFg, bg = colors.CursorBg }, --the character under the cursor
  { hg = 'CursorIM' }, --like Cursor, but used when in IME mode
  { hg = 'CursorLine', bg = colors.CursorLineBg }, --the screen line that the cursor is in when 'cursorline' is set
  { hg = 'Directory', fg = colors.DirectoryFg }, --directory names (and other special names in listings)
  { hg = 'DiffAdd', bg = colors.green, fg = colors.black }, --diff mode: Added line
  { hg = 'DiffChange', fg = colors.yellow, gui = 'underline', cterm = 'underline' }, --diff mode: Changed line
  { hg = 'DiffDelete', bg = colors.red, fg = colors.black }, --diff mode: Deleted line
  { hg = 'DiffText', bg = colors.yellow, fg = colors.black }, --diff mode: Changed text within a changed line
  { hg = 'ErrorMsg', fg = colors.red }, --error messages on the command line
  { hg = 'VertSplit', fg = colors.VertSplit }, --the column separating vertically split windows
  { hg = 'Folded', fg = colors.FoldColumnFg }, --line used for closed folds
  { hg = 'FoldColumn' }, --'foldcolumn'
  { hg = 'SignColumn' }, --column where signs are displayed
  { hg = 'IncSearch', fg = colors.IncSearcFg, bg = colors.IncSearcBg }, --'incsearch' highlighting; also used for the text replaced with ":s///c"
  { hg = 'LineNr', fg = colors.LineNrFg }, --Line number for " =number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
  { hg = 'CursorLineNr', fg = colors.CursorLineNrFg }, --Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
  { hg = 'MatchParen', fg = colors.MatchParenFg, gui = 'underline', cterm = 'underline' }, --The character under the cursor or just before it, if it is a paired bracket, and its match.
  { hg = 'ModeMsg' }, --'showmode' message (e.g., "-- INSERT --")
  { hg = 'MoreMsg' }, --more-prompt
  { hg = 'NonText', fg = colors.NonTextFg }, --'~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
  { hg = 'Normal', fg = colors.NormalFg, bg = colors.NormalBg }, --normal text
  { hg = 'Pmenu', fg = colors.PmenuFg, bg = colors.PmenuBg }, --Popup menu: normal item.
  { hg = 'PmenuSel', fg = colors.PmenuSelFg, bg = colors.PmenuSelBg }, --Popup menu: selected item.
  { hg = 'PmenuSbar', bg = colors.PmenuSbarBg }, --Popup menu: scrollbar.
  { hg = 'PmenuThumb', bg = colors.PmenuThumbBg }, --Popup menu: Thumb of the scrollbar.
  { hg = 'Question', fg = colors.QuestionFg }, --hit-enter prompt and yes/no questions
  { hg = 'QuickFixLine', fg = colors.NormalFg, bg = colors.yellow }, --Current quickfix item in the quickfix window.
  { hg = 'Search', fg = colors.SearchFg, bg = colors.SearchBg }, --Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
  { hg = 'SpecialKey', fg = colors.SpecialKeyFg }, --Meta and special keys listed with " =map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
  { hg = 'SpellBad', fg = colors.SpellBadFg, gui = 'underline', cterm = 'underline' }, --Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
  { hg = 'SpellCap', fg = colors.SpellCapFg }, --Word that should start with a capital. This will be combined with the highlighting used otherwise.
  { hg = 'SpellLocal', fg = colors.SpellLocalFg }, --Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
  { hg = 'SpellRare', fg = colors.SpellRareFg }, --Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
  { hg = 'StatusLine', fg = colors.StatusLineFg, bg = colors.StatusLineBg }, --status line of current window
  { hg = 'StatusLineNC', fg = colors.StatusLineNCFg }, --status lines of not-current windows Note = if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
  { hg = 'StatusLineTerm', fg = colors.StatusLineTermFg, bg = colors.StatusLineTermBg }, --status line of current :terminal window
  { hg = 'StatusLineTermNC', fg = colors.StatusLineTermNcFg }, --status line of non-current  =terminal window
  { hg = 'TabLine', fg = colors.TabLineFg }, --tab pages line, not active tab page label
  { hg = 'TabLineFill' }, --tab pages line, where there are no labels
  { hg = 'TabLineSel', fg = colors.TabLineSefg }, --tab pages line, active tab page label
  { hg = 'Terminal', fg = colors.NormalFg, bg = colors.NormalBg}, --terminal window (see terminal-size-color)
  { hg = 'Title', fg = colors.Title}, --titles for output from " =set all", ":autocmd" etc.
  { hg = 'Visual', bg = colors.VisualBg, fg=colors.VisualFg }, --Visual mode selection
  { hg = 'VisualNOS'}, --Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
  { hg = 'WarningMsg', fg = colors.WarningMsg }, --warning messages
  { hg = 'WildMenu', fg = colors.WildMenuFg, bg = colors.WildMenuBg }, --current match in 'wildmenu' completion

  -- Diagnostics
  { hg = 'DiagnosticError', fg = colors.red },
  { hg = 'DiagnosticWarn', fg = colors.yellow },
  { hg = 'DiagnosticInfo', fg = colors.blue },
  { hg = 'DiagnosticHint', fg = colors.green },
  { hg = 'DiagnosticUnderlineError', fg = colors.red, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineWarn', fg = colors.yellow, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineInfo', fg = colors.blue, gui = 'underline', cterm = 'underline' },
  { hg = 'DiagnosticUnderlineHint', fg = colors.green, gui = 'underline', cterm = 'underline' },

  -- Neovim's built-in language server client
  { hg = 'LspReferenceWrite', fg = colors.blue, gui='underline' },
  { hg = 'LspReferenceText', fg = colors.blue, gui='underline' },
  { hg = 'LspReferenceRead', fg = colors.blue, gui='underline' },
  { hg = 'LspSignatureActiveParameter', fg=colors.yellow, gui='bold' },

  -- ... an exception for my favorite plugin
  { hg = 'GitSignsAdd', fg = colors.green },
  { hg = 'GitSignsChange', fg = colors.yellow },
  { hg = 'GitSignsDelete', fg = colors.red },
}
 
M.colorscheme = function()
  local highlight_cmds = {}
  for idx = 1, #highlights do
    local highlight = highlights[idx]
    highlight_cmds[idx] = string.format(
      'highlight %s guifg=%s guibg=%s gui=%s guisp=%s',
      highlight.hg,
      highlight.fg or 'NONE',
      highlight.bg or 'NONE',
      highlight.gui or 'NONE',
      highlight.guisp or 'NONE'
    )
  end
  vim.cmd(table.concat(highlight_cmds, '\n'))
end

return M
