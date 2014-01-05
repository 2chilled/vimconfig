" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

let g:Tex_DefaultTargetFormat='pdf'

let g:Tex_GotoError=1

let g:Tex_ViewRule_pdf='evince'
let g:Tex_MultipleCompileFormats='pdf'
let g:Tex_IgnoreLevel=5
"\"Underfull\n".
"\"Overfull\n".
"\"specifier changed to\n".
"\"You have requested\n".
"\"Missing number, treated as zero.\n".
"\"There were undefined references\n"
"\"Citation %.%# undefined"
let g:Tex_CompileRule_pdf='pdflatex -interaction=nonstopmode -output-directory=tmp $*'
call IMAP('FIW', '\textit{FIW}<++>', 'tex')
call IMAP('FIF', '\textit{FIF}<++>', 'tex')
