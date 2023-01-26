set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent					" indent 4 spaces
setlocal colorcolumn=80																		" lines of < 80 chars, disable with  - set cc=


setlocal path=src/**,tests,bin/**															" set location of root of project
setlocal wildignore=*/__pycache__/*,*.pyc													" ignore compiled binaries
set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)		" regex for defining strings to transform to include files
