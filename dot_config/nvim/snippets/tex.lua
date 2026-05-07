local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local opt = require("luasnip.nodes.optional_arg")
local extras = require("luasnip.extras")
local l = extras.lambda
local rep = extras.rep
local p = extras.partial
local m = extras.match
local n = extras.nonempty
local dl = extras.dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local postfix = require("luasnip.extras.postfix").postfix
local types = require("luasnip.util.types")
local parse = require("luasnip.util.parser").parse_snippet
local ms = ls.multi_snippet
local k = require("luasnip.nodes.key_indexer").new_key

return {
  s({ name = "inline math", trig = "mk" }, { t("\\( "), i(1), t(" \\)"), i(0) }),
  s({ name = "display math", trig = "dm" }, { t({ "\\[", "\t" }), i(0), t({ "", "\\]" }) }),
  s({ name = "subscript", trig = "__", wordTrig = false }, { t("_{"), i(1), t("}"), i(0) }),
  s({ name = "superscript", trig = "^^", wordTrig = false }, { t("^{"), i(1), t("}"), i(0) }),
  s({ name = "fraction", trig = "@%" }, { t("\\frac{"), i(1), t("}{"), i(2), t("}") }),
  s({ name = "hat", trig = "@^" }, { t("\\hat{"), i(1), t("}"), i(0) }),
  s({ name = "bar", trig = "@_" }, { t("\\bar{"), i(1), t("}"), i(0) }),
  s({ name = "dot", trig = "@;" }, { t("\\dot{"), i(1), t("}"), i(0) }),
  s({ name = "ddot", trig = "@:" }, { t("\\ddot{"), i(1), t("}"), i(0) }),
  s({ name = "circ", trig = "@@" }, { t("\\circ") }),
  s(
    { name = "env", trig = "env" },
    { t("\\begin{"), i(1), t({ "}", "\t" }), i(0), t({ "", "\\end{" }), rep(1), t("}") }
  ),
  s({ name = "equation", trig = "BEQ" }, { t({ "\\begin{equation}", "\t" }), i(0), t({ "", "\\end{equation}" }) }),
  s({ name = "equation*", trig = "BSEQ" }, { t({ "\\begin{equation*}", "\t" }), i(0), t({ "", "\\end{equation*}" }) }),
  s({ name = "align", trig = "BAL" }, { t({ "\\begin{align}", "\t" }), i(0), t({ "", "\\end{align}" }) }),
  s({ name = "align*", trig = "BSAL" }, { t({ "\\begin{align*}", "\t" }), i(0), t({ "", "\\end{align*}" }) }),
  s({ name = "gather", trig = "BGA" }, { t({ "\\begin{gather}", "\t" }), i(0), t({ "", "\\end{gather}" }) }),
  s({ name = "gather*", trig = "BSGA" }, { t({ "\\begin{gather*}", "\t" }), i(0), t({ "", "\\end{gather*}" }) }),
  s({ name = "multiline", trig = "BMU" }, { t({ "\\begin{multiline}", "\t" }), i(0), t({ "", "\\end{multiline}" }) }),
  s(
    { name = "multiline*", trig = "BSMU" },
    { t({ "\\begin{multiline*}", "\t" }), i(0), t({ "", "\\end{multiline*}" }) }
  ),
  s({ name = "split", trig = "BSPL" }, { t({ "\\begin{split}", "\t" }), i(0), t({ "", "\\end{split}" }) }),
  s({ name = "cases", trig = "BCAS" }, { t({ "\\begin{cases}", "\t" }), i(0), t({ "", "\\end{cases}" }) }),
  s({ name = "textnormal", trig = "FNO" }, { t("\\textnormal{"), i(1), t("}"), i(0) }),
  s({ name = "textrm", trig = "FRM" }, { t("\\textrm{"), i(1), t("}"), i(0) }),
  s({ name = "emph", trig = "FEM" }, { t("\\emph{"), i(1), t("}"), i(0) }),
  s({ name = "textsf", trig = "FSF" }, { t("\\textsf{"), i(1), t("}"), i(0) }),
  s({ name = "textit", trig = "FIT" }, { t("\\textit{"), i(1), t("}"), i(0) }),
  s({ name = "textbf", trig = "FBF" }, { t("\\textbf{"), i(1), t("}"), i(0) }),
  s({ name = "texttt", trig = "FTT" }, { t("\\texttt{"), i(1), t("}"), i(0) }),
  s({ name = "textsuperscript", trig = "FSS" }, { t("\\textsuperscript{"), i(1), t("}"), i(0) }),
  s({ name = "textsubscript", trig = "FBS" }, { t("\\textsubscript{"), i(1), t("}"), i(0) }),
  s({ name = "mathrm", trig = "MRM" }, { t("\\mathrm{"), i(1), t("}"), i(0) }),
  s({ name = "mathbf", trig = "MBF" }, { t("\\mathbf{"), i(1), t("}"), i(0) }),
  s({ name = "mathbb", trig = "MBB" }, { t("\\mathbb{"), i(1), t("}"), i(0) }),
  s({ name = "mathcal", trig = "MCA" }, { t("\\mathcal{"), i(1), t("}"), i(0) }),
  s({ name = "mathfrak", trig = "MFR" }, { t("\\mathfrak{"), i(1), t("}"), i(0) }),
  s({ name = "mathtt", trig = "MTT" }, { t("\\mathtt{"), i(1), t("}"), i(0) }),
}
