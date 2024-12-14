proc Server.SendRequest.PostAddPlayers,\
    data, length
    stdcall Server.SendRequest.POST, apiHOST, [apiPORT], requestTpPOST, requestPlayersURL, [data], [length]
    ret
endp