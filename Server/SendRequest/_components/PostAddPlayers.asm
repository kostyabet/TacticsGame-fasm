proc Server.SendRequest.PostAddPlayers
    stdcall Server.SendRequest.POST, apiHOST, [apiPORT], requestTpPOST, requestPlayersURL, postPlayersData, [postPlayersDataLength]
    ret
endp