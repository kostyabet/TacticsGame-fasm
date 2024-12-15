proc Server.SendRequest.GetIsPlayerExist,\
    data, length
    stdcall Server.SendRequest.GET, apiHOST, [apiPORT], requestTpGET, requestPlayersURL, [data], [length]
    ret
endp