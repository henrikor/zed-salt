; SaltStack files are parsed as Jinja. Plain YAML is highlighted through injections.scm.

(bool) @boolean
(integer) @number
(float) @number
(lit_string) @string
(identifier) @variable

(jinja_statement_open) @punctuation.special
(jinja_statement_close) @punctuation.special
(jinja_value_open) @punctuation.special
(jinja_value_close) @punctuation.special
(jinja_comment_open) @comment
(jinja_comment_content) @comment
(jinja_comment_close) @comment

["if" "elif" (jinja_else) "for" "in" "block" "endblock"
 "extends" "include" "import" "from" "as" "set" "macro"
 "endmacro" "call" "endcall" "filter" (jinja_raw) "endraw"] @keyword

["and" "or" "not" "is"] @keyword.operator

["+" "-" "*" "/" "//" "%" "**" "~"
 "==" "!=" ">" ">=" "<" "<=" "=" "|" "."] @operator
