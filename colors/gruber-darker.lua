-- gruber-darker.lua
-- Neovim colorscheme ported from gruber-darker-theme.el
-- Original by Jason R. Blevins, adapted by Alexey Kutepov (rexim)

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "gruber-darker"
vim.o.background = "dark"

local c = {
  fg        = "#e4e4ef",
  fg1       = "#f4f4ff",
  fg2       = "#f5f5f5",
  white     = "#ffffff",
  black     = "#000000",
  bg1       = "#101010",
  bg        = "#1d1d1d",
  bgp1      = "#282828",
  bgp2      = "#453d41",
  bgp3      = "#484848",
  bgp4      = "#52494e",
  red1      = "#c73c3f",
  red       = "#f43841",
  redp1     = "#ff4f58",
  green     = "#73c936",
  yellow    = "#ffdd33",
  brown     = "#cc8c3c",
  quartz    = "#95a99f",
  niagara2  = "#303540",
  niagara1  = "#565f73",
  niagara   = "#96a6c8",
  wisteria  = "#9e95c7",
  none      = "NONE",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, {
    fg        = opts.fg,
    bg        = opts.bg,
    sp        = opts.sp,
    bold      = opts.bold      or false,
    italic    = opts.italic    or false,
    underline = opts.underline or false,
  })
end

-- ─── Editor Chrome ───────────────────────────────────────────────────────────
hi("Normal",        { fg = c.fg,      bg = c.bg })
hi("NormalFloat",   { fg = c.fg,      bg = c.bgp1 })
hi("FloatBorder",   { fg = c.bgp2,    bg = c.bgp1 })
hi("Cursor",        { fg = c.black,   bg = c.yellow })
hi("CursorLine",    { bg = c.bgp1 })
hi("CursorColumn",  { bg = c.bgp1 })
hi("ColorColumn",   { bg = c.bgp2 })
hi("LineNr",        { fg = c.bgp4 })
hi("CursorLineNr",  { fg = c.yellow,  bold = true })
hi("SignColumn",    { fg = c.bgp4,    bg = c.bg })
hi("Folded",        { fg = c.quartz,  bg = c.bgp1 })
hi("FoldColumn",    { fg = c.bgp4 })
hi("VertSplit",     { fg = c.bgp2 })
hi("WinSeparator",  { fg = c.bgp2 })
hi("EndOfBuffer",   { fg = c.bgp1 })
hi("NonText",       { fg = c.bgp2 })
hi("SpecialKey",    { fg = c.bgp4 })
hi("Whitespace",    { fg = c.bgp1 })

-- ─── Status / Tab Bar ────────────────────────────────────────────────────────
hi("StatusLine",    { fg = c.white,  bg = c.bgp1 })
hi("StatusLineNC",  { fg = c.quartz, bg = c.bgp1 })
hi("TabLine",       { fg = c.bgp4,   bg = c.bgp1 })
hi("TabLineFill",   { fg = c.bgp4,   bg = c.bgp1 })
hi("TabLineSel",    { fg = c.yellow, bg = c.bg,  bold = true })

-- ─── Popup / Wildmenu ────────────────────────────────────────────────────────
hi("Pmenu",         { fg = c.fg,     bg = c.bgp1 })
hi("PmenuSel",      { fg = c.fg,     bg = c.bg1 })
hi("PmenuSbar",     { bg = c.bgp2 })
hi("PmenuThumb",    { bg = c.bg1 })
hi("WildMenu",      { fg = c.black,  bg = c.yellow })

-- ─── Search & Selection ──────────────────────────────────────────────────────
hi("Search",        { fg = c.black,  bg = c.fg2 })
hi("IncSearch",     { fg = c.black,  bg = c.fg2 })
hi("CurSearch",     { fg = c.black,  bg = c.yellow })
hi("Visual",        { bg = c.bgp3 })
hi("VisualNOS",     { bg = c.bgp3 })

-- ─── Messages / UI ───────────────────────────────────────────────────────────
hi("ModeMsg",       { fg = c.fg1 })
hi("MoreMsg",       { fg = c.green })
hi("Question",      { fg = c.green })
hi("WarningMsg",    { fg = c.brown,  bold = true })
hi("ErrorMsg",      { fg = c.redp1 })
hi("MsgArea",       { fg = c.fg })
hi("Directory",     { fg = c.niagara, bold = true })
hi("Title",         { fg = c.niagara, bold = true })
hi("MatchParen",    { bg = c.bgp4 })

