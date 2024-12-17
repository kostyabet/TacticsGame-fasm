proc Server.SendRequest.GetIsPlayerExist,\
    data, length, buffer, buflen
    stdcall Server.SendRequest.GET, apiHOST, [apiPORT], requestTpGET, requestPlayersURL, [data], [length], [buffer], [buflen]
    ret
endp