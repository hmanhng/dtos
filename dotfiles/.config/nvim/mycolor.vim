" Colorscheme {{{
let g:edge_transparent_background = 1
let g:edge_menu_selection_background = 'purple'
let g:edge_diagnostic_text_highlight = 1
let g:edge_diagnostic_line_highlight = 1
let g:edge_diagnostic_virtual_text = 'colored'
let g:edge_current_word = 'underline'
let g:edge_better_performance = 1

colorscheme edge
hi LineNr guifg=#ADADAD
hi CursorLineNr guifg=#F6A66F guibg=#4B4B4B
hi CursorLine guibg=#4B4B4B

"}}}

" Lightline {{{
let s:black = [ '#2b2b2b', 235 ]
let s:gray = [ '#323232', 236 ]
let s:white = [ '#a9b7c6', 250 ]
let s:blue = [ '#6897bb' , 67 ] 
let s:green = [ '#629755', 71 ] 
let s:purple = [ '#9876aa', 104 ]
let s:red = [ '#ff6b68', 204 ]
let s:yellow = [ '#ffc66d', 222 ]
let s:none = [ 'NONE', 9 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:purple ], [ s:purple, s:none ] ]
let s:p.normal.right = [ [ s:black, s:purple ], [ s:purple, s:none ] ]
let s:p.inactive.left =  [ [ s:black, s:blue ], [ s:blue, s:none ] ]
let s:p.inactive.right = [ [ s:black, s:blue ], [ s:blue, s:none ] ]
let s:p.insert.left = [ [ s:black, s:green ], [ s:green, s:none ] ] 
let s:p.insert.right = [ [ s:black, s:green ], [ s:green, s:none ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:red, s:none ] ]
let s:p.replace.right = [ [ s:black, s:red ], [ s:red, s:none ] ]
let s:p.visual.left = [ [ s:black, s:yellow ], [ s:yellow, s:none ] ]
let s:p.visual.right = [ [ s:black, s:yellow ], [ s:yellow, s:none ] ]
let s:p.normal.middle = [ [ s:white, s:none ] ]
let s:p.inactive.middle = [ [ s:white, s:none ] ]
let s:p.tabline.left = [ [ s:purple, s:none ] ]
let s:p.tabline.tabsel = [ [ s:black, s:blue ] ]
let s:p.tabline.middle = [ [ s:blue, s:none ] ]
let s:p.tabline.right = [ [ s:black, s:blue ] ]
let s:p.normal.error = [ [ s:red, s:black ] ]
let s:p.normal.warning = [ [ s:yellow, s:black ] ]

let g:lightline#colorscheme#mycolor#palette = lightline#colorscheme#flatten(s:p)
"}}}
