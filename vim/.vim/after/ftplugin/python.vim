" based on PEP8
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent smartindent					      " indent 4 spaces
set fileformat=unix                                                                     " lines end in LF
set textwidth=0                                                                         " no wrapping
setlocal colorcolumn=80																		                              " marker at 80 chars, disable with  - set cc=
set cinwords=if,elif,else,for,while,try,except,finally,def,classwith                    " words to start autoindent


setlocal path=src/**,tests,bin/**															                          " set location of root of project
setlocal wildignore=*/__pycache__/*,*.pyc								      					                " ignore compiled binaries
set include=^\\s*\\(from\\\|import\\)\\s*\\zs\\(\\S\\+\\s\\{-}\\)*\\ze\\($\\\|\ as\\)		" regex for defining strings to transform to include files

function! PyInclude(fname)	                            																" convert include statements to filenames
	let parts = split(a:fname, ' import ')
	let l = parts[0]
	if len(parts) > 1
		let r = parts[1]
		let joined = join([l, r], '.')
		let fp = substitute(joined, '\.', '/', 'g') . 'py'
		let found = glob(fp, 1)
		if len(found)
			return fp
		endif
	endif
	return substitute(l, '\.', '/', 'g') . 'py'
endfunction
setlocal includeexpr=PyInclude(v:fname)														                      " include expression with filename as argument
setlocal define=^\\s*\\<\\(def\\\|class\\)\\>               	
