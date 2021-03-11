" Asciidoc compiler settings for Vim

if exists("b:current_compiler")
  finish
endif
let b:current_compiler = "antora"

if exists(":CompilerSet") != 2
  command! -nargs=* CompilerSet setlocal <args>
endif

function! s:set_makeprg()
  let &l:makeprg = ''
        \. 'antora'
        \. ' --fetch'
        \. ' --stacktrace'
        \. ' %/' . get(b:, 'antora_playbook', 'antora-playbook.yml')
endfunction
antora --fetch --stacktrace antora-playbook.yml
call s:set_makeprg()
