syn match SimEvent /\<Event\w*\>/
syn match SimEventSay /\<EventSay>/
syn match SimThreadId /ThreadId\s\d\+/
syn match SimTVarId /TVarId\s\d\+/

hi link SimEvent Structure
hi link SimEventSay String
hi link SimThreadId Identifier
hi link SimTVarId Identifier

