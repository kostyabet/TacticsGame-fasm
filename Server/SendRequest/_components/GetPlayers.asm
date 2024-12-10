proc Server.SendRequest.GetPlayers
    stdcall Server.SendRequest.GET, apiHOST, [apiPORT], requestTpGET, requestPlayersURL
    ret
endp