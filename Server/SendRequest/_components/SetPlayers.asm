proc Server.SendRequest.SetPlayers
    stdcall Server.SendRequest.POST, apiHOST, [apiPORT], requestTpPOST, requestPlayersURL
    ret
endp