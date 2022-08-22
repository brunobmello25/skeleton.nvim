local M = {}

function M.setup()
  vim.cmd([[
    set nofoldenable
    set foldlevel=99
    set fillchars=fold:\ "empty space after backslash
    set foldtext=CustomFoldText()
    set foldmethod=expr
    set foldexpr=GetPotionFold(v:lnum)

    function! CustomFoldText()
      let indentation = indent(v:foldstart - 1)
      let foldSize = 1 + v:foldend - v:foldstart
      let foldSizeStr = " " . foldSize . " lines "
      let foldLevelStr = repeat("+--", v:foldlevel)
      let expansionString = repeat(" ", indentation)
      return expansionString . foldLevelStr . foldSizeStr
    endfunction

    function! GetPotionFold(lnum)
      if getline(a:lnum) =~? '\v^\s*$'
        return '-1'
      endif
      let this_indent = IndentLevel(a:lnum)
      let next_indent = IndentLevel(NextNonBlankLine(a:lnum))
      if next_indent == this_indent
        return this_indent
      elseif next_indent < this_indent
        return this_indent
      elseif next_indent > this_indent
        return '>' . next_indent
      endif
    endfunction

    function! IndentLevel(lnum)
        return indent(a:lnum) / &shiftwidth
    endfunction

    function! NextNonBlankLine(lnum)
      let numlines = line('$')
      let current = a:lnum + 1
      while current <= numlines
          if getline(current) =~? '\v\S'
              return current
          endif
          let current += 1
      endwhile
      return -2
    endfunction
  ]])
end

return M
