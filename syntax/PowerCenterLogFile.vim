" Vim syntax file
" Language:         Informatica PowerCenter logfiles
" Maintainer:       Christian Brabandt <cb@256bit.org>
" Latest Revision:  2014-10-01

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn case match
syn sync fromstart
syn keyword InformaticaKeyword contained Severity Timestamp Node Thread Message\ Code Message
syn keyword InformaticaSeverityKeyword INFO DEBUG WARNING

syn match InformaticaBracket /\[[^]]*\]/ms=s+1,me=e-1	contained
syn match InformaticaName /\([a-zA-Z_ ]\+: \)/me=e-1	contained
syn match InformaticaError /ERROR : .*$/		contained
syn match InformaticaORAError /ORA-\d\+.*$/		contained
syn match InformaticaTimestamp /\d\d\?\/\d\d\?\/\d\d\d\d \d\d\?:\d\d\?:\d\d\? [AP]M/ contained
syn match InformaticaSQL    /\[\?\zsSELECT.*\ze\]\?/	contained

syn match  InformaticaSeverity    /^[^\t]\+\t/	contains=InformaticaSeverityKeyword nextgroup=InformaticaTS
syn match  InformaticaTS          /[^\t]\+\t/	contains=InformaticaTimestamp nextgroup=InformaticaNode
syn match  InformaticaNode        /[^\t]\+\t/   nextgroup=InformaticaThread
syn match  InformaticaThread      /[^\t]\+\t/   nextgroup=InformaticaMessageCode
syn match  InformaticaMessageCode /[^\t]\+\t/   nextgroup=InformaticaMessage
syn region InformaticaMessage     start=/[^\t]\+$/ end=/^\ze\%([^\t]\+\t\)/ fold contains=InformaticaBracket,InformaticaName,InformaticaSection,InformaticaError,InformaticaORAError,InformaticaSQL
syn match InformaticaHeader /\%1l.*/
syn match InformaticaHeader2 /^\*\*\*\*.*/
syn match InformaticaSection /^\n\?.*\n=\+\n\n/  fold

hi default link InformaticaBracket      Statement
hi default link InformaticaName         Title
hi default link InformaticaHeader       Title
hi default link InformaticaHeader2      Title
hi default link InformaticaSection      Title
hi default link InformaticaTimestamp    Special
hi default link InformaticaSeverity     Keyword
hi default link InformaticaNode         Comment
hi default link InformaticaThread       Comment
hi default link InformaticaMessageCode  Comment
hi default link InformaticaORAError	ErrorMsg
hi default link InformaticaError	ErrorMsg
hi default link InformaticaSQL		Constant

let b:current_syntax = "PowerCenterLogFilFilee"

let &cpo = s:cpo_save
unlet s:cpo_save
