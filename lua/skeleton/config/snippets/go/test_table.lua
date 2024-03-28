local ls = require "luasnip"

local s = ls.s
local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("go", {
  s(
    "tt",
    fmta(
      [[
tests := []struct {
  name string
}{
  {
    name: "test 1",
  },
}

for _, tt := range tests {
  t.Run(tt.name, func(t *testing.T) {
    // test code
  })
}
]], {}
    )
  )
})
