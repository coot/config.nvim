local ls = require('luasnip')
local s = ls.snippet
--[[
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
]]
local t = ls.text_node
local i = ls.insert_node
local d = ls.dynamic_node
--[[
local f = ls.function_node
local c = ls.choice_node
local r = ls.restore_node
]]

ls.add_snippets("haskell", {
  s("im", {t"import           ", i(1)}),
  s("imq", {t"import qualified ", i(1, "Data.ByteString"), t" as ", i(2, "BS")}),

  s("cl", {t"class ", i(1, "Name"), t{" where", "  "}, i(2, "name"), t" :: ", i(3)}),
  s("cs", {t"case ", i(1), t{" of", "  "}, i(2, "_"), t" -> ", i(3, "undefined")}),
  s("wh", {t{"where", "  "}, i(1, "a"), t" = ", i(2, "undefined")}),

  s("pra", {t"{-# LANGUAGE ", i(1), t" #-}"}),
  -- s("opt", {t"{-# OPTIONS_GHC ", i(1), t" #-}"}),
  --
  s("ddump", {t{"{-# OPTIONS_GHC",
                "      -fforce-recomp",
                "      -ddump-simpl",
                "      -dsuppress-all",
                "      -dsuppress-uniques",
                "#-}"}}),
  s("GHC", {t"#if __GLASGOW_HASKELL__ ", i(1,"<"), t" ", i(2, "908"), t{"", ""}, i(3), t{"", "#endif"}}),

  s("debug", {t"import qualified Debug.Trace as Debug"}),
  s("trace", {t"Debug.trace ", i(2, "\"ups\""), t" ", i(3, "undefined")}),

  s("ff", {t"foreign import ccall ", i(1, "unsafe"), t" \"", i(2, "c_name"), t"\" ", i(3, "hs_name"), t" :: ", i(4, "IO ()")}),
})

ls.add_snippets("cabalproject", {
  s("srp", {t{"source-repository-package",
                  "  type: git",
                  "  location: "}, i(1),
            t{"", "  tag: "}, i(2),
            t{"", "  subdir: "}, i(3),
           }),
})

return {}
