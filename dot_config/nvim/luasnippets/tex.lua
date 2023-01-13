local get_visual = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Return snippet tables
return
  {
    -- GENERIC ENVIRONMENT
    s({trig="beg", snippetType="autosnippet"},
      fmta(
        [[
        \begin{<>}
            <>
        \end{<>}
      ]],
        {
          i(1),
          d(2, get_visual),
          rep(1),
        }
      ),
      {condition = line_begin}
    ),
        -- ITEMIZE
    s({trig="itt", snippetType="autosnippet"},
      fmta(
        [[
        \begin{itemize}
            \item <>
        \end{itemize}
      ]],
        {
          i(0),
        }
      ),
      {condition = line_begin}
    ),
    -- ENUMERATE
    s({trig="enn", snippetType="autosnippet"},
      fmta(
        [[
        \begin{enumerate}
            \item <>
        \end{enumerate}
      ]],
        {
          i(0),
        }
      )
    ),
    -- INLINE MATH
    s({trig = "([^%l])mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "<>$<>$",
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, get_visual),
        }
      )
    ),
    -- INLINE MATH ON NEW LINE
    s({trig = "^mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "$<>$",
        {
          i(1),
        })),
    -- FIGURE
    s({trig = "fig"},
      fmta(
        [[
        \begin{figure}[htb!]
          \centering
          \includegraphics[width=<>\linewidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
        ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
        }
      ),
      { condition = line_begin }
    ),
  }
