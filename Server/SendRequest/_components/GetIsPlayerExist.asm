proc Server.SendRequest.GetIsPlayerExist
    stdcall Server.SendRequest.GET, apiHOST, [apiPORT], requestTpGET, requestPlayersURL, postPlayersData, [postPlayersDataLength]
    ret
endp