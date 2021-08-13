" Vim syntax file
" Language: D&D 5e stat block
"
" Keywords to highlight:

syn keyword 5eLabel	Level XP Initiative HP AC Speed Fortitude Reflex Will Reach dominated stunned weakened dazed slowed Senses darkvision Resist Saving Throws fly teleport Action Points prone Close burst blast Bloodied Petrified Marked Unconscious Surprised Immobilized Helpless Deafened Blinded Restrained
syn match   5eSave "(save ends\( both\)\?)"
syn keyword 5eActionD standard move minor free		contained
syn keyword 5eActionW standard move minor free		contained
syn keyword 5eActionE standard move minor free		contained
syn keyword 5eActionR standard move minor free		contained
syn keyword 5eActionI immmediate contained

syn match 5eDaily			"^.*daily).*$" 	contains=5eActionD
syn match 5eWill			"^.*at-will).*$" 	contains=5eActionW
syn match 5eEncounter 		"^.*encounter).*$" 	contains=5eActionE
syn match 5eRecharge		"^.*recharges\? .*).*" 	contains=5eActionR
syn match 5eInterrupt		"^.*interrupt.*).*" 	contains=5eActionI
syn match 5eSecondary           "^Secondary Attack$"    
syn match 5eNonAction       "^\D\+[^\.]$"   contains=ALLBUT,x5eDaily,x5eWill,x5eEncounter,x5eRecharge,x5eInterrupt,x5eSecondary
"syn match free

syn match 5eNumber 			/+\?-\?\d\+d\?/ " match numbers, include + or - sign
syn region 5eTitle start="^.*\n.*\nLevel.*\n\?XP.*" end="XP.*$"

hi 5eDaily 			ctermbg=white 	ctermfg=black
hi 5eWill  			ctermbg=22		ctermfg=white
hi 5eEncounter 		ctermbg=88	 	ctermfg=white
hi 5eRecharge		ctermbg=55
hi 5eInterrupt		ctermbg=blue
hi 5eLabel 			cterm=bold 		ctermfg=228
hi 5ePowerText 		ctermbg=red
hi 5eTitle 			ctermbg=18 		cterm=bold 	gui=bold guifg=DeepSkyBlue2
hi 5eNumber 		ctermfg=208		guifg=goldenrod3
hi 5eSave			ctermfg=159 	cterm=bold
hi 5eActionD		ctermbg=white ctermfg=black cterm=underline
hi 5eActionW		ctermbg=22  cterm=underline
hi 5eActionE		ctermbg=88 cterm=underline
hi 5eActionR		ctermbg=55 cterm=underline
hi 5eActionI		ctermbg=blue cterm=underline
hi 5eNonAction      ctermbg=234
hi 5eSecondary      cterm=underline 
"hi 5eAction			cterm=underline

hi CursorLine 		ctermbg=none cterm=bold
set nonumber
set wrap