-- ─── Diff ────────────────────────────────────────────────────────────────────
hi("DiffAdd",       { fg = c.green })
hi("DiffDelete",    { fg = c.redp1 })
hi("DiffChange",    { fg = c.yellow })
hi("DiffText",      { fg = c.brown,  bold = true })
hi("Added",         { fg = c.green })
hi("Removed",       { fg = c.redp1 })
hi("Changed",       { fg = c.yellow })

-- ─── Spelling ────────────────────────────────────────────────────────────────
hi("SpellBad",      { sp = c.red,     underline = true })
hi("SpellCap",      { sp = c.yellow,  underline = true })
hi("SpellRare",     { sp = c.quartz,  underline = true })
hi("SpellLocal",    { sp = c.niagara, underline = true })

-- ─── Legacy Syntax (vim regex / treesitter disabled) ─────────────────────────
hi("Comment",       { fg = c.brown })
hi("Constant",      { fg = c.quartz })
hi("String",        { fg = c.green })
hi("Character",     { fg = c.green })
hi("Number",        { fg = c.wisteria })
hi("Boolean",       { fg = c.quartz })
hi("Float",         { fg = c.wisteria })
hi("Identifier",    { fg = c.fg1 })
hi("Function",      { fg = c.niagara })
hi("Statement",     { fg = c.yellow,  bold = true })
hi("Conditional",   { fg = c.yellow,  bold = true })
hi("Repeat",        { fg = c.yellow,  bold = true })
hi("Label",         { fg = c.yellow,  bold = true })
hi("Operator",      { fg = c.fg })
hi("Keyword",       { fg = c.yellow,  bold = true })
hi("Exception",     { fg = c.yellow,  bold = true })
hi("PreProc",       { fg = c.quartz })
hi("Include",       { fg = c.quartz })
hi("Define",        { fg = c.quartz })
hi("Macro",         { fg = c.quartz })
hi("PreCondit",     { fg = c.quartz })
hi("Type",          { fg = c.quartz })
hi("StorageClass",  { fg = c.quartz })
hi("Structure",     { fg = c.quartz })
hi("Typedef",       { fg = c.quartz })
hi("Special",       { fg = c.yellow })
hi("SpecialChar",   { fg = c.brown })
hi("Tag",           { fg = c.niagara })
hi("Delimiter",     { fg = c.fg })
hi("SpecialComment",{ fg = c.brown })
hi("Debug",         { fg = c.redp1 })
hi("Underlined",    { fg = c.niagara, underline = true })
hi("Ignore",        { fg = c.bgp4 })
hi("Error",         { fg = c.redp1 })
hi("Todo",          { fg = c.yellow,  bg = c.bgp1, bold = true })

-- ─── Treesitter ──────────────────────────────────────────────────────────────
-- current capture names (nvim-treesitter v0.9+)

hi("@comment",                    { fg = c.brown })
hi("@comment.documentation",      { fg = c.green })

hi("@keyword",                    { fg = c.yellow, bold = true })
hi("@keyword.function",           { fg = c.yellow, bold = true })
hi("@keyword.operator",           { fg = c.yellow, bold = true })
hi("@keyword.return",             { fg = c.yellow, bold = true })
hi("@keyword.import",             { fg = c.quartz })
hi("@keyword.conditional",        { fg = c.yellow, bold = true })
hi("@keyword.repeat",             { fg = c.yellow, bold = true })
hi("@keyword.exception",          { fg = c.yellow, bold = true })
hi("@keyword.modifier",           { fg = c.quartz })
hi("@keyword.type",               { fg = c.quartz })
hi("@keyword.coroutine",          { fg = c.yellow, bold = true })
hi("@keyword.debug",              { fg = c.redp1 })

hi("@function",                   { fg = c.niagara })
hi("@function.builtin",           { fg = c.yellow })
hi("@function.call",              { fg = c.niagara })
hi("@function.method",            { fg = c.niagara })
hi("@function.method.call",       { fg = c.niagara })
hi("@function.macro",             { fg = c.quartz })

hi("@variable",                   { fg = c.fg1 })
hi("@variable.builtin",           { fg = c.yellow })
hi("@variable.member",            { fg = c.fg1 })
hi("@variable.parameter",         { fg = c.fg1 })
hi("@variable.parameter.builtin", { fg = c.yellow })

hi("@type",                       { fg = c.quartz })
hi("@type.builtin",               { fg = c.quartz })
hi("@type.definition",            { fg = c.quartz })
hi("@type.qualifier",             { fg = c.quartz })

