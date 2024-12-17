proc Server.SendRequest.GetAllUserScores,\
    data, length, buffer, buflen
    stdcall Server.SendRequest.GET, apiHOST, [apiPORT], requestTpGET, requestScoresURL, [data], [length], [buffer], [buflen]
    ret
endp