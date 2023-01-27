" based on PEP8
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent					" indent 4 spaces
set fileformat=unix                           " lines end in LF
set textwidth=0                               " no wrapping
setlocal colorcolumn=80																		" marker at 80 chars, disable with  - set cc=
set cinwords=if,elif,else,for,while,try,except,finally,def,classwith " words to start autoindent


setlocal path=src/**,tests,bin/**															" set location of root of project
setlocal wildignore=*/__pycache__/*,*.pyc													" ignore compiled binaries
set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)		" regex for defining strings to transform to include files