hi("@string",                     { fg = c.green })
hi("@string.escape",              { fg = c.brown })
hi("@string.special",             { fg = c.brown })
hi("@string.special.url",         { fg = c.niagara, underline = true })
hi("@string.regexp",              { fg = c.brown })
hi("@number",                     { fg = c.wisteria })
hi("@number.float",               { fg = c.wisteria })
hi("@boolean",                    { fg = c.quartz })

hi("@constant",                   { fg = c.quartz })
hi("@constant.builtin",           { fg = c.quartz })
hi("@constant.macro",             { fg = c.quartz })

hi("@constructor",                { fg = c.niagara })
hi("@operator",                   { fg = c.fg })
hi("@punctuation.bracket",        { fg = c.fg })
hi("@punctuation.delimiter",      { fg = c.fg })
hi("@punctuation.special",        { fg = c.brown })

hi("@tag",                        { fg = c.niagara })
hi("@tag.attribute",              { fg = c.fg1 })
hi("@tag.delimiter",              { fg = c.quartz })

hi("@property",                   { fg = c.fg1 })
hi("@attribute",                  { fg = c.quartz })
hi("@module",                     { fg = c.quartz })
hi("@label",                      { fg = c.yellow })

-- ─── LSP Semantic Tokens ─────────────────────────────────────────────────────
-- prevents LSP from overriding treesitter colours with its own defaults

hi("@lsp.type.class",             { fg = c.quartz })
hi("@lsp.type.decorator",         { fg = c.quartz })
hi("@lsp.type.enum",              { fg = c.quartz })
hi("@lsp.type.enumMember",        { fg = c.quartz })
hi("@lsp.type.function",          { fg = c.niagara })
hi("@lsp.type.interface",         { fg = c.quartz })
hi("@lsp.type.macro",             { fg = c.quartz })
hi("@lsp.type.method",            { fg = c.niagara })
hi("@lsp.type.namespace",         { fg = c.quartz })
hi("@lsp.type.parameter",         { fg = c.fg1 })
hi("@lsp.type.property",          { fg = c.fg1 })
hi("@lsp.type.struct",            { fg = c.quartz })
hi("@lsp.type.type",              { fg = c.quartz })
hi("@lsp.type.typeParameter",     { fg = c.quartz })
hi("@lsp.type.variable",          { fg = c.fg1 })
hi("@lsp.type.keyword",           { fg = c.yellow, bold = true })
hi("@lsp.type.comment",           { fg = c.brown })
hi("@lsp.type.string",            { fg = c.green })
hi("@lsp.type.number",            { fg = c.wisteria })
hi("@lsp.type.operator",          { fg = c.fg })
hi("@lsp.type.lifetime",          { fg = c.brown })  -- Rust lifetimes

hi("@lsp.mod.deprecated",         { fg = c.bgp4,  underline = true })
hi("@lsp.mod.readonly",           { fg = c.quartz })
hi("@lsp.mod.static",             { fg = c.quartz })
hi("@lsp.mod.mutable",            { fg = c.fg1 })

-- ─── Diagnostics ─────────────────────────────────────────────────────────────
hi("DiagnosticError",               { fg = c.redp1 })
hi("DiagnosticWarn",                { fg = c.brown })
hi("DiagnosticInfo",                { fg = c.niagara })
hi("DiagnosticHint",                { fg = c.quartz })
hi("DiagnosticOk",                  { fg = c.green })
hi("DiagnosticUnderlineError",      { sp = c.red,     underline = true })
hi("DiagnosticUnderlineWarn",       { sp = c.yellow,  underline = true })
hi("DiagnosticUnderlineInfo",       { sp = c.niagara, underline = true })
hi("DiagnosticUnderlineHint",       { sp = c.quartz,  underline = true })
hi("DiagnosticVirtualTextError",    { fg = c.redp1 })
hi("DiagnosticVirtualTextWarn",     { fg = c.brown })
hi("DiagnosticVirtualTextInfo",     { fg = c.niagara })
hi("DiagnosticVirtualTextHint",     { fg = c.quartz })

-- ─── LSP References ──────────────────────────────────────────────────────────
hi("LspReferenceText",              { bg = c.bgp3 })
hi("LspReferenceRead",              { bg = c.bgp3 })
hi("LspReferenceWrite",             { bg = c.bgp3 })
hi("LspSignatureActiveParameter",   { bg = c.bgp2 })
