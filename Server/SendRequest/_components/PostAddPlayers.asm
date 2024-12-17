proc Server.SendRequest.PostAddPlayers,\
    data, length, buffer, buflen
    stdcall Server.SendRequest.POST, apiHOST, [apiPORT], requestTpPOST, requestPlayersURL, [data], [length], [buffer], [buflen]
    ret
endp