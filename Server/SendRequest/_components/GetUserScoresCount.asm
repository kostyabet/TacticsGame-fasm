proc Server.SendRequest.GetUserScoresCount,\
    data, length, buffer, buflen
    stdcall Server.SendRequest.GET, apiHOST, [apiPORT], requestTpGET, requestScoresCountURL, [data], [length], [buffer], [buflen]
    ret
endp