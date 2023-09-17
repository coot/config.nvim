syn clear
syn match LineNr #^-\{60,}#
syn match LineNr #\<Sing\(Idle\|Busy\)#
syn match WarningMsg #\v(client|AsClient|SingAsClient)>#
syn match MoreMsg #\v(server|AsServer|SingAsServer)>#
syn match Title #\<\(Send\|tryRecv\|Recv\|\(MsgReq\|MsgResp\)\s\d\+\)\>#
syn match Comment #\<\(Channel\.\(\w\|\.\)\+\)\>#
syn match Comment #\<\(Driver\.\(\w\|.\)\+\)\>#
